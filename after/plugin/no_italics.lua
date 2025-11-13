local function disable_italics()
  local groups = {
    "@lsp.type.comment",
    "@lsp.type.variable",
    "@lsp.type.parameter",
    "@lsp.type.property",
    "@lsp.type.function",
    "@lsp.type.method",
    "@lsp.type.keyword",
    "@lsp.typemod.variable.readonly",
    "@function",
    "@property",
    "@method",
    "@variable",
    "@variable.parameter",
    "@keyword",
    "@type",
  }

  for _, group in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })
    if hl then
      hl.italic = false
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end

disable_italics()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = disable_italics,
})

