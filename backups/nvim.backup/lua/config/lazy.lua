-- ============================================================================
-- LAZYVIM CONFIGURATION FILE
-- This is the main configuration file for LazyVim
-- Location: ~/.config/nvim/lua/config/lazy.lua
-- ============================================================================

-- Bootstrap lazy.nvim plugin manager (don't modify this section)
-- This section automatically installs lazy.nvim if it's not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- MAIN CONFIGURATION STARTS HERE
-- ============================================================================
require("lazy").setup({
  spec = {
    -- ========================================================================
    -- CORE PLUGINS
    -- ========================================================================
    -- LazyVim core (includes base plugins like telescope, which-key, etc.)
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- ========================================================================
    -- LANGUAGE SUPPORT EXTRAS
    -- These provide complete setups for specific languages
    -- Find more at: https://www.lazyvim.org/extras/lang/
    -- ========================================================================

    -- Java support disabled for performance
    -- { import = "lazyvim.plugins.extras.lang.java" },

    -- Ruby/Rails support (solargraph LSP, rubocop, etc.)
    { import = "lazyvim.plugins.extras.lang.ruby" },

    -- TypeScript/JavaScript support (typescript-language-server, eslint, prettier)
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- JSON support (better JSON handling)
    { import = "lazyvim.plugins.extras.lang.json" },

    -- YAML support (useful for config files)
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- Markdown support (preview, better editing)
    { import = "lazyvim.plugins.extras.lang.markdown" },

    -- ========================================================================
    -- FORMATTING & LINTING EXTRAS
    -- ========================================================================

    -- Prettier support (auto-format JS/TS/CSS/HTML/JSON/Markdown)
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- ESLint support (linting for JS/TS)
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- ========================================================================
    -- USEFUL EXTRAS (Optional but recommended)
    -- ========================================================================

    -- Better UI components
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },  -- Smooth scrolling/animations

    -- Git integration
    -- { import = "lazyvim.plugins.extras.vcs.lazygit" },      -- Already included by default

    -- ========================================================================
    -- YOUR CUSTOM PLUGINS
    -- This imports from ~/.config/nvim/lua/plugins/
    -- Create files there like:
    --   - plugins/colorscheme.lua (for theme customization)
    --   - plugins/ui.lua (for UI tweaks)
    --   - plugins/editor.lua (for editor enhancements)
    -- ========================================================================
    { import = "plugins" },
  },

  -- ========================================================================
  -- LAZY LOADING SETTINGS
  -- ========================================================================
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded
    -- Your custom plugins will load during startup unless you specify lazy = true
    lazy = false,

    -- It's recommended to leave version=false for now
    -- Many plugins have outdated releases that may break Neovim
    version = false, -- always use the latest git commit
    -- version = "*", -- uncomment to use latest stable versions (not recommended)
  },

  -- ========================================================================
  -- UI SETTINGS
  -- ========================================================================
  install = {
    -- Colorschemes to use while installing plugins
    colorscheme = { "catppuccin", "tokyonight", "habamax" },
  },

  -- ========================================================================
  -- AUTO-UPDATE SETTINGS
  -- ========================================================================
  checker = {
    enabled = true, -- Automatically check for plugin updates
    notify = false, -- Don't notify about updates (check with :Lazy)
    frequency = 86400, -- Check for updates every 24 hours
  },

  -- ========================================================================
  -- PERFORMANCE OPTIMIZATIONS
  -- ========================================================================
  performance = {
    rtp = {
      -- Disable some built-in Vim plugins that we don't need
      disabled_plugins = {
        "gzip", -- Editing gzipped files
        -- "matchit",    -- Extended % matching (keep enabled, it's useful)
        -- "matchparen", -- Highlight matching parens (keep enabled)
        -- "netrwPlugin", -- File browser (disabled, we use neo-tree)
        "tarPlugin", -- Editing tar files
        "tohtml", -- Convert to HTML
        "tutor", -- Vim tutor
        "zipPlugin", -- Editing zip files
      },
    },
  },
})

-- ============================================================================
-- WHERE TO ADD CUSTOM PLUGINS
-- ============================================================================
-- 1. SIMPLE PLUGINS: Create ~/.config/nvim/lua/plugins/init.lua
--    Example:
--    return {
--      { "github/copilot.vim" },  -- GitHub Copilot
--      { "tpope/vim-fugitive" },  -- Git commands
--    }
--
-- 2. COMPLEX PLUGINS: Create separate files in ~/.config/nvim/lua/plugins/
--    Example: ~/.config/nvim/lua/plugins/colorscheme.lua
--    return {
--      {
--        "catppuccin/nvim",
--        name = "catppuccin",
--        lazy = false,
--        priority = 1000,
--        opts = {
--          flavour = "mocha",
--        },
--      },
--    }
--
-- 3. OVERRIDE EXISTING PLUGINS: Use the same plugin name
--    Example: Override telescope settings
--    return {
--      {
--        "nvim-telescope/telescope.nvim",
--        opts = {
--          defaults = {
--            layout_strategy = "flex",
--          },
--        },
--      },
--    }
-- ============================================================================

-- ============================================================================
-- USEFUL COMMANDS
-- ============================================================================
-- :Lazy             - Open plugin manager
-- :Mason            - Open LSP/DAP/Linter/Formatter installer
-- :MasonInstall     - Install specific tools
-- :LspInfo          - Check LSP status
-- :checkhealth      - Check Neovim health
-- :LazyExtras       - Enable/disable LazyVim extras
--
-- KEYBINDINGS:
-- <Space>l          - Open Lazy plugin manager
-- <Space>cm         - Open Mason
-- <Space>ck         - Show keymaps
-- ============================================================================
