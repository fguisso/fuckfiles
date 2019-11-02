#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' # No Color

bones='\xE2\x98\xA0'
beer='\xF0\x9F\x8D\xBA'

################################################################################
# XCode CLI
################################################################################
# Checks for xcode-select tools
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}";
then
  echo -e "${green} ${beer} xcode-select is installed!";
else
  echo -e "${red} ${bones} Installing the xcode-select tools";
  xcode-select --install
fi

################################################################################
# Homebrew
################################################################################
# Checks for Homebrew, installs if we don't have it
if test ! "$(which brew)"; then
  echo -e "${green}[+] Installing Homebrew${NC}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo -e "${red} ${bones} Homebrew already installed${NC}"
fi

# Checks if the ENV is okay
if [[ -n $(brew doctor | grep -o "Your system is ready to brew") ]]; then
  echo -e "${green}[+] Your system is ready to Brew${NC}"
else
  brew doctor
fi

# Update homebrew recipes
echo -e "${green}[+] Updating Homebrew${NC}"
brew update

# Homebrew's Taps
brew_taps=(
  # homebrew versions
  caskroom/versions
)

for (( i = 0 ; i < ${#brew_taps[@]} ; i++ )); do
  echo -e "${green}[+] Tapping ${brew_taps[$i]} repository${NC}"
  `brew tap ${brew_taps[$i]}`
done

# Homebrew's Apps
brew_apps=(
  # Install GNU core utilities (those that come with macOS are outdated).
  # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  coreutils
  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  findutils

  # Install more recent versions of some macOS tools.
  vim --with-override-system-vi
  grep
  openssh
  screen

  openvpn

  nmap
  sqlmap

  ack
  p7zip

  # Caskroom repository
  caskroom/cask/brew-cask

  # SCM tools
  git
  #git-flow

  # Shell
  zsh
  zsh-completions
  zsh-syntax-highlighting

  # Programing languages and SDKs
  # android-sdk
  # android-ndk
  python3
  go

  # Version Managers
  nvm
  rbenv

  # Databases
  mongodb
  #mysql
  #redis

  # General tools
  #autoenv
  #htop
  httpie
  tree
)

for (( i = 0 ; i < ${#brew_apps[@]} ; i++ )) do
  echo -e "${green}[+] Installing ${brew_apps[$i]} ${NC}"
  brew install ${brew_apps[$i]}
done

# Homebrew's Casks Apps
cask_apps=(
  keepassxc
  iterm2
  docker
  #ubersicht
  keka
  #kicad
  arduino
  appcleaner
  adobe-creative-cloud
  brave-browser
  deezer
  font-hack-nerd-font
  ngrok
  private-internet-access
  riot
  spectacle
  syncthing
  telegram
)

for (( i = 0 ; i < ${#cask_apps[@]} ; i++ )) do
  echo -e "${green}[+] Installing ${cask_apps[$i]} ${NC}"
  brew cask install ${cask_apps[$i]}
done

################################################################################
# ZSH
################################################################################
# Changes the default Shell to ZSH
echo "${green}[+] Changing to ZSH${NC}"
sudo echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s "$(which zsh)"

# Install Oh-my-zsh
echo -e "${green}[+] Installing oh-my-zsh${NC}"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins || exit
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
echo "plugins=(zsh-syntax-highlighting)" >> ~/.zshrc

# Install dotfiles
git clone https://github.com/fguisso/fuckfiles.git ~/.dotfiles

# Source Autoenv
echo -e "${green}[+] Sourcing Autoenv into .zshrc${NC}"
echo "source /usr/local/opt/autoenv/activate.sh" >> ~/.zshrc

################################################################################
# RBEnv, Rubies and Gems
################################################################################
# RBEnv Gem Rehash Plugin
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

echo -e "${green}[+] Installing Ruby 2.2.3 ${NC}"
rbenv install 2.2.3
rbenv global 2.2.3

# Ruby Gems
gems=(
  # haml
  sass
  # rails
  # friction
)

echo -e "${green}[+] Updating RubyGems${NC}"
gem update --system

for (( i = 0 ; i < ${#gems[@]} ; i++ )) do
  echo -e "${green}[+] Installing ${gems[$i]} gem${NC}"
  gem install ${gems[$i]}
done


################################################################################
# Python
################################################################################
# Update Python's pip
echo -e "${green} ${beer} Updating pip${NC}"
pip install --upgrade pip setuptools


################################################################################
# NVM (Node Version Manager), Node and NPM Apps
################################################################################
# Add NVM's working directory to your $HOME path (if it doesn't exist):
mkdir ~/.nvm

# Add the following to $HOME/.bashrc, $HOME/.zshrc, or your shell's equivalent configuration file:
echo "export NVM_DIR=~/.nvm" >> ~/.zshrc
echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.zshrc

# NVM Installs
echo -e "${green} ${beer} Installing lastest Node using NVM${NC}"
nvm install node
nvm alias default node

# Nodejs tools
npm_apps=(
  #gulp
  nodemon
)

echo -e "${green} ${beer} Updating NPM${NC}"
npm install -g npm

for (( i = 0 ; i < ${#npm_apps[@]} ; i++ )) do
  echo -e "${green} ${beer} Installing ${npm_apps[$i]}${NC}"
  npm install -g ${npm_apps[$i]}
done


################################################################################
# Sublime Text
################################################################################
# Install Sublime's Package Control
cd ~/Library/Application\ Support/Sublime\ Text/Packages/ || exit
git clone git://github.com/wbond/sublime_package_control.git Package\ Control
cd Package\ Control || exit
git checkout python3

# Android SDK API install
echo "export ANDROID_HOME=/usr/local/opt/android-sdk" >> ~/.zshrc
android

# Go get command
echo "export PATH=$PATH:/usr/local/opt/go/libexec/bin" >> ~/.zshrc

################################################################################
# Clean up all the mess
################################################################################
echo -e "${green} ${bones} Cleaning up Homebrew Packages${NC}"
brew cleanup
cask cleanup

echo -e "${green} ${beer} Cleaning up RubyGems Packages${NC}"
gem cleanup