#!/usr/bin/env bash

export BOOTSTRAP_MACOS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m BASH_SOURCE[0]=${BASH_SOURCE[0]} BOOTSTRAP_MACOS_DIR=${BOOTSTRAP_MACOS_DIR}"
trap "echo Exiting: ./setup.sh >&2; exit" SIGUSR1

echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Please enter your password for sudo access."

# Ask for the administrator password upfront
sudo -v
if [ $? -ne 0 ]; then
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m You will need sudo access to run this setup."
  exit
fi
# Keep-alive: update existing `sudo` time stamp until we finish
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Pull up System Preferences > Security & Privacy > Privacy > Accessibility
function addTerminalToPrivacyAccessibility() {
  echo
  echo -e "Click \"\033[1mOK\033[0m\" in the following popup so we can get you "
  echo    "    where you need to be. Then press any key to continue..."
  read -p "" -n 1

  osascript <<EOD
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.security"
  reveal anchor "Privacy_Accessibility" of pane id "com.apple.preference.security"
end tell
EOD

  echo    "In System Preferences > Security & Privacy > Privacy >"
  echo    "    Accessibility >"
  echo -e "Click the \xf0\x9f\x94\x92 (\033[1mLOCK\033[0m) icon in the bottom left"
  echo -e "Enter your password and click the \"\033[1m+\033[0m\" (\033[1mPLUS\033[0m) button"
  echo    "Then navigate to Applications > Utilities > Terminal and"
  echo -e "    click the \033[1mOpen\033[0m button"
  echo    "Press any key to continue..."
  read -p "" -n 1
}

# Run all of the shell scripts for setting up the machine
function runSetup() {
  # Backup users dotfiles and copy over our dotfiles
  #( ./scripts/dotfiles.sh )

  # Get the permissions we will need manually
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Adding Terminal.app to be able to execute applescript: ./setup.sh"
  echo
  addTerminalToPrivacyAccessibility

  # Install Xcode CLI tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Xcode CLI tools:"
  echo    "  ./scripts/xcode_cli_tools.sh"
  echo
  ( ./scripts/xcode_cli_tools.sh )

  # Setup macOS Preferences and Settings
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of macOS:"
  echo    "./scripts/macos.sh"
  echo
  ( ./scripts/macos.sh )

  # Install Homebrew
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running Homebrew install:"
  echo    "  ./scripts/brew_install.sh"
  echo
  ( ./scripts/brew_install.sh )

  # Install Core Command Line Interface Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of core CLI tools:"
  echo    "  ./scripts/cli_core.sh"
  echo
  ( ./scripts/cli_core.sh )

  # Setup Python
  #echo
  #echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Python:"
  #echo    "  ./scripts/python.sh"
  #echo
  #( ./scripts/programming/python.sh )

  # Install Fonts
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of fonts:"
  echo    "  ./scripts/fonts.sh"
  echo
  ( ./scripts/fonts.sh )

  # Setup ZShell
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running setup of ZShell:"
  echo    "  ./scripts/shells/zsh.sh"
  echo
  ( ./scripts/shells/zsh.sh )

  # Install Productivity Applications
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of productivity"
  echo    "applications: ./scripts/productivity.sh"
  echo
  ( ./scripts/productivity.sh )

  # Install Development Tools
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of development tools:"
  echo    "  ./scripts/development.sh"
  echo
  ( ./scripts/development.sh )

  # Cleanup Homebrew
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running clean up of Homebrew:"
  echo    "  ./scripts/brew_cleanup.sh"
  echo
  ( ./scripts/brew_cleanup.sh )
}

echo
echo -e  "\033[1mBOOTSTRAP_MACOS:\033[0m Starting Bootstrap of macOS"
echo
echo -ne "\033[1mBOOTSTRAP_MACOS:\033[0m "
echo -ne "\033[31m\033[5m\033[7m\033[1mWARNING!\033[0m This script "
echo -e  "\033[1mWILL\033[0m overwrite some settings and files!"
echo -ne "Did you read \033[1mALL\033[0m of the scripts (i.e. "scripts/*.sh" files)? "
echo -ne  "[y,N]: "
read -p "" -n 1 YESNO
case $YESNO in
  [Yy]* )
    echo
    echo -ne "And you are \033[1mSURE\033[0m you still want to run this? "
    echo -ne "[y,N]: "
    read -p "" -n 1 YESNO
    case $YESNO in
      [Yy]* )
        echo
        runSetup $@
      ;;
      [Nn]* )
        echo
        exit
      ;;
      * )
        echo
        echo "Please answer [Y]es or [N]o"
      ;;
    esac
  ;;
  [Nn]* )
    echo
    exit
  ;;
  * )
    echo
    echo "Please answer [Y]es or [N]o."
;;
esac

echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Bootstrap of macOS complete"
echo
