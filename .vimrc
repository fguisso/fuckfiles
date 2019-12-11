""" Vim-Plug
call plug#begin()

" Functionalities
Plug 'tpope/vim-fugitive', {'on': 'Gstatus'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
"Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
call plug#end()

""" Other Config
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set ruler laststatus=2 showcmd showmode showmatch
set incsearch ignorecase smartcase hlsearch
set guicursor=n-v-c:block-Cursor
set number
set title

""" Plugins Config
" Nerdtree
nmap <C-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='↠'
let g:NERDTreeDirArrowCollapsible='↡'

" Airline
let g:airline_theme='deus'
let g:airline_powerline_fonts=1
let g:airline_section_z='%{strftime("%-I:%M %p")}'
let g:airline_section_warning=''

" Polyglot
let g:polyglot_disable = ['go']

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
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

""" Custom Mappings
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv
