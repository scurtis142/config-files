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

# Directories
alias wkdir='cd ~/wk/akips'
alias docs='cd ~/wk/docs'
alias secondary='cd ~/wk/secondary-akips'
alias mibs='cd ~/wk/akips/mib'
alias func='cd ~/documents/COMP3400'

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

# SSH
alias build1="ssh snc@build1"
alias fserv="ssh -t snc@intranet1 'cd /home/share && exec $SHELL'"
alias uploads="ssh -t snc@intranet1 'cd /home/share/support/uploads && exec $SHELL'"
alias intranet="ssh snc@intranet1"
alias mitchell="ssh mitchell@mitchell"
alias long="ssh lng@long"
alias dev10="ssh vm@dev10"
alias dev11="ssh vm@dev11"
alias dev12="ssh vm@dev12"
alias dev13="ssh vm@dev13"
alias dev14="ssh vm@dev14"
alias dev15="ssh vm@dev15"
alias dev16="ssh vm@dev16"
alias 11-40="ssh simulator@dev11-40"
alias 11-41="ssh akips@dev11-41"
alias 11-42="ssh akips@dev11-42"
alias 11-43="ssh akips@dev11-43"
alias 13-40="ssh simulator@dev13-40"
alias 13-41="ssh akips@dev13-41"

# Prompt
PS1="\W$ "

# Make it so shell scripts write input to stderr (I think)
set -V

# Set shell promtp to vi mode
set -o vi

# Rust stuff
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"

# Setting vim to be default editor
VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim
