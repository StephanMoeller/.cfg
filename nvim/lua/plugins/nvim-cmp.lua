return {
	"hrsh7th/nvim-cmp",
	-- enabled = false,
	opts = function(_, conf)
    local cmp = require("cmp")

    function select_and_type(type_this)
      return cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })  -- Confirm first suggestion
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(type_this, true, true, true), "n", true)
        else
          fallback()
        end
      end, { "i", "s" })
    end

		conf.mapping = {
			["<CR>"] = select_and_type(""),
      ["<Down>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
			["<Up>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["("] = select_and_type("()<Left>"),
      ["."] = select_and_type("."),
		}
    conf.completion = {
      completeopt = "menu,menuone,noinsert",
    }
    conf.findow = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
					border = "rounded",
				},
				documentation = {
					border = "rounded",
				},
			}
			conf.snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			}
      conf.sources = require("cmp").config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
			}, {
				{ name = "buffer" },
			})
  end,
  dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
        }
}


