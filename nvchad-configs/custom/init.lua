vim.cmd('autocmd FileType c,h setlocal shiftwidth=2')
vim.cmd('autocmd FileType c,h setlocal tabstop=2')

vim.cmd('autocmd FileType cpp setlocal shiftwidth=2')
vim.cmd('autocmd FileType cpp setlocal tabstop=2')

vim.cmd('autocmd FileType r setlocal shiftwidth=4')
vim.cmd('autocmd FileType r setlocal tabstop=4')

vim.cmd('autocmd FileType java setlocal shiftwidth=4')
vim.cmd('autocmd FileType java setlocal tabstop=4')

vim.cmd('autocmd FileType python setlocal shiftwidth=4')
vim.cmd('autocmd FileType python setlocal tabstop=4')

vim.cmd('autocmd FileType rst setlocal shiftwidth=4')
vim.cmd('autocmd FileType rst setlocal tabstop=4')

vim.cmd('autocmd FileType gdshader setlocal shiftwidth=4')
vim.cmd('autocmd FileType gdshader setlocal tabstop=4')

vim.cmd('autocmd FileType kdl setlocal shiftwidth=4')
vim.cmd('autocmd FileType kdl setlocal tabstop=4')

vim.cmd('autocmd FileType wgsl setlocal shiftwidth=4')
vim.cmd('autocmd FileType wgsl setlocal tabstop=4')

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})
