# Load other bash files
if [ -a ~/.bashrc ]; then
    source ~/.bashrc
fi

# Bash aliases
if [ -e ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Brew bash-completion:

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# PS1 Variable setup
NONE="$(tput setaf 9)"
WHITE="$(tput setaf 7)"
RED="$(tput setaf 1)"
HC="$(tput setaf 5)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"

# return status code
function get_exit_status() {
	es=$?
	if [ $es -eq 0 ]
	then
		echo -e "\[$GREEN\]${es}\[$NONE\]"
	else
		echo -e "\[$RED\]${es}\[$NONE\]"
	fi
}

# Git branch in PS1, cross platform version
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set PS1
export PS1="\[$RED\][\[$WHITE\]\u\[$RED\]][\[$HC\]\h\[$RED\]][\[$WHITE\]\t\[$RED\]][\[$WHITE\]$(get_exit_status)\[$RED\]]\n[:\[$WHITE\]\w\[$RED:\]][:\[$GREEN\]\$(~/.rvm/bin/rvm-prompt)\[$RED\]:]\[$YELLOW\]\$(parse_git_branch)\[$WHITE\]\n:]"


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
