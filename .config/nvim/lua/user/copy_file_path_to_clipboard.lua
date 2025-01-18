local Path = require("plenary.path")

vim.api.nvim_create_user_command("CopyFilePathToClipboard", function()
	-- Get the current buffer's file path
	local file_path = vim.api.nvim_buf_get_name(0)

	-- Create a Path object for the file
	local path_obj = Path:new(file_path)

	-- Get the absolute path
	local absolute_path = path_obj:absolute()

	-- Copy the absolute path to the system clipboard
	vim.fn.setreg("+", absolute_path)
end, {})

vim.api.nvim_create_user_command("CFP", function()
	vim.cmd(":CopyFilePathToClipboard")
end, {})
