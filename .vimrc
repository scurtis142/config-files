"COLOUR
colorscheme gruvbox
set bg=dark

"MOUSE
if has("mouse")
	set mouse=a
endif

"OPTIONS
syntax on                                  "syntax highlighting on by default
set number                                 "line numbers
set tabstop=3                              "tabs equal 3 spaces
set shiftwidth=3                           "indents are 3 spaces
set expandtab                              "tabs are counted as spaces
set cindent                                "uses C syntax for indenting
set dictionary+=/usr/share/dict/words      "dictionary file
set guifont=Luxi\ Mono\ 10                 "font
set scrolloff=2                            "scrolls when 2 lines from edge
set nowrap                                 "text dosent wrap
set re=1                                   "use old regex version.. for speedup
set splitright                             "open new splits to the RHS
set hlsearch                               "highlighting on by default
set incsearch                              "show matches while searching
set backspace=indent,eol,start             "backspace these characters by default
set foldmethod=syntax                      "zc, zo will open and close folds in braces

" Akips tags file
set tags=/home/simon/wk/akips/tags

" Case insensitive searching
set ignorecase
set smartcase

" Setting comment string for commentry to work
autocmd FileType perl,pm,sh setl cms=#\ %s
autocmd FileType vim        setl cms=\"\ %s

"KEY MAPPINIGS
"find trailing whitespace
map <F2> /\s\+$<CR>
"display current time
"map <F3> :echo 'Current time is '.strftime('%c')<CR>
"toggle search highlight
map <F3> <ESC>:set hls! <CR>
"insert line errlog (ERR_DEBUG, 'got here 1.0\n')
map <F4> <ESC>ierrlog ($ERR_USER, "got here 1.0");<ESC>==

" useful commands (save key presses)
nmap c- ct_
nmap c' ct"
nmap c\ ct\

" highlighting word under cursor dosen't jump to next match
nmap * *N

" reloading and opening vimrc
map <F5> <ESC>:so $MYVIMRC<CR>
map <F6> <ESC>:vs $MYVIMRC<CR>

" copy and paste line above
nmap <C-p> yyp

" opening tag location in new split
nmap <C-\> :vs<CR><C-]>

" escape without pressing escape
imap jk <ESC>

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
