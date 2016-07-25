export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
 
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
 
print_before_the_prompt () {
    printf "\n$bldpur%s Root: $txtgrn%s $bldylw%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
}
 
PROMPT_COMMAND=print_before_the_prompt
PS1='> '
PS2='$ '

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The usual suspects
alias spreadEm='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias foldEm='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias updateBash='nano ~/.bash_profile'
alias confignewton='ruby ~/Documents/ConfigNewton/confignewton/bin/run.rb'

# Text edit
alias komodo='open -a "Komodo Edit 10"'

# Development shortcuts
alias gps='git push'
alias gpl='git pull'
alias rls='rails s'
alias glg='clear && git lg'
