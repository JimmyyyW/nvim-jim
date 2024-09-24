local lsp_zero = require('lsp-zero')
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

lsp_zero.setup()

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'gu', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>rn', function () vim.lsp.buf.rename() end, { buffer = bufnr })
end)
vim.keymap.set('n', '<leader>fm', '<cmd>LspZeroFormat<CR>')

require('lsp_signature').setup({
    bind = true,
    handler_opts = {
        border = 'rounded'
    }
})
require('lspconfig').tsserver.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').golangci_lint_ls.setup({})
require('lspconfig').kotlin_language_server.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
require('lspconfig').jdtls.setup({})
