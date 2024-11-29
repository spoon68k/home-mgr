-- ~/.config/nvim/lua/plugins/configs/telescope.lua

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()

        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

		local function map(lhs, rhs, opts)
            vim.keymap.set("n", lhs, rhs, opts or {})
		end

		telescope:setup()

		map("<C-f>", function() builtin.find_files() end)
		map("<C-b>", function() builtin.buffers() end)
		map("<C-g>", function() builtin.live_grep() end)

    end
}

