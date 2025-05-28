return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
			{ "nvim-telescope/telescope.nvim", branch = "master" }, -- for telescope
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		model = "gemini-2.0-flash-001",
		keys = {
			{
				"<leader>cc", -- Toggle chat window
				"<cmd>CopilotChatToggle<CR>",
				mode = "n",
				desc = "CopilotChat: Toggle",
			},
			{
				"<leader>ce", -- Explain code selection
				"<cmd>CopilotChatExplain<CR>",
				mode = "v",
				desc = "CopilotChat: Explain Selection",
			},
			{
				"<leader>cf", -- Fix code selection
				"<cmd>CopilotChatFix<CR>",
				mode = "v",
				desc = "CopilotChat: Fix Selection",
			},
			{
				"<leader>ct", -- Generate tests for selection
				"<cmd>CopilotChatTests<CR>",
				mode = "v",
				desc = "CopilotChat: Generate Tests for Selection",
			},
			{
				"<leader>cd", -- Generate docs for selection
				"<cmd>CopilotChatDocs<CR>",
				mode = "v",
				desc = "CopilotChat: Generate Docs for Selection",
			},
			{
				"<leader>co", -- Optimize selection
				"<cmd>CopilotChatOptimize<CR>",
				mode = "v",
				desc = "CopilotChat: Optimize Selection",
			},
			{
				"<leader>c<space>", -- Generic chat about selection (prompts you for input)
				"<cmd>CopilotChatSelection<CR>",
				mode = "v",
				desc = "CopilotChat: Selection",
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
