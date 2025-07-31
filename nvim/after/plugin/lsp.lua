local lsp = require("lsp-zero")

lsp.preset("recommended")

-- lsp.ensure_installed({
--   'tsserver',
--   'rust_analyzer',
--   'lua_ls',
-- })

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  -- enter doing normal enter things, blocking this in insert mode
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

vim.lsp.set_log_level("info")

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() print('grabbing definition') vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- how do i stop the lsp if it's too much on the buffer? how to turn off?!
  vim.keymap.set("n", "<leader>vrc", function() vim.lsp.stop_client() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader><leader>fc", vim.lsp.stop_client, opts)
end)

require'lspconfig'.omnisharp.setup {
  cmd = { "dotnet", "/home/chimaera/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  root_dir = vim.loop.cwd,
  filetypes = { "cs", "vb" },
  settings = {
    FormattingOptions = {
      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      EnableEditorConfigSupport = true,
      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      OrganizeImports = nil,
    },
    MsBuild = {
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      LoadProjectsOnDemand = nil,
    },
    RoslynExtensionsOptions = {
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      EnableAnalyzersSupport = nil,
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      EnableImportCompletion = nil,
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      AnalyzeOpenDocumentsOnly = nil,
    },
    -- Sdk = {
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      -- IncludePrereleases = true,
    -- },
  },
}

require('lspconfig').pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = {"W191", "E101", "W293"}, -- Example: Ignore tab-related warnings
                    maxLineLength = 100
                },
                pylint = {
                    enabled = false -- Disable pylint if you only want specific errors
                },
                flake8 = {
                    enabled = false, -- Disable flake8 if needed
                    ignore = {"W293"} -- Example: Ignore tab-related warnings
                }
            }
        }
    }
}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

