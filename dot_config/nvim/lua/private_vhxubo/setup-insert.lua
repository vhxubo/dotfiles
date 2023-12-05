local M = {}

-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L73-L79
local function get_visual_selection()
  local save_a = vim.fn.getreginfo("a")
  vim.cmd([[norm! "ay]])
  local selection = vim.fn.getreg("a", 1)
  vim.fn.setreg("a", save_a)
  return selection
end
local get_setup_node = function()
  local _, s_row, _, _ = unpack(vim.fn.getpos("'<"))
  local _, e_row, _, _ = unpack(vim.fn.getpos("'>"))
  local selection = get_visual_selection()
  local language_tree = vim.treesitter.get_string_parser(selection, "javascript")
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local query = vim.treesitter.query.parse(
    "javascript",
    [[
(lexical_declaration
  (variable_declarator
    name: (identifier) @variable
))

(function_declaration
  name: (identifier) @variable
)

(return_statement (object)) @return
    ]]
  )
  local list = {}
  local return_statement = nil
  for id, node in query:iter_captures(root, selection, root:start(), root:end_()) do
    local name = query.captures[id]
    if name == "variable" then
      local variable_name = vim.treesitter.get_node_text(node, selection)
      table.insert(list, variable_name)
    end
    if name == "return" then
      return_statement = node
    end
  end
  local variables = table.concat(list, ", ")
  local buf = vim.api.nvim_get_current_buf()
  if return_statement == nil then
    vim.api.nvim_buf_set_lines(buf, e_row, e_row, true, { "return {" .. variables .. "}" })
    return
  end
  local start_row, _, end_row, _ = return_statement:range()
  vim.api.nvim_buf_set_lines(buf, s_row + start_row - 1, s_row + end_row, false, {})
  vim.api.nvim_buf_set_lines(buf, s_row + start_row - 1, s_row + end_row - 1, false, { "return {" .. variables .. "}" })
end

local get_setup_node_list = function()
  local buf, _, _, _ = unpack(vim.fn.getpos("'<"))
  local _, e_row, _, _ = unpack(vim.fn.getpos("'>"))
  local selection = get_visual_selection()
  local language_tree = vim.treesitter.get_string_parser(selection, "javascript")
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local list = {}
  for child, _ in root:iter_children() do
    if child:type() == "lexical_declaration" then
      for _, variable in ipairs(child:named_children()) do
        if variable:type() == "variable_declarator" then
          for _, name in ipairs(variable:named_children()) do
            if name:type() == "identifier" then
              table.insert(list, vim.treesitter.get_node_text(name, selection))
            end
          end
        end
      end
    end
    if child:type() == "function_declaration" then
      for _, name in ipairs(child:named_children()) do
        if name:type() == "identifier" then
          table.insert(list, vim.treesitter.get_node_text(name, selection))
        end
      end
    end
  end
  local variables = table.concat(list, ", ")
  vim.api.nvim_buf_set_lines(buf, e_row, e_row, false, { "return {" .. variables .. "}" })
end
M.setup = function()
  vim.keymap.set({ "n", "v" }, "<leader>vs", get_setup_node)
  vim.keymap.set({ "n", "v" }, "<leader>vl", get_setup_node_list)
end

return M
