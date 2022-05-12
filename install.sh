#!/bin/sh

echo ‘install brew’
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo ‘install core’
brew install git
brew install node
brew install nvm
mkdir ~/.nvm 
cat <<EOT >> ~/.zshrc
export NVM_DIR="$HOME/.nvm"
. "/opt/homebrew/opt/nvm/nvm.sh"
EOT
cat <<EOT >> ~/.bash_profile
export NVM_DIR="$HOME/.nvm"
. "/opt/homebrew/opt/nvm/nvm.sh"
EOT

echo ‘install browsers’ brew install --cask google-chrome
brew install --cask tor-browser

echo ‘install devtools’
brew install --cask visual-studio-code
brew install --cask postman
brew install --cask phpstorm
brew install --cask docker
brew install --cask valentina-studio
brew install —cask termius

echo ‘install communication’ brew install --cask asana
brew install --cask linear-linear
brew install --cask slack
brew install --cask telegram

echo ‘install os extends’
brew install --cask raycast brew install --cask hiddenbar
brew install --cask displaperture
brew install --cask rectangle
brew install --cask maccy

echo ‘install editors’ brew install --cask figma
brew install --cask notion

echo ‘instal media’
brew install --cask vlc

echo ‘install network’ brew install --cask lulu

echo ‘install other’
brew install --cask qbittorrent
brew install --cask the-unarchiver
