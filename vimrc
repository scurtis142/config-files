"COLOUR
colorscheme gruvbox
set bg=dark

"MOUSE
if has("mouse")
	set mouse=a
   " This has something to do with using mouse in vim in tmux but im not sure how it works
   if has("mouse=sgr")
      set ttymouse=sgr
   end
endif


"OPTIONS
syntax on                                  "syntax highlighting on by default
set number                                 "line numbers
set tabstop=3                              "tabs equal 3 spaces
set shiftwidth=3                           "indents are 3 spaces
set expandtab                              "tabs are counted as spaces
set nocindent                              "don't use C syntax for indenting
set autoindent                             "copy indent from current line when starting a new line
set dictionary+=/usr/share/dict/words      "dictionary file ^x^k to use
set guifont=Luxi\ Mono\ 10                 "font
set scrolloff=2                            "scrolls when 2 lines from edge
set nowrap                                 "text dosent wrap
set re=1                                   "use old regex version.. for speedup
set splitright                             "open new splits to the RHS
set shiftround                             "Always indent/outdent to nearest tabstop
set smarttab                               "A <Tab> in front of a line inserts 'shiftwidth' spaces
set ignorecase smartcase                   "case insensitive searching
set laststatus=2                           "always display status line
set hlsearch                               "highlighting on by default
set incsearch                              "show matches while searching
set backspace=indent,eol,start             "backspace these characters by default
set whichwrap+=h,l                         "h and l move to start and end of next & prev lines. NOTE: UNSAFE AND MAY BREAK PLUGINS
let mapleader=","                          "set <Leader> key to comma

"NOTES:
"gq to reformat text with correct textwidth
"set list to see control characters (set nolist to undo)


" Tags file
set tags=/home/simon/Documents/Thesis/tags


" Setting comment string for commentry to work
autocmd FileType perl,pm,sh,cfg,text setl cms=#\ %s
autocmd FileType vim            setl cms=\"\ %s
autocmd FileType html           setl cms=<!--\%s\-->

" vim gitgutter recommended update time (to see changes immediatly)
" Default is 4000
set updatetime=100

"KEY MAPPINIGS
" delete trailing whitespace
nmap <Leader>1 :%s/\s\+$//g<CR>:echo "removed trailing whitespace"<CR>

"find trailing whitespace
nmap <Leader>2 /\s\+$<CR>

"toggle search highlight
nmap <Leader>3 :set hls! <CR>

"insert line errlog (ERR_DEBUG, 'got here 1.0\n')
nmap <Leader>4 oerrlog ($ERR_USER, "got here 1.0");<ESC>==

" reloading and opening vimrc
nmap <Leader>5 :so $MYVIMRC<CR>
nmap <Leader>6 :vs $MYVIMRC<CR>

" Toggling GitGutter and GitGutter highlighting
nmap <Leader>7 :GitGutterToggle<CR>
nmap <Leader>8 :GitGutterLineHighlightsToggle<CR>

" toggle underlining spelling mistakes
nmap <Leader>9 :set spell!<CR>

"display current time
"map <F3> :echo 'Current time is '.strftime('%c')<CR>

" gitgutter undo a hunk
nmap <Leader>u :GitGutterUndoHunk<CR>

" useful commands (save key presses)
nmap c- ct_
nmap c' ct"
nmap c* ct*
nmap c\ ct\

" shortcut to set text width
cmap stw set textwidth=

" highlighting word under cursor dosen't jump to next match
nmap * *N

" escape without pressing escape
imap jk <ESC>

" colon more useful than semicolon
nnoremap ; :

" copy and paste line above
nmap <C-p> yyp

" opening tag location in new split
nmap <C-\> :vs<CR><C-]>

" moving splits right and left
nmap <C-l> <C-w>8<
nmap <C-k> <C-w>8>

" see syntax group
map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
