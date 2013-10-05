# Aliases
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gsh='git show --unified=10 $@'
alias dpush='git push origin develop'
alias dpull='git pull origin develop'
alias gd='git d --word-diff $@'
alias c='git commit -v $@'
alias s='git status -sb'
alias b='git branch -avv'
alias r='git svn rebase'
alias lg='git lg'
alias ls="ls -G"
alias ll='ls -hl'
alias la='ls -hal'

# directories
hash -d ws=~/Documents/workspaces

function fnd {
  find . -name $1
  # echo **/*[^.fla][^.jar](Lm+1) | xargs ls -la
}

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx svn extract)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/git-flow-completion.zsh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/Applications/Development/nodejs/bin/bin:/usr/local/opt/mongodb

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NODE_PATH="/usr/local/lib/node_modules/"
