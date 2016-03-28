export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias spreadEm='defaults write com.apple.finder AppleShowAllFiles YES'
alias foldEm='defaults write com.apple.finder AppleShowAllFiles NO'
alias updateBash='nano ~/.bash_profile'

alias dev='cd ~/workspace'
alias devSam='cd ~/workspace/sample_app'
alias devBan='cd ~/workspace/bandock'
alias playground='cd ~/workspace/rails_playground'
alias koans='cd ~/workspace/koans'

alias komodo='open -a "~/Applications/Komodo Edit 9"'

alias gps='git push'
alias gpl='git pull'
alias rls='rails s'

alias pug='ruby ~/Documents/local_setup/setup_updater/update_local_setup.rb'
