Vim�UnDo� X�`a���4Ͳ����~�LxwEiubT�,   7   /local conf = require("telescope.config").values                             g��C    _�                             ����                                                                                                                                                                                                                                                                                                                                                             g���     �                   �               5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g���     �                /022   multi-grep.lua5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g���     �                  5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g���    �   )              	    promp�   *            �                 local finders = requ�               �                   �               5��                                          @       �                  (   	   @               �      �    )   	                 >              �       5�_�                    5       ����                                                                                                                                                                                                                                                                                                                                                             g���    �          7      +local pickers = require "telescope.pickers"   +local finders = require "telescope.finders"   1local make_entry = require "telescope.make_entry"   .local conf = require "telescope.config".values�         7        opts = opts or {}   %  opts.cwd = opts.cwd or vim.uv.cwd()�         7      (  local finder = finders.new_async_job {   (    command_generator = function(prompt)   (      if not prompt or prompt == "" then           return nil   	      end�         7      ,      local pieces = vim.split(prompt, "  ")         local args = { "rg" }         if pieces[1] then            table.insert(args, "-e")   %        table.insert(args, pieces[1])   	      end�         7            if pieces[2] then            table.insert(args, "-g")   %        table.insert(args, pieces[2])   	      end�      '   7   	   2      ---@diagnostic disable-next-line: deprecated         return vim.tbl_flatten {           args,   l        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },         }       end,   4    entry_maker = make_entry.gen_from_vimgrep(opts),       cwd = opts.cwd,     }�   '   1   5        pickers.new(opts, {       debounce = 100,        prompt_title = "Multi Grep",       finder = finder,   *    previewer = conf.grep_previewer(opts),   2    sorter = require("telescope.sorters").empty(),     }):find()�   1   3   5      3  vim.keymap.set("n", "<leader>fg", live_multigrep)5��    1                     �                    �    '                         �       �       �                       �      *            �                       u      e       W       �                       �      �       �       �                       )      �       �       �                       �                     �              '      (          �       �       5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g��C    �         7      (local conf = require("telescope").values5��                         �                      5��