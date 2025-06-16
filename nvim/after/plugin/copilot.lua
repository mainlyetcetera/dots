local chat = require("CopilotChat")

chat.setup {
    model = "claude-3.5-sonnet",
    -- model = "gpt-4.1",
    -- putting this here, as want to go back and put ranges instead
    -- selection = select.visual
    window = {
        width = 70,
        height = 20,
        layout = 'float',
        title = 'nurd',
        zindex = 10,
        row = 0.5,
        col = 102,
    },
}

-- chat
vim.keymap.set("n", "<leader>gc", "<cmd>CopilotChat<CR>")
vim.keymap.set("n", "<leader>ge", "<cmd>CopilotChatExplain<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>CopilotChatFix<CR>")
vim.keymap.set("v", "<leader>gf", "<cmd>CopilotChatFix<CR>")
vim.keymap.set("n", "<leader>gt", "<cmd>CopilotChatTests<CR>")
vim.keymap.set("n", "<leader>go", "<cmd>CopilotChatOptimize<CR>")

-- copilot
vim.keymap.set("n", "<leader>gp", "<cmd>Copilot panel<CR>")
