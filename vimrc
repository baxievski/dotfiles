" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" plug {{{
call plug#begin('~/.vim/plugged')

Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
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
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh', }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-dirvish'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'schickele/vim-fruchtig'

call plug#end()
let g:gruvbox_italic=1                                                                                                                                           
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:python_highlight_all=1
let g:dirvish_mode=':sort ,^.*[\/],'
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:LanguageClient_serverCommands={
  \ 'python': ['pyls'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
\ }
augroup ncm2_group
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END

" }}}

" General {{{
set termguicolors
set background=light
colorscheme fruchtig
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
" }}}
