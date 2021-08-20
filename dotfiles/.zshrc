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
plugins=(git brew osx svn extract pod)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/git-flow-completion.zsh

# Global aliases
alias -g G='| grep'
alias -g L='| less'

# Normal aliases
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gsh='git show --unified=10 $@'
alias gd='git d --word-diff --ignore-space-at-eol -b -w --ignore-blank-lines $@'
alias gds='git diff --stat $@'
alias dpush='git push origin develop'
alias dpull='git pull origin develop'
alias gu='git-up'
alias c='git commit -v $@'
alias gcp='git commit -p -v $@'
alias s='git status -sb'
alias b='git branch -avv'
alias r='git svn rebase'
alias lg='git lg'
alias lgf='git lgf'
alias lgme='git lg -500 | egrep " (mgroeger|Mattes Groeger)\)"'
alias ls="ls -G"
alias ll='ls -hl'
alias la='ls -hal'
alias unfuckbootstrap="launchctl list|grep UIKitApplication|awk '{print $3}'|xargs launchctl"

# Directories
hash -d workspace=~/Documents/workspaces
hash -d wsios=~/Documents/workspaces/objective-c
hash -d sbs=~/Documents/workspaces/sbs
hash -d puios=~/Documents/workspaces/project-wooga/pocketvillage

function fnd {
  find . -name $1
  # echo **/*[^.fla][^.jar](Lm+1) | xargs ls -la
}

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/git/libexec/git-core:/usr/local/sbin:/usr/local/opt/mongodb:/usr/local/scala/scala-2.8.0.final/bin:/usr/local/apparat/apparat-1.0-RC9:/usr/local/bin/xcode-universal-binary:/usr/X11/bin:$PATH
export CLOUDANT_URL=https://app4215228.heroku:gObSmm6KkKdhmLfoQxrNOmyq@app4215228.heroku.cloudant.com
export NODE_PATH=NODE_PATH:/usr/local/lib/node_modules

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/mattes/.travis/travis.sh ] && source /Users/mattes/.travis/travis.sh
[ -f /Users/mattesgroeger/.travis/travis.sh ] && source /Users/mattesgroeger/.travis/travis.sh

export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

export NVM_DIR="/Users/mattes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
