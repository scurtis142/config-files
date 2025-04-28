
# Packages/Software that is needed

## CRITICAL
- brew (on apple)
- vim
- nvim
- node
- git
- fzf

## NON-CRITICAL
- tmux (brew install tmux)
- pass
- spotify
- slack
- chrome
- firefox
- microsoft teams
- todo list
- Chatty-G

# Shell setup:
- cp (or link) `profile` to `~/.profile`.
- cp (or link) `bashrc` to `~/.bashrc`.

The .profile should source the bashrc file if bashrc is the running shell, which we setup below.

Set the default shell to be bash with `chsh -s /bin/bash` and restart the terminal application.
In the terminal settings pick a default colour scheme.

# Setup SSH Keys

# Setup for Akips code
Open "Disk Utility" and you want to be on the 'Macintosh HD - Data' APFS startup snapshot one.
Right click -> Add APFS Volume, Give it a name and make sure the format is APFS case sensitive. I
named the new volume Akips and it can be found at `/Volumes/Akips`.

Next create a link to that volume from your home directory, and then clone the `akips` repo in it.

Next setup a command or script to sync your local copy of the code repo to build1. For example:
`rsync -azP --delete /Volumes/Akips/akips/ snc@build1.akips.com:your-remote-directory`
Note you will have had to setup SSH keys for this to work well.

# Mac theme
In Settings -> Appearance, set theme to dark so that there's no ugly white bar at the top.

# Vim Setup

### Installing fzf dependencies using Homebrew (need these before setting up vim)
brew install fzf bat ripgrep the_silver_searcher perl universal-ctags

## Setting up files

- Copy `vimrc` to `~/.vimrc` (or create a link, if you want to easily push up changes in the
  future).
- `mkdir -p ~/.vim/colors`
- Copy `gruvbox.vim` to `~/.vim/colors/`
- `mkdir -p ~/.config/nvim/`
- Copy `init.vim` to `~/.config/nvim/init.vim` (or create link)

## Setting up the vim-plug plugin manager
- This should be done the first time you load the .vimrc, but if not, vim-plug is the desired plugin manager, follow
  the online install instructions. If it is installed correctly you should be able to run:

`:PlugInstall`

in a vim session to install all the plugins. Do this now. They may already be install automatically, in which case you
should be able to use them. Try using vim-surround to surround something. You may have to exit vim and reload.

# coc-vim setup and language servers

## Before starting on Corporate Laptops
First see if this is a problem. Run `:CocInstall coc-rust-analyzer`. If the install fails with
something like: "unable to get local issuer certificate", then you will have to do the following:

- Install the ca-certificates package
`brew install ca-certificates`

Look for where the pem file from that package is found. In my case it was:
`usr/local/Cellar/ca-certificates/2025-02-25/share/ca-certificates/cacert.pem`

You will then have to add the following to your .profile (Our default .profile already has this, so
you might not have to do anything, but your path could be different.)

`export NODE_EXTRA_CA_CERTS="/usr/local/Cellar/ca-certificates/2025-02-25/share/ca-certificates/cacert.pem"`

And then restart your shell and try the CocInstall again. If it still doesn't work you may have to
try putting it in your `.npmrc` file. See the below stackoverflow answer for more details.

https://stackoverflow.com/a/73535165

## Language Server Setup

### Rust
`:CocInstall coc-rust-analyzer`

### Typescript
`:CocInstall coc-tsserver`

### JSON
`:CocInstall coc-json`

# TMUX Setup

# Terminal application

# Firefox setup
- Tree tabs
- bookmarks

# Other setup:
- Setup shortcuts if needed
    - Command-x for new terminal
- Setup additional mouse buttons
    - Mouse back and foward for browser back and forward buttons
