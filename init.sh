#!/usr/bin/env bash

# Synchronize all dotfiles with the home directory
rsync -a ./dotfiles/ ~

# Install Command Line Tools
xcode-select --install

# Install Homebrew silently
URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install'
echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)" > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'NG'; fi

brew update
brew upgrade

# Install bash shell
brew install bash

# Set bash as default shell
echo $(brew --prefix bash) | sudo tee -a /etc/shells
chsh -s $(brew --prefix bash)


source ~/.bash_profile


# Install Packages
PACKAGES=( "git", "mas", "speedtest-cli", "direnv")
for package in "${PACKAGES[@]}"
do
    brew install $package
done

eval "$(/usr/libexec/path_helper)" # required for MacTeX

# Install Python via pyenv
PYTHON_VERSION="3.8.2"

brew install pyenv
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION
# Add eval to .bash_profile (commented out since it is already included with my dotfiles)
# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# Install Node.js via nvm
brew install nvm
nvm install --lts
nvm use --lts


# Install Applications via brew cask or App Store CLI (mas)
# Coding Applications
CODING_APPS_BREW=( "visual-studio-code", "jetbrains-toolbox", "insomnia", "mongodb-compass", "docker", "virtualbox" )
for coding_app in "${CODING_APPS_BREW[@]}"
do
    brew install --cask $coding_app
done

CODING_APPS_MAS=( 497799835 )
for coding_app in "${CODING_APPS_MAS[@]}"
do
    mas install $coding_app
done

# Design Applications
DESIGN_APPS=( "drawio", "adobe-creative-cloud" )
for design_app in "${DESIGN_APPS[@]}"
do
    brew install --cask $coding_app
done

# Writing Applications
WRITING_APPS=("mactex-no-gui", "texpad", "jabref")
for writing_app in "${WRITING_APPS[@]}"
do
    brew install --cask $writing_app
done

# Microsoft Applications
MS_APPS_BREW=( "microsoft-teams", "skype-for-business" )
for ms_app in "${MS_APPS_BREW[@]}"
do
    brew install --cask $ms_app
done

MS_APPS_MAS=( 1295203466, 462054704, 462058435, 462062816, 985367838, 823766827 )
for ms_app in "${MS_APPS_MAS[@]}"
do
    mas install $ms_app
done


