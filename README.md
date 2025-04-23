
# Packages/Software that is needed

## CRITICAL
- brew (on apple)
- vim
- nvim
- node
- git
- fzf

### Installing fzf dependencies using Homebrew (need these before setting up vim)
brew install fzf bat ripgrep the_silver_searcher perl universal-ctags

## NON-CRITICAL
- pass
- spotify
- chrome
- firefox

# Shell setup:
- cp (or link) `profile` to `~/.profile`.
- cp (or link) `bashrc` to `~/.bashrc`.

The .profile should source the bashrc file if bashrc is the running shell, which we setup below.

Set the default shell to be bash with `chsh -s /bin/bash` and restart the terminal application.
In the terminal settings pick a default colour scheme.

# Vim Setup

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

# Other setup:
