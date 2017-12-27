" .vimrc

" show line number
set nocompatible
set number

" backspace
set backspace=2

" encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" indent
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smarttab

set laststatus=2
set statusline=%F%r%h%=

" search
set ignorecase
set smartcase

" command complement
set wildmenu

" command line complement
set wildmode=list,full

" delete trailing white spaces
autocmd BufWritePre * :%s/\s\+$//e

" cursor highlight
"set cursorline
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END
"hi clear CursorLine
"hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black

" tmux (background color erase)
set t_ut=

" undodir
if has('persistent_undo')
  set undodir=~/.vimundo
  set undofile
endif

" ruby
autocmd BufNewFile,BufRead *.ru set filetype=ruby

" dein.vim
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('fatih/vim-go')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-scripts/molokai')
  call dein#add('vim-syntastic/syntastic')

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" End dein.vim

" omnifunc
setlocal omnifunc=syntaxcomplete#Complete

" deoplete
let g:deoplete#enable_at_startup = 1

" python3
let g:python3_host_prog = expand('~/.anyenv/envs/pyenv/shims/python')

autocmd BufNewFile,BufRead *.go setlocal filetype=go
autocmd FileType go setlocal tabstop=2 shiftwidth=2
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" neosnippet.vim
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" molokai
set t_Co=256
colorscheme molokai

" Unite key bindings
noremap <C-i> :Unite buffer<CR>
noremap <C-m> :Unite file_mru<CR>
noremap <C-k> :Unite -buffer-name=file file<CR>

if has('nvim')
  set termguicolors
endif
