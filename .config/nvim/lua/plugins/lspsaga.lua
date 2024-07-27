return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
    },
    config = function()
      require("lspsaga").setup({
        -- Customize lspsaga settings here if needed
      })

      -- Set up keybindings for lspsaga
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Hover documentation
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

      -- Code actions
      keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

      -- Go to definition
      keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)

      -- Show implementations
      keymap("n", "gi", "<cmd>Lspsaga lsp_finder<CR>", opts)

      -- Diagnostics navigation
      keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    end,
  },
}
