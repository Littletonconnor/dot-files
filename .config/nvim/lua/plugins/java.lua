return {
  -- Ensure Java filetype is recognized and optimized
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- Set up Java filetype and optimize performance
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.java" },
        callback = function()
          -- Set filetype to java
          vim.bo.filetype = "java"

          -- Enable basic syntax highlighting
          vim.cmd("syntax on")
          vim.opt_local.synmaxcol = 500

          -- Disable all heavy features for performance
          vim.opt_local.cursorline = false
          vim.opt_local.cursorcolumn = false
          vim.opt_local.foldmethod = "manual"
          vim.opt_local.spell = false
          vim.opt_local.list = false
          vim.opt_local.relativenumber = false
          vim.opt_local.colorcolumn = ""
          vim.opt_local.signcolumn = "no"

          -- Disable LSP for this buffer
          vim.diagnostic.disable(0)
        end,
      })

      return opts
    end,
  },

  -- Ensure treesitter Java parser is installed for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "java" },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          -- Keep treesitter highlighting but optimize for large files
          if lang == "java" then
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end
          return false
        end,
      },
      indent = { enable = false }, -- Disable indent for all
      incremental_selection = { enable = false }, -- Disable incremental selection
    },
  },

  -- Disable Java LSP completely
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
  },

  -- Remove jdtls from LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          autostart = false,
        },
      },
    },
  },
}

