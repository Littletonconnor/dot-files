# Dotfiles

Personal dotfiles managed with GNU Stow.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/Littletonconnor/dot-files.git ~/.config/dot-files
cd ~/.config/dot-files

# Full setup (installs packages and creates symlinks)
./dot init

# Or just update symlinks
./dot stow
```

## Commands

```bash
# Full system setup (interactive)
./dot init

# Update symlinks for dotfiles
./dot stow

# Install dot command globally
./dot link

# Check installation health
./dot doctor

# Backup current configs
./dot backup

# Package management
./dot package list                    # List all packages
./dot package list base               # List base packages only
./dot package add neovim              # Add formula to base bundle
./dot package add discord cask        # Add cask to base bundle
./dot package add kubectl brew work   # Add to work bundle
./dot package update                  # Update all packages
./dot package remove git              # Remove from bundles
```

## Structure

```
dot-files/
├── dot                    # CLI tool
├── home/                  # Symlinked to ~/ via GNU Stow
│   ├── .config/
│   │   ├── bat/           # bat config
│   │   ├── ghostty/       # terminal config
│   │   ├── git/           # git config
│   │   ├── nvim/          # neovim config
│   │   ├── starship/      # prompt config
│   │   ├── tmux/          # tmux config
│   │   ├── vscode/        # vscode settings
│   │   └── zsh/           # shell config
│   └── .zshrc             # main zsh entry point
├── packages/
│   ├── bundle             # Base Brewfile
│   └── bundle.work        # Work-specific packages
└── README.md
```

## Zsh Configuration

The zsh config is modular:

- `zshrc.sh` - Main entry point
- `environment.sh` - Environment variables
- `aliases.sh` - Aliases
- `function.sh` - Custom functions
- `initializers.sh` - Tool initialization (zoxide, nvm, rbenv, etc.)
- `zshrc.local.sh` - Local overrides (not tracked by git)

## Adding a New Config

1. Create the config in `home/.config/<app>/`
2. Run `./dot stow` to create symlinks
3. The config will appear at `~/.config/<app>/`

## Troubleshooting

```bash
# Check health
./dot doctor

# Find where a brew package is installed
brew info <package>

# Refresh symlinks if something breaks
./dot stow
```
