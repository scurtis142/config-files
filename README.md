
# Packages/Software that is needed

## CRITICAL
- brew (on apple)
- vim
- nvim
- node
- git

## NON-CRITICAL
- pass
- spotify
- chrome
- firefox

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
