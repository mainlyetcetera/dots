vim.opt.belloff = "all"
-- vim.opt.shiftwidth = 1
-- vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
-- vim.opt.numberwidth = 5
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- vim.opt.softtabstop = 4
-- vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.swapfile = false
vim.opt.incsearch = true
vim.opt.scrolloff = 6
vim.opt.completeopt = "menuone,preview,noinsert,noselect,popup"
-- vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.guifont = "Monaco:h10"
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.formatoptions:remove "t"
vim.opt.formatoptions:remove "o"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.filetype.indent = "on"

NERDTreeShowHidden = 1
