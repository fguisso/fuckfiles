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
  # caskroom/versions
  bramstein/webfonttools
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

  ack
  p7zip

  # Programing languages and SDKs
  # android-sdk
  # android-ndk
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
  #arduino
  appcleaner
  #adobe-creative-cloud
  ngrok
  spectacle
  telegram
)

for (( i = 0 ; i < ${#cask_apps[@]} ; i++ )) do
  echo -e "${green}[+] Installing ${cask_apps[$i]} ${NC}"
  brew install --cask ${cask_apps[$i]}
done

################################################################################
# ZSH
################################################################################
# Install Oh-my-zsh
echo -e "${green}[+] Installing oh-my-zsh${NC}"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins || exit
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
echo "plugins=(zsh-syntax-highlighting)" >> ~/.zshrc

################################################################################
# Clean up all the mess
################################################################################
echo -e "${green} ${bones} Cleaning up Homebrew Packages${NC}"
brew cleanup
