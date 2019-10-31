# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# fix arguments input error "no matches found"
setopt no_nomatch

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -alF'
# alias vim='/usr/local/Cellar/vim/8.0.1150/bin/vim'
# alias vi='/usr/local/Cellar/vim/8.0.1150/bin/vim'
alias pss='/usr/local/bin/pss --noheading --nobreak'
alias lsusb='system_profiler SPUSBDataType'
# alias fg behavior to bash
fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}
bg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}

# audojump config
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# path of Android Studio platform tools
export PATH="/usr/local/Cellar/coreutils/8.28_1/libexec/gnubin:$HOME/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# shadowsocket http proxy
proxyon() {
    # export HTTP_PROXY=http://localhost:1087; export HTTPS_PROXY=https://localhost:1087; export ALL_PROXY=socks5://127.0.0.1:7070
	# networksetup -setwebproxy "Wi-Fi" 127.0.0.1 1087
	# networksetup -setsecurewebproxy "Wi-Fi" 127.0.0.1 1087

	export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:7891
	networksetup -setwebproxy "Wi-Fi" 127.0.0.1 7890
	networksetup -setsecurewebproxy "Wi-Fi" 127.0.0.1 7890
	networksetup -setsocksfirewallproxy "Wi-Fi" 127.0.0.1 7891

	networksetup -setwebproxystate "Wi-Fi" on
	networksetup -setsecurewebproxystate "Wi-Fi" on
	networksetup -setsocksfirewallproxystate "Wi-Fi" on
	#
	curl ip.gs
}

proxyoff() {
    export http_proxy=
    export https_proxy=
	export all_proxy=
	networksetup -setwebproxystate "Wi-Fi" off
	networksetup -setsecurewebproxystate "Wi-Fi" off
	networksetup -setsocksfirewallproxystate "Wi-Fi" off

	curl ip.gs
}
GREP_OPTIONS="--exclude-dir=.git"
GREP_OPTIONS+=" --exclude=tags"

# path of anaconda3
scipyon() {
	export PATH="$HOME/anaconda3/bin:$PATH"
	source activate $HOME/anaconda3
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

