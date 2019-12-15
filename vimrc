" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" plug {{{
call plug#begin('~/.vim/plugged')

Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'tmhedberg/SimpylFold'
Plug 'wellle/targets.vim'
" Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'cormacrelf/vim-colors-github'

call plug#end()
let g:python_highlight_all=1
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
" }}}

" General {{{
set termguicolors
set background=light
colorscheme github
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set hidden
set lazyredraw
set nowrap
set linebreak
set iskeyword+=-
set synmaxcol=180
set scrolloff=4
set sidescrolloff=4
set splitbelow
set splitright
set mouse=a
set noswapfile
set completeopt=noinsert,menuone,noselect
set shortmess+=c
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

if expand('%:p:h') !~# '^/etc'
  set backup
  set backupskip=/tmp/*,/private/tmp/*,/etc/*
  set backupdir=~/.vim/tmp//
  set directory=~/.vim/tmp//
  set writebackup
  if has('persistent_undo')
    set undodir=~/.vim/tmp//
    set undofile
  endif
else
  set nobackup
  set noundofile
endif

augroup window_resize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

if has('gui')
  set guifont=Menlo:h9
endif
" }}}

" Mapping {{{
" }}}
