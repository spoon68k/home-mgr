-- ~/.config/nvim/lua/plugins/configs/harpoon.lua

return {        
    "ThePrimeagen/harpoon",
	branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
	config = function()

		local harpoon = require("harpoon")
        local notify = require("notify")

		local function map(lhs, rhs, opts)
            vim.keymap.set("n", lhs, rhs, opts or {})
		end

		harpoon:setup()

		map("<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

		map("<leader>ha", function()
            harpoon:list():add()
            notify("Harpooned!")
        end)

        map("<leader>hc", function()
            harpoon:list():clear()
            notify("Harpoon list cleared.")
        end)

        map("<leader>h<left>", function() harpoon:list():prev() end)
        map("<leader>h<right>", function() harpoon:list():next() end)

		map("<c-h>1", function() harpoon:list():select(1) end)
		map("<c-h>2", function() harpoon:list():select(2) end)
		map("<c-h>3", function() harpoon:list():select(3) end)
		map("<c-h>4", function() harpoon:list():select(4) end)
		map("<c-h>5", function() harpoon:list():select(5) end)
		map("<c-h>6", function() harpoon:list():select(6) end)
		map("<c-h>7", function() harpoon:list():select(7) end)
		map("<c-h>8", function() harpoon:list():select(8) end)
		map("<c-h>9", function() harpoon:list():select(9) end)
    end
}
