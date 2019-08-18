set nocompatible              " be iMproved, required filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'justinmk/vim-sneak'

" themes
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'itchyny/lightline.vim'

" Asynchronous Light Engine
Plugin 'w0rp/ale'

Plugin 'jiangmiao/auto-pairs'

" " snippets
" " Track the engine.
" Plugin 'SirVer/ultisnips'

" " Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" " autocomplete
" Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required

filetype plugin indent on    " required

colorscheme jellybeans

syntax on

set encoding=utf-8

let mapleader=" "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    "
set history=1000
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " Automatically :write before running commands

set number
set relativenumber

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set wildmenu
set cursorline

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" " Quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" noremap ; :
" noremap : ;

set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

set splitbelow
set splitright

nmap j gj
nmap k gk
nnoremap Y y$|

imap jj <Esc>

noremap <Leader>so :so %<cr>
noremap <Leader>co mmggVG"*y`m
noremap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
noremap <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
noremap <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
xnoremap <Leader>co "*y

nmap k gk
nmap j gj

nnoremap <Leader>j :bd<cr>
nnoremap <Leader>J :bd!<cr>

nnoremap <leader>ev :tabe $MYVIMRC<cr>|                                                 "edit vimrc
nnoremap <leader>eb :tabe ~/.bashrc<cr>|                                                "edit bashrc
nnoremap <leader>ez :tabe ~/.zshrc<cr>|                                                 "edit zshrc
nnoremap <leader>et :tabe ~/.tmux.conf<cr>|                                             "edit tmux.conf
inoremap <c-a> <esc>I
inoremap <c-e> <esc>g_a
noremap <leader>q :qa!<cr>

nnoremap <F2> :w<cr>
inoremap <F2> <esc>:w<cr>

" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

" set rtp+=/Users/chand/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim 

map <leader>i gg=G``zz

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

nnoremap <leader>w :w<cr>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

map s <Plug>Sneak_s
map S <Plug>Sneak_S

nnoremap Q !!$SHELL<cr>

nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
