
-- Traditional yanking behaviour
vim.api.nvim_set_keymap("", "Y", 'Y', { noremap=true })

-- Explorer (Tree) Navigation (other mappings in config)
vim.api.nvim_set_keymap("n", "e", ":NvimTreeToggle<enter>", { noremap=false })

-- Clear selection
vim.api.nvim_set_keymap("n", "<leader>/", ":noh<enter>", { noremap=false })

-- Obsidian tags
vim.api.nvim_set_keymap("n", "<leader>zz", ":ObsidianToday<enter>", { noremap=false })
vim.api.nvim_set_keymap("n", "<leader>zt", ":ObsidianTags<enter>", { noremap=false })
vim.api.nvim_set_keymap("n", "<leader>zn", ":ObsidianNew<enter>", { noremap=false })
vim.api.nvim_set_keymap("n", "<leader>zl", ":ObsidianLinks<enter>", { noremap=false })
vim.api.nvim_set_keymap("v", "<leader>zl", ":ObsidianLink<enter>", { noremap=false })
vim.api.nvim_set_keymap("n", "<leader>zd", ":ObsidianDailies<enter>", { noremap=false })
vim.api.nvim_set_keymap("n", "<leader>zs", ":ObsidianQuickSwitch<enter>", { noremap=false })
vim.api.nvim_set_keymap("n", "<leader>zh", ":ObsidianQuickSwitch " .. Env_Opening_Note .. "<enter>", { noremap=false })

-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})
-- -- twilight
-- vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})
-- -- buffers
-- vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})
-- -- files
-- vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
-- vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
-- vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
-- --
-- -- splits
-- --
-- vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
-- vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")
-- -- Quicker close split
-- vim.keymap.set("n", "<leader>qq", ":q<CR>",
--   {silent = true, noremap = true}
-- )
-- 
-- -- Keymaps for better default experience
-- -- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- 
-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- 
-- -- Noice
-- vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", {noremap=true})
-- 
-- vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
--   {silent = true, noremap = true}
-- )
