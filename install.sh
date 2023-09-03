setup_homebrew() {
    fancy_echo "Setting up Homebrew"

    if test ! "$(command -v brew)"; then
        info "Homebrew not installed. Installing."
        # Run as a login shell (non-interactive) so that the script doesn't pause for user input
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
    fi

    # install brew dependencies from Brewfile
    brew bundle
}

setup_macos() {}


case "$1" in
    homebrew)
        setup_homebrew
        ;;
    macos)
        setup_macos
        ;;
esac