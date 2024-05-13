local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', '<cmd> Telescope live_grep <CR>')
--vim.keymap.set('n', '<leader>ps', function()
--  builtin.grep_string({
--    search = vim.fn.input("Grep > "),
--    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--  })
--end)
