let g:python3_host_prog = expand('/usr/bin/python3')

call plug#begin()

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf.vim' ", { 'frozen': 1 }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'frozen': 1 }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'smbache/vim-praise'
Plug 'jparise/vim-graphql'
Plug 'smbache/vim-consolelog'
Plug 'ntpeters/vim-better-whitespace'
Plug 'arthurxavierx/vim-caser'
Plug 'justinmk/vim-sneak'
"Plug 'smbache/vim-rif'

" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'w0rp/ale'

call plug#end()

" colorscheme gruvbox
colorscheme seoul256
set background=dark

filetype plugin on
set shiftwidth=2
set tabstop=2
set expandtab
set relativenumber
set number
set hidden
set cursorline

let g:peekaboo_window="vert bo 50new"

let g:mapleader=" "

command! Rmws %s/\s\+$//e

" nnoremap <leader>a :e `alt %`<CR>
nnoremap <Leader>t mA:NERDTreeToggle<CR>
nnoremap <Leader>T mA:NERDTreeFind<CR>
vnoremap <Leader><CR> mA:TREPLSendSelection<CR>
nnoremap '' 'A

" set listchars=eol:$,tab:~>,trail:~,extends:>,precedes:<
" set list

set clipboard+=unnamedplus

function! g:FindFileForCursorWord()
  let l:thecommand = substitute(tolower(expand('<cword>')), '[^a-zA-Z0-9]', '', '')
  execute "Files"
  call feedkeys(l:thecommand)
endfunction

nnoremap <silent> gF :call FindFileForCursorWord()<CR>

function! ReadFZ(...)
  let nargs = len(a:000)
  if nargs == 0
    let dots = '.'
  else
    let dots = repeat('../', a:0)
  endif
  call fzf#run({
        \ 'sink': 'r',
        \ 'source': 'find ' . substitute(dots, '/$', '', ''),
        \ 'options': '--preview="cat {}"',
        \ })
endfunction

if exists('&inccommand')
  set inccommand=nosplit
endif

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <ESC> u

inoremap jj <ESC>
set timeoutlen=400

inoremap jk <C-o>

source ~/.config/nvim/oh-my-fzf.vim

noremap * *N
let g:NERDTreeWinSize=45


let g:deoplete#enable_at_startup = 1
let g:sql_type_default = 'sqlbigquery'

let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'javascript': ['eslint']
      \ }

let g:ale_fixers = {
      \ 'python': ['black'],
      \ 'javascript': ['eslint'],
      \ '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }
let g:ale_fix_on_save=1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
