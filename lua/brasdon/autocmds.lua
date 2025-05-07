-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("brasdon-highlight-yank", { clear = true }), -- Changed group name for clarity
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Add any other general autocommands here in the future
