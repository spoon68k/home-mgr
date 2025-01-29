-- Load friendly-snippets

return {
  	"L3MON4D3/LuaSnip",
  	-- follow latest release.
  	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  	-- install jsregexp (optional!).
  	build = "make install_jsregexp",

    config = function()

        -- require("luasnip.loaders.from_vscode").lazy_load()

        local ls = require('luasnip')

        ls.add_snippets("all", {
            ls.parser.parse_snippet(
                'func',
                'function ${1}(${2})\n{\n\t${3}\n}'
            ),
            ls.parser.parse_snippet(
                'def',
                'def ${1}(${2}) -> ${3}:\n\t${4}'
            )
        })

        vim.keymap.set({"i"}, "<C-k>", function()
            if ls.expand_or_jumpable() then
               ls.expand_or_jump()
            end
        end, {silent = true})

    end
}


