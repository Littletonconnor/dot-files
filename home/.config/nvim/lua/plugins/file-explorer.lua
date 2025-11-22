return {
  -- Disable neo-tree completely
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    -- Override all neo-tree keybindings by setting them to false
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
    },
  },

  -- Configure mini.files as the default explorer
  {
    "nvim-mini/mini.files",
    opts = {
      options = {
        -- Set as default file explorer (replaces netrw)
        use_as_default_explorer = true,
      },
      windows = {
        -- Width of floating window
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = true,
        -- Width of focused window
        width_focus = 50,
        -- Width of non-focused window
        width_nofocus = 15,
        -- Width of preview window
        width_preview = 25,
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          local MiniFiles = require("mini.files")
          if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
          end
        end,
        desc = "Toggle mini.files (Directory of Current File)",
      },
      {
        "<leader>E",
        function()
          local MiniFiles = require("mini.files")
          if not MiniFiles.close() then
            MiniFiles.open(vim.uv.cwd(), true)
          end
        end,
        desc = "Toggle mini.files (cwd)",
      },
      {
        "<leader>fe",
        function()
          local MiniFiles = require("mini.files")
          if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
          end
        end,
        desc = "Explorer mini.files (root of file)",
      },
      {
        "<leader>fE",
        function()
          local MiniFiles = require("mini.files")
          if not MiniFiles.close() then
            MiniFiles.open(vim.uv.cwd(), true)
          end
        end,
        desc = "Explorer mini.files (cwd)",
      },
    },
  },
}
