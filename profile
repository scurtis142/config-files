# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Some useful aliases
alias h='fc -l'
alias j=jobs
alias m="$PAGER"
alias ll='ls -laFo'
alias l='ls -l'
alias g='egrep -i'

# Custom
alias ls='ls -G'
alias wkdir='cd ~/wk/akips'
alias mibs='cd ~/wk/akips/mib'
alias su='su -'
alias ag='ag --ignore-dir mib'
alias findf='find . -name'
alias dater='date -r'
alias weather='curl http://v2.wttr.in/Brisbane'
alias c='clear'
alias cs='clear && git status'
alias cl='clear && ls -l'
alias cls='clear && ls'
alias cla='clear && ls -lah'

# SSH
alias dev11='ssh vm@dev11'
alias dev12='ssh vm@dev12'
alias dev16='ssh vm@dev16'
alias 11-6='ssh akips@dev11-6'
alias 11-9='ssh simulator@dev11-9'
alias 11-4='ssh akips@dev11-4'
alias 11-14='ssh akips@dev11-14'
alias 10-13='ssh akips@dev10-13'
alias 11-7='ssh simulator@dev11-7'
alias 11-8='ssh akips@dev11-8'
alias 12-9='ssh simulator@dev12-9'
alias 12-10='ssh akips@dev12-10'
alias build1="ssh -t snc@build1 'cd akips && exec $SHELL'"
alias fserv="ssh -t snc@intranet1 'cd /home/share && exec $SHELL'"

# Prompt
PS1="\W$ "

set -V
set -o vi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export RTE_SDK=/home/simon/Documents/Thesis/dpdk-18.11.2/dpdk-stable-18.11.2/
export RTE_TARGET=x86_64-native-linuxapp-gcc
