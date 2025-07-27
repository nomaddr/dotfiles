-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set spell checking for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Enable spell checking for Markdown files
    vim.opt_local.spell = true -- Use vim.opt_local to set for current buffer only

    -- Configure spell languages for both German and English
    -- Use en_us for US English, en_gb for British English, de for German
    vim.opt_local.spelllang = "en_us,de"
  end,
  desc = "Enable and configure spell check for Markdown files",
})
