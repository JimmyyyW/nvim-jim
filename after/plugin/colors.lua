-- require('onedark').setup {
--     style = 'cool'
-- }

-- require('onedark').load()
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

return {
    {
        'asilvam133/rose-pine.nvim',
        name = 'rose-pine',
        lazy = false,
        opts = {
            transparent_background = true,
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            highlight_groups = {
                NormalFloat = { bg = 'none' },
                Normal = { bg = 'none' },
                TelescopeTitle = { fg = 'none', bg = 'none' },
                TelescopePromptTitle = { fg = 'none', bg = 'none'},
                TelescopePromptNormal = { fg = 'base', bg = 'none' },

                TelescopePreviewTitle = { fg = 'none', bg = 'none'},
                TelescopePreviewNormal = { fg = 'none', bg = 'none' },

                TelescopeResultsNormal = { fg = 'none', bg = 'none' },
                TelescopeResultsTitle = { fg = 'none', bg = 'none' },
                TelescopeResultsBorder = { fg = 'none', bg = 'none' },

                TelescopeSelection = { fg = 'none', bg = 'none' },
                TelescopeBorder = { fg = 'none', bg = 'none' },
                TelescopeNormal = { bg = 'none' },
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
           -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
           -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
           -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
           -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
           -- vim.api.nvim_set_hl(0, "TelescopeNormalFloat", { bg = "none" })
           -- vim.api.nvim_set_hl(0, "TelescopeNormalFloat", { bg = "none" })
        end,
    },
}
