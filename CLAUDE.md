# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Commands

### Dotfiles Management CLI
```bash
./dot init              # Full system setup (interactive)
./dot stow              # Update symlinks
./dot link              # Install dot command in ~/.local/bin
./dot unlink            # Remove installed dot command
./dot doctor            # Check installation health

# Package management
./dot package list [base|work]
./dot package add <name> [cask] [work]
./dot package remove <name> [bundle]
./dot package update [name|all]
```

## Architecture

- **GNU Stow** manages symlinks from `home/` to `~/`
- **Brewfile** packages in `packages/bundle` (base) and `packages/bundle.work` (work)
- **Zsh** shell with modular config in `home/.config/zsh/`

### Key Paths
- Configs: `home/.config/<app>/`
- Packages: `packages/bundle`, `packages/bundle.work`
- CLI: `./dot`

### Zsh Structure
- `zshrc.sh` - Main entry, sources all modules
- `environment.sh` - Exports and PATH
- `aliases.sh` - Shell aliases
- `function.sh` - Custom functions
- `initializers.sh` - Tool init (zoxide, nvm, rbenv, starship)
- `zshrc.local.sh` - Local overrides (gitignored)
