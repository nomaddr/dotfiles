return {
  -- This plugin spec hooks into LazyVim's main configuration.
  -- The 'config' function here will run after LazyVim has initialized,
  -- which includes loading your colorscheme via your theme's init.lua.
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- Disable italic styling for general keywords
      vim.cmd("highlight Keyword gui=NONE cterm=NONE")

      -- Disable italic styling for Tree-sitter specific highlight groups
      -- These are common culprits for "cursive k" and other unwanted italics.
      vim.cmd("highlight @keyword gui=NONE cterm=NONE")
      vim.cmd("highlight @function gui=NONE cterm=NONE")
      vim.cmd("highlight @function.builtin gui=NONE cterm=NONE")
      vim.cmd("highlight @variable gui=NONE cterm=NONE")
      vim.cmd("highlight @parameter gui=NONE cterm=NONE")
      vim.cmd("highlight @type gui=NONE cterm=NONE") -- Often affects types in languages like TypeScript

      -- You can add more Tree-sitter highlight groups here if you find other
      -- elements that appear italicized when you don't want them to.
      -- To find the highlight group under your cursor in Neovim, use:
      -- :echo map(nvim_get_hl_by_id(nvim_get_hl_id_by_name(vim.fn.synIDattr(vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1), "name"))), 'v:val')

      return opts -- Always return opts as is, as we're just adding side effects
    end,
    -- Set a high priority to ensure this runs late, after colorschemes have loaded.
    priority = 2000,
  },
}
