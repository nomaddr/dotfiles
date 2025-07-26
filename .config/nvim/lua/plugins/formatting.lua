return {
  -- Enhanced formatting with conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Web Development
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "yamlfmt" },

        -- Programming Languages
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        java = { "google-java-format" },

        -- Shell & Config
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },

        -- Markdown (disabled auto-formatting)
        -- markdown = { "prettier" },

        -- Other formats
        toml = { "taplo" },
      },

      -- Format on save
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },

      -- Custom formatters configuration
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" }, -- 2 spaces, indent case statements
        },
        prettier = {
          prepend_args = { "--tab-width", "2" },
        },
      },
    },
  },

  -- Enhanced linting with nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Web Development
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },

        -- Programming Languages
        python = { "flake8" },
        go = { "golangci-lint" },

        -- Shell
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        zsh = { "shellcheck" },

        -- Docker
        dockerfile = { "hadolint" },
      },
    },
  },
}
