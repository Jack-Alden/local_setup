export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias spreadEm='defaults write com.apple.finder AppleShowAllFiles YES'
alias foldEm='defaults write com.apple.finder AppleShowAllFiles NO'
alias updateBash='nano ~/.bash_profile'
alias dev='cd ~/workspace'
alias devSam='cd ~/workspace/sample_app'
alias gps='git push'
alias rls='rails s'
