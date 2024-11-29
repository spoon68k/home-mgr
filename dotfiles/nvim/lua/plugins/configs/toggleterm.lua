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

--		vim.keymap.set("n", "<C-t>", function()
--            term.toggle()
--        end)

        vim.keymap.set("v", "<space>s", function()
            term.send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        end)
    end

}
