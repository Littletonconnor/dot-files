# Welcome to my Dot-files configuration!

The purpose of this repository is to keep up to date dot-files. When working on a new laptop or desktop, I can quickly clone this repository and have all my settings ready to go.

A simple zshrc dot file setup. Installation of tools is not included.

## Initial Setup

Setup your .config directory for custom configuration files:

```bash
mkdir -p $HOME/.config && cd $HOME/.config
```

Clone the repository:

```bash
git clone https://github.com/Littletonconnor/dot-files.git
```

### homebrew

```bash
./install homebrew
```

The homebrew command sets up homebrew by downloading and running the homebrew installers script. Once homebrew is installed, it executes the brew bundle command which will install the packages listed in the Brewfile.

### macos

Under development

## Zsh

My shell driver is zsh. The dot-files associated to my zsh setup are located within the `zsh` directory.

**Files**

- zshrc - main zshrc file this should be sourced from your ~/.zshrc file. (eg source ~/.config/dot-files/zsh/zshrc)
- aliases - A file with lots of nice default aliases.
- environment - All the environment variables needed for the system.
- function - A file with handy functions.
- private - This is a user specific file, useful for themes and other things.
- work - A file not checked into git. This is a good place to put any work specific aliases, or commands you use on a day to day.
