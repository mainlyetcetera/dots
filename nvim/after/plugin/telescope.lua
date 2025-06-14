local builtin = require('telescope.builtin')
-- local actions = require('telescope.actions')
-- local themes = require('telescope.themes')
local config = require('telescope.config')
-- local setup = require('telescope.setup')

local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, '--hidden')
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = vimgrep_arguments
    },
    pickers = {
        find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' }
        },
    },
    sorting_strategy = "ascending",
    -- sorting_strategy = "descending",
    layout_strategy = 'vertical'
}

require('telescope').setup()

-- local defaults = require('telescope.defaults')
-- local preview = require('telescope.defaults.preview')

-- builtin.find_files(themes.get_ivy())
-- builtin.planets({show_pluto = true})

-- preview.set_env({
    -- COLORTERM = "truecolor"
-- })

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pc', builtin.commands, {})
-- can this start the picker in normal mode?
vim.keymap.set('n', '<leader>pp', builtin.command_history, {})
vim.keymap.set('n', '<leader>pm', builtin.keymaps, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > ") ,
        additional_args = {
            "--hidden"
        }
    })
end)

-- builtin.command_history({opts})          *telescope.builtin.command_history()*
-- builtin.quickfix({opts})                        *telescope.builtin.quickfix()*
-- actions.send_selected_to_qflist({prompt_bufnr}) *telescope.actions.send_selected_to_qflist()*

vim.keymap.set('n', '<leader>qfo', builtin.quickfix, {})
vim.keymap.set('n', '<leader>pd', function()
    builtin.diagnostics({ bufnr = 0 })
end)

-- vim.keymap.set('n', '<leader>qfs', actions.send_selected_to_qflist, {})
-- vim.keymap.set('i', '<leader>qfs', function()
--     actions.send_to_qflist(0)
-- end)
