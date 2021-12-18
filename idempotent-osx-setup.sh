#!/bin/sh

# `set -eu` causes an 'unbound variable' error in case SUDO_USER is not set
SUDO_USER=$(whoami)

# Install Homebrew
which brew > /dev/null 2>&1
if [ $? -eq 1 ]; then
	#Cheat, if we don't have brew, install xcode command line utils too
	xcode-select --install

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew update
fi

# Homebrew packages to install
BREW_PKGS=(
        curl
    	cask
		coreutils
		diffutils
		findutils
        git
		git-extras
		mas
		syncthing
		tree
		wget
		zsh
)

for i in "${BREW_PKGS[@]}"
do
	brew install $i
done

# Install oh-my-zsh
if [ -n "$ZSH_VERSION" ]; then
	chsh -s /bin/zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo "export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8" >> ~/.zshrc
fi

# Brew Cask packages to install
brew tap caskroom/cask

BREW_CASKS=(
		alfred
     	cheatsheet
		discord
		docker
		dropbox
		fork
		google-chrome
		keepingyouawake
		lyx
		miro
		obsidian
		notion
		nextcloud
		plex
		raspberry-pi-imager
		rectangle
		rescuetime
		slack
		vagrant
        virtualbox
		visual-studio-code
		vlc
		zoom
		zotero
		iterm2
		Spotify
)

for i in "${BREW_CASKS[@]}"
do
    sudo -u $SUDO_USER brew install --cask $i
done

# Install from mac app store
echo "Installing Mac App Store apps..."
MAS_APPS=(
		1352778147 
		1147396723 
		1176895641 
		1529448980 
		425424353  
		1451685025 
		462054704 
		462062816 
		462058435 
		1528890965
)
for i in "${MAS_APPS[@]}"
do
    sudo -u $SUDO_USER mas install $i
done

# Install MAC Tex
echo "Installing MACtex"
sudo -u $SUDO_USER brew install --cask mactex-no-gui

# Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -p /opt/miniconda

