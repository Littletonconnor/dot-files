-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.conceallevel = 0
opt.cmdheight = 0

vim.g.root_spec = { "cwd" }
vim.g.omni_sql_no_default_maps = 1
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
