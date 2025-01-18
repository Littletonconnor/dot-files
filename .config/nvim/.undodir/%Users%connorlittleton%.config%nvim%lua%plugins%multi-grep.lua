Vim�UnDo� ~��q�D���2(�d�HV���Ϯt*�:%�k   =                                  g���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             g���    �                   �               5��                    4                      0      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g���    �          7      +local pickers = require "telescope.pickers"   +local finders = require "telescope.finders"   1local make_entry = require "telescope.make_entry"   .local conf = require "telescope.config".values�         7        opts = opts or {}   %  opts.cwd = opts.cwd or vim.uv.cwd()�         7      (  local finder = finders.new_async_job {   (    command_generator = function(prompt)   (      if not prompt or prompt == "" then           return nil   	      end�         7      ,      local pieces = vim.split(prompt, "  ")         local args = { "rg" }         if pieces[1] then            table.insert(args, "-e")   %        table.insert(args, pieces[1])   	      end�         7            if pieces[2] then            table.insert(args, "-g")   %        table.insert(args, pieces[2])   	      end�      '   7   	   2      ---@diagnostic disable-next-line: deprecated         return vim.tbl_flatten {           args,   l        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },         }       end,   4    entry_maker = make_entry.gen_from_vimgrep(opts),       cwd = opts.cwd,     }�   '   1   5        pickers.new(opts, {       debounce = 100,        prompt_title = "Multi Grep",       finder = finder,   *    previewer = conf.grep_previewer(opts),   2    sorter = require("telescope.sorters").empty(),     }):find()�   1   3   5      3  vim.keymap.set("n", "<leader>fg", live_multigrep)5��    1                     �                    �    '                         �       �       �                       �      *            �                       u      e       W       �                       �      �       �       �                       )      �       �       �                       �                     �              '      (          �       �       5�_�                            ����                                                                                                                                                                                                                                                                                                                               +       7          V       g��    �                   �               �              7   ,local pickers = require("telescope.pickers")   ,local finders = require("telescope.finders")   2local make_entry = require("telescope.make_entry")   /local conf = require("telescope.config").values       local M = {}       %local live_multigrep = function(opts)   	opts = opts or {}   $	opts.cwd = opts.cwd or vim.uv.cwd()       '	local finder = finders.new_async_job({   &		command_generator = function(prompt)   %			if not prompt or prompt == "" then   				return nil   			end       )			local pieces = vim.split(prompt, "  ")   			local args = { "rg" }   			if pieces[1] then   				table.insert(args, "-e")   !				table.insert(args, pieces[1])   			end       			if pieces[2] then   				table.insert(args, "-g")   !				table.insert(args, pieces[2])   			end       /			---@diagnostic disable-next-line: deprecated   			return vim.tbl_flatten({   					args,   h				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },   			})   		end,   2		entry_maker = make_entry.gen_from_vimgrep(opts),   		cwd = opts.cwd,   	})       	pickers   		.new(opts, {   			debounce = 100,   			prompt_title = "Multi Grep",   			finder = finder,   )			previewer = conf.grep_previewer(opts),   1			sorter = require("telescope.sorters").empty(),   		})   			:find()   end       M.setup = function()   2	vim.keymap.set("n", "<leader>fg", live_multigrep)   end       return M5��            7                      �             �                                           z      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g���    �                   �               �                 return {   D  -- If it's a local plugin in your config, point "dir" to the path:   =  dir = vim.fn.stdpath("config") .. "/lua/plugins/multigrep",       H  -- Or if you keep the code right here, you can just inline everything:     config = function()   0    local pickers = require("telescope.pickers")   0    local finders = require("telescope.finders")   6    local make_entry = require("telescope.make_entry")   3    local conf = require("telescope.config").values           local M = {}       )    local live_multigrep = function(opts)   	      ...       end           M.setup = function()   7      vim.keymap.set("n", "<leader>fg", live_multigrep)       end           M.setup()     end,   }5��                                  {             �                    6                       @      5�_�                             ����                                                                                                                                                                                                                                                                                                                                       6           V        g���    �      	   =      N  -- Replace this with the plugin you’re extending or your own local plugin:   "  "nvim-telescope/telescope.nvim",     config = function()   0    local pickers = require("telescope.pickers")   0    local finders = require("telescope.finders")   6    local make_entry = require("telescope.make_entry")   3    local conf = require("telescope.config").values�   	      =      )    local live_multigrep = function(opts)         opts = opts or {}   )      opts.cwd = opts.cwd or vim.uv.cwd()�         =      ,      local finder = finders.new_async_job({   ,        command_generator = function(prompt)   ,          if not prompt or prompt == "" then               return nil             end�         =   
   0          local pieces = vim.split(prompt, "  ")             local args = { "rg" }             if pieces[1] then   $            table.insert(args, "-e")   )            table.insert(args, pieces[1])             end             if pieces[2] then   $            table.insert(args, "-g")   )            table.insert(args, pieces[2])             end�      .   6      "          return vim.tbl_flatten({               args,   p            { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },             })           end,   8        entry_maker = make_entry.gen_from_vimgrep(opts),           cwd = opts.cwd,         })�   '   2   6   
         pickers           .new(opts, {             debounce = 100,   &          prompt_title = "Multi Grep",             finder = finder,   0          previewer = conf.grep_previewer(opts),   8          sorter = require("telescope.sorters").empty(),   
        })           :find()       end�   2   6   6          -- Keymap or setup call   5    vim.keymap.set("n", "<leader>fg", live_multigrep)     end,5��    2                   �      T       O       �    '       	      	      �            �       �                       �            #      �           	   
   	      y      ?      	      �              
         �      �       �       �    	                   _      H       @       �                       	       %            5��