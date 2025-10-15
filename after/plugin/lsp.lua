-- ====================
-- Completion settings
-- ====================
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(4),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
})

-- ====================
-- Global LSP settings
-- ====================

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.lsp.config("*", {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>fm', function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'gu', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
    end
})

-- ===================
-- Per server settings
-- ===================
-- require('lspconfig').kotlin_language_server.setup({})
-- require('lspconfig').jdtls.setup({})
-- require('lspconfig').marksman.setup({})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

vim.lsp.config('ts_ls', {})
vim.lsp.config('gopls', {})
vim.lsp.config('golangci_lint_ls', {})
vim.lsp.config('rust_analyzer', {})

-- ====================
-- UI settings
-- ===================

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- ===================
-- Signature help
-- ===================

require('lsp_signature').setup({
    bind = true,
    handler_opts = {
        border = 'rounded'
    },
    floating_window = true,
})

-- ===================
-- Enable servers
-- ===================

vim.lsp.enable({
    'lua_ls',
    'ts_ls',
    'gopls',
    'golangci_lint_ls',
    'rust_analyzer',
})
