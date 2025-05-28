return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		local catpuccin_colors
		local cp_ok, cp_palette_module = pcall(require, "catppuccin.palettes")
		if cp_ok then
			catpuccin_colors = cp_palette_module.get_palette()
		else
			catpuccin_colors = {
				red = "#E06C75",
				green = "#98C379",
				blue = "#61AFEF",
				mauve = "#C678DD",
				peach = "#D19A66",
				sky = "#56B6C2",
				text = "#ABB2BF",
			}
		end

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({
			use_icons = vim.g.have_nerd_font,
		})

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Set MiniStatuslineFilename colors
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = catpuccin_colors.text, bg = catpuccin_colors.surface1 })

		-- Use only relative path for filename
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_filename = function()
			local filename = vim.fn.expand("%:t")
			return string.format("%s", filename)
		end

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_fileinfo = function()
			local filetype = vim.bo.filetype
			local icon = require("nvim-web-devicons").get_icon(filetype, nil, { default = true })
			return string.format("%s %s", icon, filetype)
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
