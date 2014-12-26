alias e='emacsclient -t'
alias ec='emacsclient -c'
alias ff='firefox'
alias ll='gls -lahG --group-directories-first'
alias t='tree -aI .git'


alias py='python3'
alias ipy='ipython'
alias pys='python -m SimpleHTTPServer'

alias g='git'
alias s='git status'
alias b='git branch'
alias d='git diff'
alias a='git add'
alias m='git merge'

source /usr/local/bin/virtualenvwrapper_lazy.sh
# For autoenv
source /usr/local/bin/activate.sh
# git completions
source /usr/local/Cellar/git/2.2.0/etc/bash_completion.d/git-completion.bash
__git_complete g __git_main
__git_complete b _git_branch
__git_complete d _git_diff
__git_complete s _git_status
__git_complete m _git_merge
__git_complete a _git_add
