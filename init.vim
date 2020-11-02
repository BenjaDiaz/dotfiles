set number                     " Show current line number
set relativenumber             " Show relative line numbers
syntax on
filetype plugin indent on

" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a

set undofile                " Save undos after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'vim-airline/vim-airline'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'sbdchd/neoformat'

Plug 'davidhalter/jedi-vim'

Plug 'scrooloose/nerdtree'

Plug 'neomake/neomake'

Plug 'terryma/vim-multiple-cursors'

Plug 'machakann/vim-highlightedyank'

Plug 'morhetz/gruvbox'

Plug 'hashivim/vim-terraform'

Plug 'juliosueiras/vim-terraform-completion'

call plug#end()

let mapleader = "\<Space>"

" deoplete

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:deoplete#omni_patterns = {}

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()

" neoformat

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" jedi

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" gruvbox

colorscheme gruvbox

" NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

noremap <F3> :NERDTreeToggle<CR>
