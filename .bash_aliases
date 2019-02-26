pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias ff='firefox'
alias ll='ls -lahG'
alias t='tree -aI ".git|__pycache__|*.pyc"'

alias bitc='/Users/pcx/base/bitcoin/src/bitcoin-cli'
alias bitd='/Users/pcx/base/bitcoin/src/bitcoind -daemon -debug'

alias py='python3'
alias ipy='ipython'
alias pys='python3 -m http.server'

alias g='git'
alias s='git status'
alias b='git branch'
alias d='git diff'
alias a='git add'
alias m='git merge'

alias yt-dl-mp3='youtube-dl --extract-audio --audio-format mp3'

# VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
# source /usr/local/bin/virtualenvwrapper_lazy.sh

# For autoenv
# source /usr/local/bin/activate.sh

# For chruby
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh

# git completions
source /usr/local/etc/bash_completion.d/git-completion.bash
__git_complete g __git_main
__git_complete b _git_branch
__git_complete d _git_diff
__git_complete s _git_status
__git_complete m _git_merge
__git_complete a _git_add


# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."

# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="."

# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="."

# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# return the prompt prefix for the second line
function set_prefix {
    BRANCH=`__git_ps1`
    if [[ -z $BRANCH ]]; then
        echo "${NORMAL}o"
    else
        echo "${UNDERLINE}+"
    fi
}

# PS1='${GREEN}\u${BLACK}@${CYAN}\h:${MAGENTA}\w${WHITE}`__git_ps1 " (%s)"`\$ '
PS1='\[\033[0;36m\]\u@\h\[\033[01m\]:\[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]`__git_ps1 " (%s)"`\[\033[00m\]\[\033[0;37m\]$(__docker_machine_ps1 " [%s]")\n\$ '
# PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n`set_prefix`${NORMAL}${CYAN}\033[s\033[60C (`date "+%a, %b %d"`)\033[u${WHITE} '
# PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n[\\W$(__docker_machine_ps1 " [%s]")]\$ '


export GOPATH=~/base/golang
pathadd /usr/local/opt/go@1.10/libexec/bin
pathadd ~/base/golang/bin


export ANDROID_HOME=$HOME/Library/Android/sdk
pathadd $ANDROID_HOME/platform-tools
pathadd $ANDROID_HOME/tools
pathadd ~/Library/Python/2.7/bin
alias adb_dialog="adb shell input keyevent 82"
alias adb_reload="adb shell input keyevent 82 && adb shell input tap 240 420"
alias adb_reverse="adb reverse tcp:8081 tcp:8081"
alias _nweb="cd ~/base/golang/src/gitlab.com/neta-in/webapp"
alias swift="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH swift"
alias _jojo="cd ~/base/golang/src/gitlab.com/jojolive/jojo"
