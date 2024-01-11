function create_journal_note()

    local function add_days_to_date(date, days)
        return os.date('%Y%m%d', os.time({year=os.date('%Y', date), month=os.date('%m', date), day=os.date('%d', date)}) + days * 86400)
    end

    local function get_adjusted_date(offset)
        local date = os.time()
        local day_of_week = os.date('*t', date).wday  -- 1 = Sunday, 2 = Monday, ..., 7 = Saturday

        -- Adjust for weekends
        if day_of_week == 1 and offset < 0 then  -- Sunday and going back
            date = date + (offset - 2) * 86400
        elseif day_of_week == 7 and offset > 0 then  -- Saturday and going forward
            date = date + (offset + 2) * 86400
        else
            date = date + offset * 86400
        end

        return os.date('%Y%m%d', date)
    end

    local today = os.date('%Y%m%d')
    local prev_day = get_adjusted_date(-1)
    local next_day = get_adjusted_date(1)

    local lines_to_insert = {
        '#Journal',
        '',
        '# Daily Journal for ' .. os.date('%Y-%m-%d'),
        '',
        '- [Prev](' .. prev_day .. ')',
        '- [Next](' .. next_day .. ')',
        '',
        '## Checklist',
        '',
        '## Meetings',
        ''
        '## Notes',
        ''
    }

    -- create a blank file for tomorrow
    vim.cmd('e ' .. os.getenv('ZK_NOTEBOOK_DIR') .. '/' .. next .. '.md')
    vim.cmd('write')

    -- create a journal for today, incorporating anythng already stored
    vim.cmd('e ' .. os.getenv('ZK_NOTEBOOK_DIR') .. '/' .. today .. '.md')
    local existing_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local combined_lines = vim.tbl_extend('force', lines_to_insert, existing_lines)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, combined_lines)
    vim.cmd('write')
end

function insert_current_date()
    local today = os.date('%Y-%m-%d')
    vim.api.nvim_put({today}, '', true, true)
end

require("toggleterm").setup {
    open_mapping = [[<C-t>]],
    direction = "float"
};

require("auto-save").setup {
    enable = true;
};

require("telescope").load_extension('harpoon');

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', '<CR>', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        bufmap('n', 'gS', '<cmd>Telescope lsp_document_symbols<cr>')
        bufmap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', 'gW', '<cmd>Telescope lsp_workspace_symbols<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
});

