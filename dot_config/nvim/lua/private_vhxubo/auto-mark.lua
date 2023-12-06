local function set_vue_marks()
  local bufrn = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_del_mark(bufrn, "i")
  vim.api.nvim_buf_del_mark(bufrn, "s")
  vim.api.nvim_buf_del_mark(bufrn, "r")
  local i_row, i_col = unpack(vim.fn.searchpos("^import", "nbce"))
  -- print(i_row, i_col)
  if i_row ~= 0 or i_col ~= 0 then
    vim.api.nvim_buf_set_mark(bufrn, "i", i_row, i_col, {})
  end

  local s_row, s_col = unpack(vim.fn.searchpos("setup(", "nbce"))
  if s_row ~= 0 or s_col ~= 0 then
    vim.api.nvim_buf_set_mark(bufrn, "s", s_row, s_col, {})
  end

  local r_row, r_col = unpack(vim.fn.searchpos("return {.*}$", "nbce"))
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
