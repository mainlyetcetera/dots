local dap = require('dap')
local ui = require('dapui')
local text = require('nvim-dap-virtual-text')

-- require('dapui').setup()
-- ui.setup()
-- text.setup()

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

-- prettier.setup({
--   bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
--   filetypes = {
--     "css",
--     "graphql",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "json",
--     "less",
--     "markdown",
--     "scss",
--     "typescript",
--     "typescriptreact",
--     "yaml",
--   },
-- })

