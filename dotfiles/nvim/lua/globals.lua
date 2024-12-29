-- Globals

vim.g.mapleader = ","

-- Options

vim.o.conceallevel = 2
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.termguicolors = true

-- Overrides

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.o.shiftwidth = 2
		vim.o.tabstop = 2
	end
})
