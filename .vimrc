" BABIC SETTINGS ***********************************************************
set nocompatible            " use vim defaults
set encoding=utf-8          " set encoding
set noswapfile

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

set number                  " show line numbers
set showmode                " show actual mode
set title                   " terminal title
set t_Co=256                " terminal in 256 colors
set ruler                   " show the cursor position all the time
"set laststatus=2            " status bar
set showmatch               " Pri zápise otvárajúcej/zatvárajúcej zátvorky, ukáž jej párovú zátvorku

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Whitespace stuff
set nowrap             " Nezalamuj riadky
set tabstop=2          " numbers of spaces of tab character
set shiftwidth=2       " numbers of spaces to (auto)indent
set softtabstop=2

set expandtab          " tabs are converted to spaces, use only when required
set list listchars=tab:\ \ ,trail:·

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Indenting
set autoindent         " Odsadzuj nové riadky podľa predchádzajúcich
set smartindent        " Odsadzuj inteligentne podľa jazyka
set sw=2 sts=2 ts=2 et " Používaj medzery namiesto tabulátorov

" Searching
" Press Ctrl-N to turn off highlighting.
set hlsearch           " highlight searches
set incsearch          " do incremental searching
set ignorecase         " ignore case when searching
set smartcase          " if searching and search contains upper case, make case sensitive search

nmap <silent> <C-N> :silent noh<CR>

" MAPING ********************************************************************
let mapleader = ","

" Escape from insert mode
imap jj <Esc>

" Fast save
nmap <leader>w :w!<cr>

" Force quit
nmap <leader>q :q!<cr>

" Paste from clipboard
nmap <C-v><C-v> "+P

" Copy to clipboard
nmap <C-c> "+Y

" Show invisible chars
:noremap <Leader>i :set list!<CR>

" Hard to type
imap uu _
imap hh =>
imap aa @

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

" Insert New Line
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Arows deactivation
map <up> <nop>
map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" indenting visual block
vmap > >gv
vmap < <gv

" Let's make it easy to edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Shortcut for moving lines
nnoremap <A-j> :m+1<CR>==
nnoremap <A-k> :m-2<CR>==

" Previous file
map <Leader>p <C-^>


" SCRIPTS ****************************************************************

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


" PLUGINS ***************************************************************

"ZoomWin
map <Leader><Leader> :ZoomWin<CR>
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

"NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T
let g:CommandTMaxHeight=20

" Syntastic
let g:syntastic_auto_loc_list=1
"set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{fugitive#statusline()} "Error
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" GUI options ************************************************************
if has('gui_running')
  set guioptions-=T " No toolbar
  set guioptions-=e " No tab bar
  set guioptions-=m " No menu
  set guioptions-=r " No right scrollbar
  set guioptions-=l " No left scrollbar
  set guioptions-=b " No bottom scrollbar
  set guioptions-=L
  set guioptions-=R
  set guioptions-=B
endif


" FONTS *******************************************************************
set gfn=Bitstream\ Vera\ Sans\ Mono\ 9
"set gfn=Monospace\ 10
set shell=/bin/bash
set encoding=utf8


" COLORS ******************************************************************
"colorscheme railscasts+
colorscheme ir_black
"colorscheme jellybeans+
"colorscheme molokai
"colorscheme vwilight
