--

return {
    'akinsho/toggleterm.nvim',
    lazy = false,
    version = "*",
    config = function ()

        local term = require("toggleterm")
        local trim_spaces = true

        term.setup({
            open_mapping = '<C-t>',
            direction = 'float'
        })

        vim.keymap.set("n", "<leader>r", function()
            term.send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        end)

        vim.keymap.set("v", "<leader>r", function()
            term.send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
        end)

        vim.api.nvim_set_keymap("t", "<C-W><Up>", [[<C-\><C-n><C-w><Up>]], { noremap = false })
        vim.api.nvim_set_keymap("t", "<C-W><Down>", [[<C-\><C-n><C-w><Down>]], { noremap = false })
        vim.api.nvim_set_keymap("t", "<C-W><Left>", [[<C-\><C-n><C-w><Left>]], { noremap = false })
        vim.api.nvim_set_keymap("t", "<C-W><Right>", [[<C-\><C-n><C-w><Right>]], { noremap = false })

        local function toggle_hterm()
          local win_height = vim.api.nvim_win_get_height(0)
          local term_size = math.floor(win_height * 0.5)
          local toggle_cmd = string.format("ToggleTerm direction=horizontal size=%d", term_size)
          vim.cmd(toggle_cmd)
        end

        local function toggle_vterm()
          local win_width = vim.api.nvim_win_get_width(0)
          local term_size = math.floor(win_width * 0.5)
          local toggle_cmd = string.format("ToggleTerm direction=vertical size=%d", term_size)
          vim.cmd(toggle_cmd)
        end

        vim.keymap.set('n', '<leader>ht', toggle_hterm, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>vt', toggle_vterm, { noremap = true, silent = true })

    end
}
