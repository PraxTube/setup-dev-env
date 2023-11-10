local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"tex"},
})
