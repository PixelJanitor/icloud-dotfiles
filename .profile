# Additional PATH configuration --------------------------------------------

## My own scripts
PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:`yarn global bin`"

eval "$(rbenv init -)"

## Ruby binstubs (note: this can be exploited at untrusted working directories!)
PATH="./bin:$PATH"


# Bash settings --------------------------------------------

## stickier .bash_history
shopt -s histappend

## Set up tab-completion (requires `brew install bash-completion`)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi


# Other Customization --------------------------------------------

## Editor registration for git, etc
export VISUAL="mvim -f"
export EDITOR="$VISUAL"

## Reference the location of iCloud Drive
export ICLOUD_DRIVE="$HOME/icloud-drive"

## Increase limit of open file descriptors because watch processes
ulimit -n 10000

# Bash Aliases
alias be='bundle exec'
alias orl='atom ~/.profile'
alias rl='source ~/.profile'
alias g='git'
alias gc='atom ~/.gitconfig'
alias github='hub browse'
alias rc='rails console'
alias gst='git status'
alias tower='gittower'
alias stash='git stash -u'
alias stashpop='git stash pop'
alias code='cd ~/Code'

alias flye='NODE_ENV=development-staging yarn start'

# xcode

function xcode() {
  xcworkspace=`ls -ld *.xcworkspace 2>/dev/null`
  if [ -z "$xcworkspace" ] ; then
    open *.xcodeproj
  else
    open *.xcworkspace
  fi
}

# Append current git branch in prompt

parse_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo " ($git_branch)"

}

export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Git branch autocomplete

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
