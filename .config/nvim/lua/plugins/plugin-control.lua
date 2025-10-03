-- ============================================================================
-- PLUGIN CONTROL CENTER
-- Manual control over all LazyVim plugins to isolate performance issues
-- ============================================================================

-- CORE PLUGINS
-- These are essential for basic functionality
-- LazyVim - Base configuration framework
-- lazy.nvim - Plugin manager
-- plenary.nvim - Lua utility functions (required by many plugins)

-- UI & APPEARANCE PLUGINS
-- catppuccin/tokyonight.nvim - Color schemes
-- lualine.nvim - Status line (DISABLED - can cause performance issues)
-- bufferline.nvim - Tab/buffer line at top
-- noice.nvim - Enhanced UI for messages/cmdline/popups
-- nui.nvim - UI component library (required by noice, neo-tree)
-- mini.icons - Icon provider
-- snacks.nvim - Collection of small QoL improvements
-- which-key.nvim - Shows available keybindings in popup

-- EDITOR ENHANCEMENT PLUGINS
-- flash.nvim - Enhanced f/t motions and search
-- mini.ai - Advanced text objects (around/inside)
-- mini.pairs - Auto-close brackets/quotes
-- indent-blankline.nvim - Shows indentation lines
-- todo-comments.nvim - Highlights TODO/FIXME comments
-- ts-comments.nvim - Better comment handling with treesitter

-- FILE & PROJECT NAVIGATION
-- telescope.nvim - Fuzzy finder for files/text/etc
-- telescope-fzf-native.nvim - Native FZF integration for telescope
-- neo-tree.nvim - File explorer sidebar
-- grug-far.nvim - Search and replace across project
-- persistence.nvim - Session management

-- LSP & COMPLETION PLUGINS
-- nvim-lspconfig - LSP client configurations
-- mason.nvim - LSP/DAP/linter/formatter installer
-- mason-lspconfig.nvim - Bridge between mason and lspconfig
-- blink.cmp - Completion engine
-- lazydev.nvim - Lua development support
-- nvim-jdtls - Java language server

-- CODING TOOLS
-- nvim-treesitter - Syntax highlighting and parsing
-- nvim-treesitter-textobjects - Advanced text objects
-- nvim-ts-autotag - Auto-close HTML/XML tags
-- conform.nvim - Code formatting
-- nvim-lint - Linting integration
-- friendly-snippets - Snippet collection

-- VERSION CONTROL
-- gitsigns.nvim - Git signs in gutter + git operations

-- SPECIALIZED TOOLS
-- trouble.nvim - Pretty diagnostics/quickfix list
-- markdown-preview.nvim - Live markdown preview
-- render-markdown.nvim - Render markdown in buffer
-- SchemaStore.nvim - JSON schema support
-- bufdelete.nvim - Better buffer deletion

return {
  -- Core LazyVim
  { "LazyVim/LazyVim", enabled = true },

  -- Plugin manager (always enabled)
  { "folke/lazy.nvim", enabled = true },

  -- Essential utilities
  { "nvim-lua/plenary.nvim", enabled = true },

  -- UI Components
  { "MunifTanjim/nui.nvim", enabled = true },
  { "echasnovski/mini.icons", enabled = true },

  -- Status line (DISABLED - suspected performance issue)
  { "nvim-lualine/lualine.nvim", enabled = false },

  -- Color schemes
  { "catppuccin/nvim", enabled = true },
  { "folke/tokyonight.nvim", enabled = true },

  -- Buffer/tab line
  { "akinsho/bufferline.nvim", enabled = true },

  -- Enhanced UI
  { "folke/noice.nvim", enabled = true },
  { "folke/snacks.nvim", enabled = true },

  -- Keybinding help
  { "folke/which-key.nvim", enabled = true },

  -- Navigation and search
  { "folke/flash.nvim", enabled = true },
  { "nvim-telescope/telescope.nvim", enabled = true },
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },

  -- File explorer
  { "nvim-neo-tree/neo-tree.nvim", enabled = true },

  -- Search and replace
  { "MagicDuck/grug-far.nvim", enabled = true },

  -- Session management
  { "folke/persistence.nvim", enabled = true },

  -- Text objects and editing
  { "echasnovski/mini.ai", enabled = true },
  { "echasnovski/mini.pairs", enabled = true },

  -- Visual enhancements
  { "lukas-reineke/indent-blankline.nvim", enabled = true },
  { "folke/todo-comments.nvim", enabled = true },
  { "folke/ts-comments.nvim", enabled = true },

  -- LSP and completion
  { "neovim/nvim-lspconfig", enabled = true },
  { "williamboman/mason.nvim", enabled = true },
  { "williamboman/mason-lspconfig.nvim", enabled = true },
  { "saghen/blink.cmp", enabled = true },
  { "folke/lazydev.nvim", enabled = true },

  -- Java support
  { "mfussenegger/nvim-jdtls", enabled = true },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", enabled = true },
  { "nvim-treesitter/nvim-treesitter-textobjects", enabled = true },
  { "windwp/nvim-ts-autotag", enabled = true },

  -- Formatting and linting
  { "stevearc/conform.nvim", enabled = true },
  { "mfussenegger/nvim-lint", enabled = true },

  -- Snippets
  { "rafamadriz/friendly-snippets", enabled = true },

  -- Git integration
  { "lewis6991/gitsigns.nvim", enabled = true },

  -- Diagnostics
  { "folke/trouble.nvim", enabled = true },

  -- Markdown
  { "iamcco/markdown-preview.nvim", enabled = true },
  { "MeanderingProgrammer/render-markdown.nvim", enabled = true },

  -- JSON schema
  { "b0o/SchemaStore.nvim", enabled = true },

  -- Buffer management
  { "famiu/bufdelete.nvim", enabled = true },
}
