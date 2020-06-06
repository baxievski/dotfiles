" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" plug {{{
call plug#begin()

Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'tmhedberg/SimpylFold'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'cormacrelf/vim-colors-github'
Plug 'neovim/nvim-lsp'

call plug#end()

lua require'nvim_lsp'.pyls.setup{}
lua require'nvim_lsp'.gopls.setup{}

let g:python_highlight_all=1
" let g:Loaded_netrw=1
" let g:loaded_netrwPlugin=1
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
set ruler
set nofoldenable
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
function! s:ConfigureBuffer()
    nnoremap <buffer> <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <buffer> <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <buffer> <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

    if exists('+signcolumn')
      setlocal signcolumn=yes
    endif
endfunction

function! s:SetUpLspHighlights()
  if !wincent#pinnacle#active()
    return
  endif

  execute 'highlight LspDiagnosticsError ' . pinnacle#decorate('italic,underline', 'ModeMsg')

  execute 'highlight LspDiagnosticsHint ' . pinnacle#decorate('bold,italic,underline', 'Type')

  execute 'highlight LspDiagnosticsHintSign ' . pinnacle#highlight({
        \   'bg': pinnacle#extract_bg('ColorColumn'),
        \   'fg': pinnacle#extract_fg('Type')
        \ })

  execute 'highlight LspDiagnosticsErrorSign ' . pinnacle#highlight({
        \   'bg': pinnacle#extract_bg('ColorColumn'),
        \   'fg': pinnacle#extract_fg('ErrorMsg')
        \ })
endfunction

sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInformationSign text=ℹ
sign define LspDiagnosticsHintSign text=➤

if has('autocmd')
  augroup WincentLanguageClientAutocmds
    autocmd!

    if exists('*nvim_open_win')
      " TODO: figure out how to detect lsp floating window...
      " Can use floating window.
      autocmd BufEnter __LanguageClient__ call s:Bind()
    endif

    autocmd FileType javascript,typescript,vim  call s:ConfigureBuffer()

    autocmd ColorScheme * call s:SetUpLspHighlights()
  augroup END
endif
" }}}
