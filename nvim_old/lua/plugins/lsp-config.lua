return { 
  {
    -- and finally, we hook up nvim to actually talk to the lsp:
    "neovim/nvim-lspconfig",
    config = function()
      --local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        cmd = { "lua-language-server" }
      })
      lspconfig.zls.setup{}
      lspconfig.gopls.setup{}
      lspconfig.csharp_ls.setup({ 
      --  capabilities = capabilities 
      })
      lspconfig.csharp_ls.setup({  })

    end
  }
-- lazy.nvim
}
