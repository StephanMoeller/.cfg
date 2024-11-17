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
        ensure_installed = {"lua_ls", "zls"}
      })
    end
  },
  {
    -- and finally, we hook up nvim to actually talk to the lsp:
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.zls.setup({
        on_attach = function(_, bufnr)
          -- LSP diagnostics setup
          vim.diagnostic.config({
            virtual_text = true,  -- Enable inline diagnostics
            signs = true,         -- Show error/warning signs
            underline = true,     -- Underline errors
            update_in_insert = false,  -- Update diagnostics only when not in insert mode
          })

          -- Keybindings for diagnostics (optional)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
        end,
      })
    end
  }
}
