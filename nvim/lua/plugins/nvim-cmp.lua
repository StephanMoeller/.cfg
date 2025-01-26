return {
	"hrsh7th/nvim-cmp",
	-- enabled = false,
	opts = function(_, conf)
		conf.mapping = {
			["<CR>"] = require("cmp").mapping.confirm({ select = true }),
			["<Tab>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
			["<S-Tab>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
        ["<Down>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
			["<Up>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
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


