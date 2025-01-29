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

-- File type overrides

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.o.shiftwidth = 2
		vim.o.tabstop = 2
	end
})

-- Function to insert today's date

local function insert_today_date()
  local today = tostring(os.date("%Y-%m-%d"))
  vim.api.nvim_put({ today }, 'c', true, true)
end

-- Map <leader>dt using vim.keymap.set
vim.keymap.set('n', '<leader>dt', insert_today_date, { noremap = true, silent = true })

