return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      mappings = {
        ["Y"] = "none",
        ["<leader>+"] = function()
          vim.cmd("vertical resize +10")
        end,
        ["<leader>-"] = function()
          vim.cmd("vertical resize -10")
        end,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
      },
    },
  },
}
