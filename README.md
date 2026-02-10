# Dotfiles

Personal dotfiles managed with a simple copy-based approach.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/Littletonconnor/dot-files.git ~/.config/dot-files
cd ~/.config/dot-files

# Full setup (installs packages and copies dotfiles)
./dot init

# Or just sync dotfiles
./dot sync
```

## Commands

```bash
# Full system setup (interactive)
./dot init

# Copy dotfiles to home directory
./dot sync

# Preview what would change
./dot diff

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
├── home/                  # Copied to ~/ (mirroring structure)
│   ├── .config/
│   │   ├── bat/           # bat config
│   │   ├── claude/        # claude config → ~/.claude/
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

## How It Works

The `dot sync` command copies all files from `home/` to your home directory, preserving the directory structure.

### Special Path Mappings

Some configs need to go to non-standard locations. These are configured in the `PATH_MAPPINGS` array at the top of the `dot` script:

| Source | Destination |
|--------|-------------|
| `home/.config/claude/` | `~/.claude/` |

Files not in this mapping are copied directly to `~/` mirroring their path in `home/`.

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
2. Run `./dot sync` to copy to home
3. The config will appear at `~/.config/<app>/`

For configs that need special paths, add a mapping to `PATH_MAPPINGS` in the `dot` script.

## Workflow

```bash
# Edit configs in the repo
vim ~/.config/dot-files/home/.config/nvim/init.lua

# Sync to home
dot sync

# Or see what would change first
dot diff
```

## Troubleshooting

```bash
# Check health
./dot doctor

# Find where a brew package is installed
brew info <package>

# See what files differ between repo and installed
./dot diff
```

## Migration from Stow

If you were using the previous symlink-based approach:

1. The `stow` command still works (aliased to `sync`)
2. `dot doctor` will warn about existing symlinks
3. Running `dot sync` will replace symlinks with actual files
