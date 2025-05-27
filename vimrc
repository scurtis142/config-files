"COLOUR
let g:gruvbox_italic = 1
colorscheme gruvbox
set t_Co=256
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
set dictionary+=/usr/share/dict/british-english      "dictionary file ^x^k to use
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
set autoread                               "autoload file changes (you can undo this by pressing u).
let mapleader=","                          "set <Leader> key to comma

" This will automatically install the vim-plug Plugin manager the first time
" you load this .vimrc, if it is not already installed.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Expecting vim-plug to be installed. See above.
call plug#begin()

" List plugins here
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'npm ci' }
Plug 'airblade/vim-gitgutter'
Plug 'gcmt/taboo.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"NOTES:
"gq to reformat text with correct textwidth
"set list to see control characters (set nolist to undo)
"read! cmd     to paste the output of cmd into the file
" set colorcolumn=80 to set a vertical bar at 80 characters
" <C-w>T       move split to new tab

" Spellcheck
set spelllang=en

" Tags file
set tags=~/tags

" Default line wrap
au BufRead,BufNewFile *.md setlocal textwidth=100 "Set text to wrap at 100 characters for md files

" Setting comment string for commentry to work
autocmd FileType perl,pm,sh,cfg,text setl cms=#\ %s
autocmd FileType vim            setl cms=\"\ %s
autocmd FileType html           setl cms=<!--\%s\-->
autocmd FileType haskell,elm,hs setl cms=--\ %s
autocmd FileType python         setl cms=#\ %s
autocmd FileType javascript,js  setl cms=//\ %s

" Set indent width depending on haskell or elm file
autocmd FileType haskell,hs set tabstop=2
autocmd FileType haskell,hs set shiftwidth=2
autocmd FileType elm set tabstop=4
autocmd FileType elm set shiftwidth=4

" vim gitgutter recommended update time (to see changes immediatly)
" Default is 4000
set updatetime=500

"KEY MAPPINIGS
" delete trailing whitespace
nmap <Leader>1 :%s/\s\+$//g<CR>:echo "removed trailing whitespace"<CR>

"toggle search highlight
nmap <Leader>3 :set hls! <CR>

" reloading and opening vimrc
nmap <Leader>5 :so $MYVIMRC<CR>
nmap <Leader>6 :vs $MYVIMRC<CR>

" Toggling GitGutter and GitGutter highlighting
nmap <Leader>7 :GitGutterToggle<CR>
nmap <Leader>8 :!fourmolu -i <afile><CR>

" toggle underlining spelling mistakes
nmap <Leader>9 :set spell!<CR>

" gitgutter undo a hunk
nmap <Leader>u :GitGutterUndoHunk<CR>

" useful commands (save key presses)
nmap c- ct_
nmap c' ct"
nmap c* ct*
nmap c\ ct\
nmap d' dt"
nmap Y y$

" gcmt / taboo.vim
" Renaming tabs
nmap <Leader>tr :TabooRename

" shortcut to set text width
cmap stw set textwidth=

cnoremap wa<CR> :wa<CR>:!code-sync<CR><CR>

" highlighting word under cursor dosen't jump to next match
nmap * *N

" escape without pressing escape
imap jk <ESC>

" colon more useful than semicolon
nnoremap ; :

" copy and paste line above
nmap <C-p> yyp

" opening tag location in new split
nmap <C-\> :vs<CR>gd

" moving splits right and left
nmap <C-l> <C-w>8<
nmap <C-k> <C-w>8>

" see syntax group
map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" NERDTree

" Put cursor in NERDTree window
nnoremap <leader>n :NERDTreeFocus<CR>

" Toggle NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


"coc.nvim setup

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Restart language server
nmap <leader>cr :CocRestart<CR><CR>:echo "Coc Restarted ! :)"<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
