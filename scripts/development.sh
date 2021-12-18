#!/usr/bin/env bash

# Fork
brew install --cask fork

################################################################################
# Terminals                                                                    #
################################################################################
# Terminal.app
open "./files/Dracula.terminal"
#open "./files/Solarized_Dark.terminal"

# iTerm2
brew tap homebrew/cask-versions
brew install --cask iterm2
/Applications/iTerm.app/Contents/MacOS/iTerm2 &
sleep 5
killall iTerm2
open "./files/Dracula.itermcolors"
# open "./files/Solarized_Dark.itermcolors"
# open "./files/termk.itermcolors"
mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles/
cp -f ./files/Dracula.itermprofiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
# Use a modified version of the Dracula theme by default in Terminal.app
osascript <<EOD
tell application "Terminal"

  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeName to "Dracula"

  (* Store the IDs of all the open terminal windows. *)
  set initialOpenedWindows to id of every window

  (* Open the custom theme so that it gets added to the list
     of available terminal themes (note: this will open two
     additional terminal windows). *)
  do shell script "open 'files/" & themeName & ".terminal'"

  (* Wait a little bit to ensure that the custom theme is added. *)
  delay 10

  (* Set the custom theme as the default terminal theme. *)
  set default settings to settings set themeName

  (* Get the IDs of all the currently opened terminal windows. *)
  set allOpenedWindows to id of every window

  repeat with windowID in allOpenedWindows

  (* Close the additional windows that were opened in order
     to add the custom theme to the list of terminal themes. *)
  if initialOpenedWindows does not contain windowID then
  close (every window whose id is windowID)

  (* Change the theme for the initial opened terminal windows
     to remove the need to close them in order for the custom
     theme to be applied. *)
  else
  set current settings of tabs of (every window whose id is windowID) to settings set themeName
  end if

  end repeat

end tell
EOD

# Enable "focus follows mouse" for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true
# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0
# Don't display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

################################################################################
# Install Docker, Kubernetes, Heroku, Terraform, Vagrant, VirtualBox           #
################################################################################
brew install docker
brew install docker-compose
brew install --cask vagrant
brew install --cask vagrant-manager
brew install --cask virtualbox

################################################################################
# Kite                                                                         #
################################################################################
brew install --cask kite

################################################################################
# VSCode                                                                       #
################################################################################
brew install --cask visual-studio-code
code --install-extension davidanson.vscode-markdownlint
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension formulahendry.code-runner
code --install-extension kiteco.kite
code --install-extension hookyqr.beautify
code --install-extension knisterpeter.vscode-github
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension hashicorp.terraform
code --install-extension mjmcloug.vscode-elixir
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode.go
code --install-extension ms-python.python
code --install-extension ms-vscode.terraform
code --install-extension peterjausovec.vscode-docker
code --install-extension pgourlain.erlang
code --install-extension rebornix.ruby
code --install-extension redhat.vscode-yaml
code --install-extension rust-lang.rust
code --install-extension shan.code-settings-sync


