vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("n", "<leader>vs", ":%s/\\v")

-- this says Rg not a command
-- vim.keymap.set("n", "<Leader>ps", "<cmd>Rg<SPACE><CR>")

vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<BS>", "<cmd>nohlsearch<CR>")
-- -- vim.keymap.set("n", "<leader>pv", "wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
vim.keymap.set("n", "<Leader>=", "<C-W>=<CR>")
vim.keymap.set("n", "<Leader>0", "<C-W>_")
vim.keymap.set("n", "<Leader>r", "<cmd>resize 30<CR>")
vim.keymap.set("n", "<Leader>+", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<Leader>-", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<leader>m", "<cmd>MaximizerToggle!<CR>")
vim.keymap.set("n", "<leader>am", "<cmd>sp<CR><cmd>res 30<CR><C-W>j<cmd>term<CR>i")
vim.keymap.set("n", "<leader>iv", "<cmd>e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>ne", "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", "<cmd>NERDTreeFind<CR>")
vim.keymap.set("n", "<leader>7", "<C-^><CR>")
-- do i actually still need this for some reason?
vim.keymap.set("n", "<Space>", "<nop>")
vim.keymap.set("n", "<leader><ENTER>", "i <Esc>r<ENTER>")

vim.keymap.set("n", "<leader>sn", "<cmd>set relativenumber!<CR>")
vim.keymap.set("n", "ygy", '"+yy"*yy')
vim.keymap.set("n", "ygf", 'gg0"+yGgg0"*yG')
vim.keymap.set("n", "ygE", '"+yE"*yE')
vim.keymap.set("n", "ygp", '"+yip"*yip')
vim.keymap.set("n", "ygw", '"+yiw"*yiw')
vim.keymap.set("n", "yge", '^v$h"+y^v$h"*y')
vim.keymap.set("n", "ygq", '"+yi""*yi"')

-- this sets up the prompt for Emmet to put in html with emmet syntax
vim.keymap.set("n", "<leader>em", "<cmd>Emmet<CR>")

vim.keymap.set("n", "<leader>sv", "<cmd>so ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>sc", "<cmd>so ~/.config/nvim/lua/beginning/packer.lua<CR>")
vim.keymap.set("n", "<leader>ev", "<cmd>e ~/.vimrc<CR>")

-- add text block
vim.keymap.set("n", '<leader><leader>lk', 'i```<Esc>yypk$alng<Esc>b')

-- cheatsheets
vim.keymap.set("n", '<leader>csv', '<cmd>vsp<CR><C-W>l<cmd>sp<CR><cmd>e ~/cheatsheets/vim.md<CR><C-W>j<cmd>e ~/cheatsheets/intros/vim.txt<CR><C-W>k<cmd>vert res 60<CR>')
vim.keymap.set("n", '<leader>cst', '<cmd>vsp<CR><C-W>l<cmd>sp<CR><cmd>e ~/cheatsheets/tmux.md<CR><C-W>j<cmd>e ~/cheatsheets/intros/tmux.txt<CR><C-W>k<cmd>vert res 60<CR>')
vim.keymap.set("n", '<leader>csm', '<cmd>vsp<CR><C-W>l<cmd>sp<CR><cmd>e ~/cheatsheets/vimium.md<CR><C-W>j<cmd>e ~/cheatsheets/intros/vimium.txt<CR><C-W>k<cmd>vert res 60<CR>')

-- nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<Leader>qfs", "<cmd>lua vim.diagnostic.set_qflist()<CR>")

-- quickfix list
vim.keymap.set("n", "<leader>qfc", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader><leader>qfo", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>qfh", "<cmd>chistory<CR>")

-- think previous and next on this, even though I know that's not _technically_ correct
vim.keymap.set("n", "<leader>qfp", "<cmd>colder<CR>")
vim.keymap.set("n", "<leader>qfn", "<cmd>cnewer<CR>")

-- try new keymap for navigating qf list
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>", { silent = true })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { silent = true })

-- keymaps navigate args list
vim.keymap.set("n", "<leader>ap", "<cmd>prev<CR>")
vim.keymap.set("n", "<leader>an", "<cmd>next<CR>")
