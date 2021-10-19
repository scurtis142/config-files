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

# include the vasm assembler directory in PATH
if [ -d "$HOME/documents/electronics/vasm" ] ; then
   PATH="$PATH:$HOME/documents/electronics/vasm"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Default
alias h='fc -l'
alias j=jobs
alias m="$PAGER"
alias ll='ls -laFo'
alias l='ls -l'
alias g='egrep -i'

#Files
alias today='vim ~/documents/personal/today'
alias things='vim ~/documents/personal/things'
alias scratch='vim ~/documents/personal/scratch'

# Command Shortcuts
alias c='clear'
alias cs='clear && git status'
alias cl='clear && ls -l'
alias cls='clear && ls'
alias cla='clear && ls -lah'
alias gl='git log'
alias cgd='clear && git diff'
alias modpr='vim ~/.profile'
alias modkh='vim ~/.ssh/known_hosts'
alias loadpr='. ~/.profile'
alias su='su -'
alias ag='ag --ignore-dir mib'
alias findf='find . -name'
alias dater='date -r'
alias dates="date '+%s'"
alias perldocf='perldoc -f'
alias watch1='watch -n 1'
alias weather='curl http://v2.wttr.in/Brisbane'
alias office='libreoffice'
alias chrome='chromium'
alias checkping='ping 8.8.8.8'
alias checkdns='ping google.com'
alias prnix='cd /home/simon/Documents/majestic && nix-shell'

# Prompt
PS1="\W$ "

# Set shell promtp to vi mode
set -o vi

# Rust stuff
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"

# Setting vim to be default editor
VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim
