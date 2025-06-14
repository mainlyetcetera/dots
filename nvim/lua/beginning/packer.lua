-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- vim.cmd('colorscheme rose-pine')

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use ('nvim-treesitter/playground')

  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'github/copilot.vim'
  use 'preservim/nerdtree'
  use 'szw/vim-maximizer'
  use 'mileszs/ack.vim'
  use 'https://tpope.io/vim/surround.git'
  use 'https://tpope.io/vim/repeat.git'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use 'https://github.com/tpope/vim-commentary'
  use 'mfussenegger/nvim-jdtls'
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  use {
   'mfussenegger/nvim-dap',
    requires = {
      {'rcarriga/nvim-dap-ui'},
      {'theHamsta/nvim-dap-virtual-text'},
      {'nvim-neotest/nvim-nio'},
      {'williamboman/mason-lspconfig.nvim'},
    }
  }

  use {
      'CopilotC-Nvim/CopilotChat.nvim',
      requires = {
          { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
          { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
          { "gptlang/lua-tiktoken" },
      }
  }

  use 'mfussenegger/nvim-dap-python'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
end)

-- return {
--   {
--     "CopilotC-Nvim/CopilotChat.nvim",
--     dependencies = {
--       { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
--       { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
--     },
--     build = "make tiktoken", -- Only on MacOS or Linux
--     opts = {
--       -- See Configuration section for options
--     },
--     -- See Commands section for default commands if you want to lazy load on them
--   },
-- }
