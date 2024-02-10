local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "python-lsp-server",
        "rust-analyzer",
        "texlab",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require("crates")
      crates.setup(opts)
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end
  },
  {
    "w0rp/ale",
    ft = { "markdown", "tex", "text", "rmd", "gitcommit" },
    cmd = { "ALEEnable" },
  },

  "tpope/vim-fugitive",

  { "benknoble/vim-mips", lazy = false},

  {
    "neoclide/coc.nvim",
    branch = 'release',
  },

  { "ggandor/leap.nvim", lazy = false}
}
return plugins
