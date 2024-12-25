return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup({
      })
    end,
    lazy = true, -- or `true` if you want to load it lazily (then you'd trigger load via an autocmd or keybinding)
  },
}
