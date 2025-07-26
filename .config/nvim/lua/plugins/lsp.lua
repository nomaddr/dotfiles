return {
  -- Comprehensive LSP setup for web dev, systems, and game development
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Web Development Core
        tsserver = {}, -- TypeScript/JavaScript
        tailwindcss = {}, -- Tailwind CSS
        html = {}, -- HTML support
        cssls = {}, -- CSS support
        emmet_ls = {}, -- Emmet abbreviations
        jsonls = {}, -- JSON with schema validation

        -- Systems & DevOps
        bashls = {}, -- Bash scripting
        yamlls = {}, -- YAML files
        dockerls = {}, -- Dockerfile support
        terraformls = {}, -- Terraform/HCL

        -- Documentation & Config
        marksman = {}, -- Markdown
        lemminx = {}, -- XML support
        taplo = {}, -- TOML files

        -- Programming Languages
        lua_ls = {}, -- Lua (for Neovim config)
        clangd = {}, -- C/C++ (for game dev)
        gopls = {}, -- Go
        pyright = {}, -- Python
        jdtls = {}, -- Java
      },
    },
  },

  -- Enhanced treesitter parsers for all languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Web Development
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "json",
        "jsonc",

        -- Systems & DevOps
        "bash",
        "yaml",
        "dockerfile",
        "hcl", -- Terraform

        -- Documentation & Config
        "markdown",
        "markdown_inline",
        "xml",
        "toml",

        -- Programming Languages
        "lua",
        "c",
        "cpp",
        "go",
        "python",
        "java",

        -- Additional useful parsers
        "vim",
        "vimdoc",
        "query",
        "regex",
      })
    end,
  },

  -- Mason ensure installation of LSP servers and tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- LSP Servers
        "typescript-language-server",
        "tailwindcss-language-server",
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "json-lsp",
        "bash-language-server",
        "yaml-language-server",
        "dockerfile-language-server",
        "terraform-ls",
        "marksman",
        "lemminx",
        "taplo",
        "lua-language-server",
        "clangd",
        "gopls",
        "pyright",
        "jdtls",

        -- Formatters & Linters
        "prettier", -- Web dev formatting
        "eslint_d", -- JavaScript linting
        "stylua", -- Lua formatting
        "shfmt", -- Shell script formatting
        "shellcheck", -- Shell script linting
        "black", -- Python formatting
        "isort", -- Python import sorting
        "flake8", -- Python linting
        "gofumpt", -- Go formatting
        "golangci-lint", -- Go linting
        "clang-format", -- C/C++ formatting
        "yamlfmt", -- YAML formatting
        "google-java-format", -- Java formatting
      })
    end,
  },
}
