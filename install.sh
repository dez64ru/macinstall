#!/bin/sh

echo 'install brew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'install core'
brew install git nvm
npm install -g npkill

echo 'init nvm'
[ -d "$HOME/.nvm" ] && mkdir ~/.nvm
nvmpath="export NVM_DIR=\"$HOME/.nvm\"\n. \"/opt/homebrew/opt/nvm/nvm.sh\""
! grep -q nvm "$HOME/.zshrc" && { echo 'Install nvm path into /.zshrc'; echo "$nvmpath" > ~/.zshrc; }
! grep -q nvm "$HOME/.bash_profile" && { echo 'Install nvm path into /.bash_profile'; echo "$nvmpath" > ~/.bash_profile; }

echo 'install browsers'
brew install --cask google-chrome tor-browser

echo 'install devtools'
brew install --cask visual-studio-code postman phpstorm docker valentina-studio termius

echo 'install communication'
brew install --cask asana
brew install --cask linear-linear slack telegram

echo 'install os extends'
brew install --cask raycast hiddenbar displaperture rectangle maccy

echo 'install editors'
brew install --cask figma notion

echo 'instal media'
brew install --cask vlc

echo 'install network'
brew install --cask lulu

echo 'install other'
brew install --cask qbittorrent the-unarchiver

echo 'install fonts'
mkdir ~/.tmp && cd ~/.tmp || return
curl -s -L https://github.com/kube/sf-mono-ligaturized/archive/refs/heads/master.zip -o fonts && unzip fonts
mv sf-mono-ligaturized-master/ligaturized/* ~/Library/Fonts/
rm -rf ~/.tmp && cd ~ || return

echo 'disable indexing'
sudo mdutil -i off /
sudo mdutil -E /

printf "\n"
echo 'MacOs Tweaks'
echo 'enable show all files'
defaults write http://com.apple.Finder AppleShowAllFiles true
echo 'disable open this application'
defaults write com.apple.LaunchServices LSQuarantine -bool false
echo 'enable snap to grid desktop'
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
echo 'disable write .DS_store'
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

echo 'Init crontab task for brew full update'
crontab -l > cron_bkp
echo "0 10 * * * brew update && brew upgrade && brew cleanup; brew doctor >/dev/null 2>&1" >> cron_bkp
crontab cron_bkp
rm cron_bkp
