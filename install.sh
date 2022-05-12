#!/bin/sh

echo ‘install brew’
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo ‘install core’
brew install git nvm

nvmpath=<<EOT
export NVM_DIR="$HOME/.nvm"
. "/opt/homebrew/opt/nvm/nvm.sh"
EOT

[ -d "~/.nvm" ] && mkdir ~/.nvm

if ! grep -q nvm ~/.zshrc; then
    echo "Install nvm path into /.zshrc"
    echo "$nvmpath" > ~/.zshrc
fi

if ! grep -q nvm ~/.bash_profile; then
    echo "Install nvm path into /.bash_profile"
    echo "$nvmpath" > ~/.bash_profile
fi

echo ‘install browsers’
brew install --cask google-chrome tor-browser

echo ‘install devtools’
brew install --cask visual-studio-code postman phpstorm docker valentina-studio termius

echo ‘install communication’ brew install --cask asana
brew install --cask linear-linear slack telegram

echo ‘install os extends’
brew install --cask raycast hiddenbar displaperture rectangle maccy

echo ‘install editors’
brew install --cask figma notion

echo ‘instal media’
brew install --cask vlc

echo ‘install network’
brew install --cask lulu

echo ‘install other’
brew install --cask qbittorrent the-unarchiver
