# Welcome to my Dot-files configuration

The purpose of this repository is to keep up to date dot-files. When working on a new laptop or desktop, I can quickly clone this repository and have all my settings ready to go.

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

### Files

**zshrc**
main zshrc file this should be sourced from your ~/.zshrc file.

```sh
# ~/.zshrc
source ~/.config/dot-files/zsh/zshrc
```

**aliases**
A file to store all your alias'.

**environment**
Got some environment variables you want to set? This is the place to do it.

**function**
A file to store all your handy bash functions.

**zshrc.local**
A file to store all your local zshrc settings. This file is not tracked by git intentionally. I mainly use this for specific work settings.

## tmux

I sometimes use tmux. The dot-files associated to my tmux setup are located within the `tmux` directory and setup some simple but nice defaults.

## vscode

I use vscode as my main editor. This directory contains the settings and keybinding I use so I can easily copy paste them over when I need to.

## git

This directory contains my global git configuration that comes packaged with some nice git alias'.

* This file is found at `~/.gitconfig`
