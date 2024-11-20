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
        ensure_installed = {}
        --outcommented the following as mason install using dynamically linked something something which does not work on nixos
        --ensure_installed = {"lua_ls"}
      })
    end
  },
  {
    -- and finally, we hook up nvim to actually talk to the lsp:
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        cmd = { "lua-language-server" }
      })
      vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, {}) 
    end
  }
}
