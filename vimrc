"COLOUR
colorscheme gruvbox
set bg=dark

"MOUSE
if has("mouse")
	set mouse=a
   " This has something to do with using mouse in vim in tmux but im not sure how it works
   if has("mouse=sgr")
      set ttymouse=sgr
   else
      set ttymouse=xterm2
   end
endif
" This has something to do with using mouse in vim in tmux but im not sure how it works
"if &term =~ '^screen'
"    " tmux knows the extended mouse mode
"    set ttymouse=xterm2
"endif

"OPTIONS
syntax on                                  "syntax highlighting on by default
set number                                 "line numbers
set tabstop=3                              "tabs equal 3 spaces
set shiftwidth=3                           "indents are 3 spaces
set expandtab                              "tabs are counted as spaces
set cindent                                "uses C syntax for indenting
set dictionary+=/usr/share/dict/words      "dictionary file ^x^k to use
set guifont=Luxi\ Mono\ 10                 "font
set scrolloff=2                            "scrolls when 2 lines from edge
set nowrap                                 "text dosent wrap
set re=1                                   "use old regex version.. for speedup
set splitright                             "open new splits to the RHS
set hlsearch                               "highlighting on by default
set incsearch                              "show matches while searching
set backspace=indent,eol,start             "backspace these characters by default
set whichwrap+=h,l                         "h and l move to start and end of next & prev lines. NOTE: UNSAFE AND MAY BREAK PLUGINS
"set foldmethod=syntax                      "zc, zo will open and close folds in braces

" Tags file
set tags=/home/simon/Documents/Thesis/tags

" Case insensitive searching
set ignorecase
set smartcase

" Setting comment string for commentry to work
autocmd FileType perl,pm,sh,cfg setl cms=#\ %s
autocmd FileType vim            setl cms=\"\ %s
autocmd FileType html           setl cms=<!--\%s\-->

" vim gitgutter recommended update time (to see changes immediatly)
" Default is 4000
set updatetime=100

"KEY MAPPINIGS
"find trailing whitespace
map <F2> /\s\+$<CR>
"display current time
"map <F3> :echo 'Current time is '.strftime('%c')<CR>
"toggle search highlight
map <F3> <ESC>:set hls! <CR>
"insert line errlog (ERR_DEBUG, 'got here 1.0\n')
map <F4> <ESC>oerrlog ($ERR_USER, "got here 1.0");<ESC>==

" useful commands (save key presses)
nmap c- ct_
nmap c' ct"
nmap c\ ct\

" highlighting word under cursor dosen't jump to next match
nmap * *N

" escape without pressing escape
imap jk <ESC>

" colon more useful than semicolon
nnoremap ; :

" reloading and opening vimrc
map <F5> <ESC>:so $MYVIMRC<CR>
map <F6> <ESC>:vs $MYVIMRC<CR>

" copy and paste line above
nmap <C-p> yyp

" opening tag location in new split
nmap <C-\> :vs<CR><C-]>

" moving splits right and left
nmap <C-l> <C-w>8<
nmap <C-k> <C-w>8>

" Toggling GitGutter and GitGutter highlighting
map <F7> <ESC>:GitGutterToggle<CR>
map <F8> <ESC>:GitGutterLineHighlightsToggle<CR>

" toggle underlining spelling mistakes
map <F9> <ESC>:set spell!<CR>

" see syntax group
map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
