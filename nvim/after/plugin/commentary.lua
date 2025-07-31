-- autocmd FileType apache setlocal commentstring=#\ %s
-- what we're duplicating here
-- didn't work on reloading config, but _did_ work on full restart

vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform-vars",
  callback = function(args)
    -- i'm sure there's a more elegant way to write this
    vim.cmd [[setlocal commentstring=#\ %s]]
  end
})
