#!/usr/bin/env zsh

# Homebrew
if [ -d /opt/homebrew ]; then
  export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
elif [ -d /usr/local/homebrew ]; then
  export PATH=/usr/local/homebrew
fi

# Local
export PATH=$HOME/.local/bin:$HOME/.local/sbin:$PATH

################################################################################
# colorls                                                                      #
################################################################################
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls --group-directories-first --hyperlink --dark --report'
alias lc='colorls --group-directories-first --hyperlink --dark --tree --all'
source $(dirname $(gem which colorls))/tab_complete.sh

################################################################################
# Oh My Zsh                                                                    #
################################################################################
# Plugins and Customizations
export ZSH=$HOME/.oh-my-zsh
export DEFAULT_USER=$USER
ENABLE_CORRECTION="false"
HIST_STAMPS="mm/dd/yyyy"
TERM=xterm-256color
plugins=(git aws bundler cargo colorize command-not-found common-aliases compleat \
    docker docker-compose gem git git-extras git-flow github gitignore golang \
    history history-substring-search kubectl last-working-dir node npm nvm osx \
    pip pyenv pylint python rake rbenv react-native ruby rvm ssh-agent sudo \
    terraform themes tmux tmuxinator virtualenv xcode zsh-autosuggestions \
    zsh-syntax-highlighting zsh-navigation-tools)

autoload -U compinit && compinit
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%H:%M  \UF133  %d.%m.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon ssh root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status rvm time)

# Powerlevel10k
POWERLEVEL10K_MODE='awesome-fontconfig'
POWERLEVEL10K_PROMPT_ON_NEWLINE=true
POWERLEVEL10K_PROMPT_ADD_NEWLINE=true
POWERLEVEL10K_RPROMPT_ON_NEWLINE=true
POWERLEVEL10K_SHORTEN_DIR_LENGTH=2
POWERLEVEL10K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL10K_RVM_BACKGROUND="black"
POWERLEVEL10K_RVM_FOREGROUND="249"
POWERLEVEL10K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL10K_TIME_BACKGROUND="black"
POWERLEVEL10K_TIME_FOREGROUND="249"
POWERLEVEL10K_TIME_FORMAT="\UF43A %D{%H:%M  \UF133  %d.%m.%y}"
POWERLEVEL10K_RVM_BACKGROUND="black"
POWERLEVEL10K_RVM_FOREGROUND="249"
POWERLEVEL10K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL10K_STATUS_VERBOSE=false
POWERLEVEL10K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL10K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL10K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL10K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL10K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL10K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL10K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL10K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL10K_FOLDER_ICON=''
POWERLEVEL10K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL10K_STATUS_VERBOSE=false
POWERLEVEL10K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL10K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL10K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL10K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL10K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL10K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL10K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL10K_MULTILINE_SECOND_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(context os_icon ssh root_indicator dir vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status rvm time)

# Spaceship
# ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL=" \uf0e7"
SPACESHIP_CHAR_PREFIX="\uf296"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"

# Set Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="powerlevel10k/powerlevel9k"
#ZSH_THEME="spaceship-prompt/spaceship"

# Enable Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Autojump
source $(brew --prefix)/share/autojump/autojump.zsh

