" vim: fdm=marker

" {{{ Plug
call plug#begin('~/.vim/plugged')
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sickill/vim-monokai'
Plug 'dag/vim-fish'
Plug 'SidOfc/mkdx'
Plug 'danro/rename.vim'
Plug 'ervandew/supertab'
call plug#end()
" }}}

syntax on
filetype plugin indent on

let mapleader = ","
let maplocalleader = ",,"

" {{{ general options
set mouse=v
set clipboard+=unnamedplus
set nostartofline
set autochdir
set modeline
set shortmess+=I
set encoding=utf-8
set autoindent
set showmode
set noshowcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set laststatus=0
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set nu
set nobackup
set nowritebackup
set noswapfile
set tags=~/.tags
set noundofile
set ssop-=options
set ssop-=folds
set timeoutlen=1000 ttimeoutlen=0 "exit visual mode faster
" }}}

"{{{ look'n'feel
set termguicolors
colorscheme monokai
set background=dark
set guioptions-=m
set guioptions-=T
set guifont=Monospace:h16
"}}}

" {{{ tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" }}}

" {{{ search
set hlsearch
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" }}}

" {{{ long lines
set wrap
set linebreak
set textwidth=72
set formatoptions=qn1Mj
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<cr>
" }}}

" {{{ moving around
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <C-j> }
nnoremap <C-k> {
vnoremap <C-j> }
vnoremap <C-k> {
function! CenterSearch()
  let cmdtype = getcmdtype()
  if cmdtype == '/' || cmdtype == '?'
    return "\<enter>zz"
  endif
  return "\<enter>"
endfunction
cnoremap <silent> <expr> <enter> CenterSearch()
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}

" {{{ splits
set splitbelow
set splitright
" }}}

" {{{ editing
vnoremap < <gv
vnoremap > >gv
nnoremap <cr> o<esc>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" delete without yanking
nnoremap D "_d
xnoremap D "_d

" reformat paragraph
nnoremap R mr{gq}'r

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

" search and replace in for selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>
" }}}

" {{{ folding
nnoremap <space> za
" }}}

" {{{ convenience keys
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>t :e $HOME/notes/todo.md<cr>
nnoremap <localleader>v :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa<cr>
nnoremap <leader>d :bd<cr>
nnoremap <f10> :wq<cr>
inoremap jj <esc>
inoremap kk <esc>
cmap w!! %!sudo tee > /dev/null %
map Q @q
nnoremap <leader>m :w<cr>:make<cr>
nnoremap <leader>1 :on<cr>
" }}}

" {{{ LaTeX
function! SetTexOptions()
    setlocal textwidth=100
    setlocal errorformat=%f:%l:\ %m
    setlocal indentexpr=
    nnoremap <localleader>e bi\emph{ea}
    vnoremap <localleader>e di\emph{}P
    nnoremap <localleader>b bi\textbf{ea}
    vnoremap <localleader>b di\textbf{}P
    nnoremap <localleader>i bi\textit{ea}
    vnoremap <localleader>i di\textit{}P
    nnoremap <localleader>t bi\texttt{ea}
    vnoremap <localleader>t di\texttt{}P
    nnoremap <localleader>c i\cite{}Pl
    syn clear texChapterZone
    syn clear texSectionZone
    syn clear texSubSectionZone
    syn clear texSubSubSectionZone
    syn clear texString
endfunction
autocmd Filetype tex call SetTexOptions()
" }}}

"{{{ Ctrl-P
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['.projectroot']

nnoremap <leader>r :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
"}}}

" {{{ vim-commentary
autocmd FileType cpp setlocal commentstring=//\ %s
" }}}

" {{{ mkdx
let g:markdown_folding = 1
" }}}

" {{{ autostrip trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" {{{ File specific settings
augroup VimRc
  au BufWrite,VimLeave .vimrc mkview
  au BufRead           .vimrc silent loadview
augroup END

augroup ToDo
  au BufWrite,VimLeave todo.md mkview
  au BufRead           todo.md silent loadview
augroup END
" }}}
