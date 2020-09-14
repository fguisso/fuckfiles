""" Vim-Plug
call plug#begin()

" Functionalities
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
"Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

""" Other Config
set colorcolumn=80
highligh ColorColumn ctermbg=10 ctermfg=9
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set ruler laststatus=2 showcmd showmode showmatch
set incsearch ignorecase smartcase hlsearch
set guicursor=n-v-c:block-Cursor
set number
set title
set fillchars=""

""" Plugins Config
" Nerdtree
nmap <C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='↠'
let g:NERDTreeDirArrowCollapsible='↡'

" Airline
let g:airline_powerline_fonts=1
"let g:airline_section_b='%{GitStatus()}'
"let g:airline_section_warning=''

" Polyglot
let g:polyglot_disable = ['go']

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ale Lint
let g:ale_fixers = { 'javascript': ['eslint'] }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" GitGutter
set signcolumn=yes

" Vim-go
let g:go_list_height = 10

" Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDToggleCheckAllLines = 1

""" Vim training
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

""" Splits
set splitright
set splitbelow

nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

""" Bakcups
" set backupdir=~/.vim/backup_files//  " set the directory that vim backup files will be saved to
" set directory=~/.vim/swap_files//    " set the directory that vim swap files will be saved to
" set undodir=~/.vim/undo_files//      " set the directory that vim undo files will be saved to

""" Custom Mappings
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv
