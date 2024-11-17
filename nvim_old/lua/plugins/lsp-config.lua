return {
  {
    -- mason is a "portable package manager" whatever that means...
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    -- mason-lspconfig is used to install the language servers automatically first time neovom sees the configs below
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"}
      })
    end
  },
  {
    -- and finally, we hook up nvim to actually talk to the lsp:
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
    end
  }
}
