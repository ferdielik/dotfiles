## colors
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 4)\]"
WHITE="\[$(tput setaf 7)\]"
GREEN="\[$(tput setaf 2)\]"
CYAN="\[$(tput setaf 6)\]"

## shell config
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:ls:mv:rm:cp:l:[bf]g:exit"
export HISTFILESIZE=
export HISTSIZE=
# export PROMPT_COMMAND='history -a'

export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1

shopt -s histappend # ensuring bash history across multiple sessions
shopt -s cmdhist  # This lets you save multi-line commands to the history as one command
shopt -s checkwinsize

[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s autocd  # stty stop ""  # check later

# export PS1="\t \u@\h:\$(pwd) ${BOLD} \$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\n$ "
export PS1="${CYAN}\t ${WHITE}\u@${GREEN}\h${WHITE}:\$(pwd) ${CYAN} ${BOLD} \$(__git_prompt_info)\n${WHITE}$ ${RESET}"


## aliases
alias grep='grep --color=auto "$@"'
alias ~=cd
alias ..='cd ..'
alias ...='..; ..'
alias ....='..; ...'
alias l='ls -la'
alias sz='source ~/.bashrc'
alias date='date +"%d.%m.%Y %H:%M:%S"'
alias weather='curl -4 http://wttr.in'

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# python or jq required
 _curl () {
    curl $@ | python -mjson.tool
    # curl $@ | jq
 }