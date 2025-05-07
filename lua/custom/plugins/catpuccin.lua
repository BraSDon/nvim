return {
	-- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"catppuccin/nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.colorscheme("catppuccin-mocha")

		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
	config = function()
		require("catppuccin").setup({
			custom_highlights = function(colors)
				return {
					-- NOTE: Top level properties should be avoided.
					-- NORMAL TEXT
					["@lsp.type.variable"] = { fg = colors.text },
					["@variable.builtin"] = { fg = colors.text },
					["@variable.member"] = { fg = colors.text },
					["@property"] = { fg = colors.text },
					["@module"] = { fg = colors.text },
					Special = { fg = colors.text },
					["@lsp.typemod.deriveHelper"] = { fg = colors.text },
					["@lsp.typemod.const.declaration"] = { fg = colors.text },
					["@constant"] = { fg = colors.text },
					-- RED
					Operator = { fg = colors.red },
					["@keyword.repeat"] = { fg = colors.red },
					["@keyword.conditional"] = { fg = colors.red },
					["@keyword.function"] = { fg = colors.red },
					["@keyword.return"] = { fg = colors.red },
					Keyword = { fg = colors.red },
					Include = { fg = colors.red },
					-- GREEN
					Function = { fg = colors.green },
					["@function.macro"] = { fg = colors.green },
					["@function.builtin"] = { fg = colors.green },
					Macro = { fg = colors.green },
					-- YELLOW
					["@lsp.type.string"] = { fg = colors.yellow },
					["@string"] = { fg = colors.yellow },
					-- MAUVE
					["@lsp.type.enumMember"] = { fg = colors.mauve },
					["@constant.builtin"] = { fg = colors.mauve },
					Number = { fg = colors.mauve },
					-- PEACH
					["@parameter"] = { fg = colors.peach },
					["@variable.parameter"] = { fg = colors.peach },
					-- SKY
					["@type.builtin"] = { fg = colors.sky },
					-- BLUE
					Type = { fg = colors.blue },
					["@lsp.type.interface"] = { fg = colors.blue },

					-- Set LspInlayHint color
					["LspInlayHint"] = { fg = colors.blue },

					-- @module.rust should NOT be italic
					["@module.rust"] = { style = {} },
				}
			end,
		})
	end,
}
