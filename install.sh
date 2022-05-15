#!/bin/sh

echo 'Install Brew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Install packages'
brew install \
  git \
  nvm \
  ncdu
  
brew install --cask \
  #browsers
  google-chrome \
  tor-browser \
  #developer
  visual-studio-code \
  postman \
  docker \
  valentina-studio \
  termius \
  #social
  asana \
  linear-linear \
  slack \
  telegram \
  #os-extends
  raycast \
  hiddenbar \
  displaperture \
  rectangle \
  maccy \
  #editors
  figma \
  notion \
  #media
  vlc \
  #network
  lulu \
  #other
  qbittorrent \
  the-unarchiver

echo 'Init nvm'
[ -d "$HOME/.nvm" ] && mkdir ~/.nvm
nvmpath="export NVM_DIR=\"$HOME/.nvm\"\n. \"/opt/homebrew/opt/nvm/nvm.sh\""
! grep -q nvm "$HOME/.zshrc" && { echo 'Install nvm path into /.zshrc'; echo "$nvmpath" > ~/.zshrc; }
! grep -q nvm "$HOME/.bash_profile" && { echo 'Install nvm path into /.bash_profile'; echo "$nvmpath" > ~/.bash_profile; }
nvm install stable
nvm use stable

npm install -g npkill

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
