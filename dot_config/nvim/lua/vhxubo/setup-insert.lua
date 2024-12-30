local M = {}

-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L73-L79
local function get_visual_selection()
  local save_a = vim.fn.getreginfo("a")
  vim.cmd([[norm! "ay]])
  local selection = vim.fn.getreg("a", 1)
  vim.fn.setreg("a", save_a)
  return selection
end

local get_setup_node_item = function(root, bufrn)
  local list = {}
  local return_statement = nil
  for child, _ in root:iter_children() do
    if child:type() == "lexical_declaration" then
      for _, variable in ipairs(child:named_children()) do
        if variable:type() == "variable_declarator" then
          for _, name in ipairs(variable:named_children()) do
            if name:type() == "identifier" then
              table.insert(list, vim.treesitter.get_node_text(name, bufrn))
            end
            if name:type() == "object_pattern" then
              for _, property in ipairs(name:named_children()) do
                if property:type() == "shorthand_property_identifier_pattern" then
                  table.insert(list, vim.treesitter.get_node_text(property, bufrn))
                end
                if property:type() == "pair_pattern" then
                  for _, ident in ipairs(property:named_children()) do
                    if ident:type() == "identifier" then
                      table.insert(list, vim.treesitter.get_node_text(ident, bufrn))
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if child:type() == "function_declaration" then
      for _, name in ipairs(child:named_children()) do
        if name:type() == "identifier" then
          table.insert(list, vim.treesitter.get_node_text(name, bufrn))
        end
      end
    end
    if child:type() == "return_statement" then
      return_statement = child
    end
  end
  local variables = table.concat(list, ", ")
  return variables, return_statement
end

local get_setup_node = function(script_node, bufrn, offset)
  local script_text = vim.treesitter.get_node_text(script_node, bufrn)
  local language_tree = vim.treesitter.get_string_parser(script_text, "javascript")
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local query = vim.treesitter.query.parse(
    "javascript",
    [[
(export_statement
  (object
    (method_definition 
      (property_identifier) @setup_name
      (#eq? @setup_name "setup")
      (statement_block) @setup_body)))
    ]]
  )
  local setup_node = nil
  for id, node in query:iter_captures(root, script_text, root:start(), root:end_()) do
    local name = query.captures[id]
    if name == "setup_body" then
      setup_node = node
    end
  end
  if setup_node == nil then
    error("Can't query setup_node")
    return
  end
  local return_variables, return_statement = get_setup_node_item(setup_node, script_text)
  if return_statement == nil then
    error("can't find return_statement")
    return
  end
  local s_row, s_col, e_row, e_col = return_statement:range()
  local start_row = offset + s_row
  local end_row = offset + e_row
  vim.api.nvim_buf_set_text(bufrn, start_row, s_col, end_row, e_col, { "return { " .. return_variables .. " }" })
end

local get_script_node = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local root = vim.treesitter.get_parser(bufnr, "vue"):parse()[1]:root()
  local query = vim.treesitter.query.parse("vue", [[(script_element (raw_text) @raw_text)]])
  local script_node = nil
  for _, node in query:iter_captures(root, bufnr, 0, -1) do
    script_node = node
  end
  if script_node == nil then
    error("Can't find script_node")
    return
  end
  local offset = script_node:range()
  get_setup_node(script_node, bufnr, offset)
end

local get_setup_node_list = function()
  local buf, _, _, _ = unpack(vim.fn.getpos("v"))
  local _, e_row, _, _ = unpack(vim.fn.getpos("."))
  local cursor_pos = vim.fn.getpos(".")
  local selection = get_visual_selection()
  local language_tree = vim.treesitter.get_string_parser(selection, "javascript")
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local variables = get_setup_node_item(root, selection)
  vim.api.nvim_buf_set_lines(buf, e_row, e_row, false, { "return {" .. variables .. "}" })
  vim.fn.setpos(".", cursor_pos)
end

M.setup = function()
  vim.keymap.set({ "n", "v" }, "<leader>vl", get_setup_node_list)
  vim.keymap.set({ "n", "v" }, "<leader>vs", get_script_node)
end

return M
