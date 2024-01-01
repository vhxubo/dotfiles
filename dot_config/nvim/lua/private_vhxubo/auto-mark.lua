local function set_vue_marks()
  local bufrn = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_del_mark(bufrn, "i")
  vim.api.nvim_buf_del_mark(bufrn, "s")
  vim.api.nvim_buf_del_mark(bufrn, "r")
  local i_row, i_col = unpack(vim.fn.searchpos("^import", "nbce"))
  if i_row ~= 0 or i_col ~= 0 then
    vim.api.nvim_buf_set_mark(bufrn, "i", i_row, i_col, {})
  else
    local ip_row, ip_col = unpack(vim.fn.searchpos("<script>", "nbce"))
    if ip_row ~= 0 or ip_col ~= 0 then
      vim.api.nvim_buf_set_mark(bufrn, "i", ip_row, 0, {})
    end
  end

  local s_row, s_col = unpack(vim.fn.searchpos("setup(", "nbce"))
  if s_row ~= 0 or s_col ~= 0 then
    vim.api.nvim_buf_set_mark(bufrn, "s", s_row, s_col, {})
  end

  -- https://vim.fandom.com/wiki/Search_across_multiple_lines#Searching_for_multiline_HTML_comments
  local r_row, r_col = unpack(vim.fn.searchpos([[return {\_.\{-}}]], "nbce"))
  if r_row ~= 0 or r_col ~= 0 then
    vim.api.nvim_buf_set_mark(bufrn, "r", r_row, r_col - 1, {})
  end
end

vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost", "BufEnter" }, {
  pattern = { "*.vue", "*.js" },
  callback = function()
    set_vue_marks()
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue" },
  callback = function()
    vim.keymap.set("n", "<LocalLeader>i", "/ } from 'vue'<cr>")
    vim.keymap.set("n", "<LocalLeader>om", "/onMounted(<cr>")
    vim.keymap.set("n", "<LocalLeader>m", "/mounted<cr>")
    vim.keymap.set("n", "<LocalLeader>f", "/function<cr>")
    vim.keymap.set("n", "<LocalLeader>d", "/data(<cr>")
    vim.keymap.set("n", "<LocalLeader>p", "/props:<cr>")
    vim.keymap.set("n", "<LocalLeader>m", "/methods:<cr>")
    vim.keymap.set("n", "<LocalLeader>c", "/created(<cr>")
    vim.keymap.set("n", "<LocalLeader>s", "/setup(<cr>")
    vim.keymap.set("n", "<LocalLeader>S", "/style><cr>")
    vim.keymap.set("n", "<LocalLeader>r", "/ref(<cr>")
    vim.keymap.set("n", "<LocalLeader>R", "/reactive(<cr>")
    -- https://stackoverflow.com/a/36093341/21614895
    -- \zs is amazing
    vim.keymap.set("n", "<LocalLeader>C", [[/components: {\_.\{-}\zs}<cr>]])
  end,
})
