" plug
call plug#begin('~/.vim/plugged')
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-dirvish'
Plug 'janko-m/vim-test'
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh', }
Plug 'roxma/nvim-completion-manager'
Plug 'morhetz/gruvbox'
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()
" let g:python_highlight_all=1
let g:dirvish_mode=':sort ,^.*[\/],'
let g:LanguageClient_changeThrottle=0.2
let g:LanguageClient_serverCommands={
  \ 'python': ['pyls'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ }
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
" General
set termguicolors
set background=dark
colorscheme gruvbox
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set hidden
set cursorline
set lazyredraw
set nowrap
set linebreak
set iskeyword+=-
set synmaxcol=280
set scrolloff=4
set sidescrolloff=4
set splitbelow
set splitright
set mouse=a
set noswapfile
" set virtualedit+=block

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

augroup myvimrc
  autocmd!
  autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
augroup END

augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  " autocmd FocusGained * setlocal cursorline
  " autocmd FocusLost * setlocal nocursorline
augroup END

if has('gui')
  set guifont=Menlo:h9
endif
" Mapping
inoremap <expr> <Tab> pumvisible() ? "\<c-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F12> :e ++enc=utf-8<CR>
nnoremap <leader>gf :e <cfile><cr>
nnoremap <leader>/ ::g//#<Left><Left>
tnoremap <esc><esc> <c-\><c-n>
nnoremap <silent><expr> <c-l> (v:count ? ':<C-U>:call <SID>save_change_marks()\|edit\|call <SID>restore_change_marks()<CR>' : '')
      \ . ':nohlsearch'.(has('diff')?'\|diffupdate':'')
      \ . '<CR><C-L>'
