#!/usr/bin/env bash

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Synchronize all dotfiles with the home directory
rsync -a ./dotfiles/ ~

# Install Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Set Bash to be the default shell
brew install bash
chsh -s /usr/local/opt/bash

# Install Packages
brew install git
brew install mas
brew install speedtest-cli

# Install Python via pyenv
PYTHON_VERSION = "3.8.2"

brew install pyenv
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# Add eval to .bash_profile (commented out since it is already included with my dotfiles)
# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

brew install direnv

# Install Node.js via nvm
# https://jamesauble.medium.com/install-nvm-on-mac-with-brew-adb921fb92cc
brew install nvm
source ~/.bash_profile
nvm install --lts
nvm use --lts

## APPLICATIONS
# Coding
brew cask install visual-studio-code
brew cask install jetbrains-toolbox
brew cask install insomnia
brew cask install mongodb-compass
brew cask install docker
brew cask install virtualbox
mas install 497799835 # xcode

# Design
brew cask install drawio
brew cask install adobe-creative-cloud

# Writing
brew cask install mactex-no-gui
brew cask install texpad
brew cask install jabref

# Misc
brew cask install spotify
brew cask install notion
# mas install 441258766 # magnet
mas install 425424353 # the unarchiver
mas install 926036361 # lastpass
mas install 1147396723 # whatsapp
brew cask install setapp
brew cask install steam
brew cask install vlc
brew cask install teamviewer

# Microsoft
brew cask install microsoft-teams
brew cask install skype-for-business
mas install 1295203466 # ms remote desktop
mas install 462054704 # ms word
mas install 462058435 # ms excel
mas install 462062816 # ms powerpoint
mas install 985367838 # ms outlook
mas install 823766827 # onedrive


brew cleanup
