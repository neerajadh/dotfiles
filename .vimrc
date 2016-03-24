"Vundle configuration sart
set nocompatible        "be iMproved, required
filetype off            "required

"set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugins
Plugin 'gmarik/Vundle.vim'  "let vundle manage itself
Plugin 'tyru/restart.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
    set laststatus=2        "required by airline
    let g:airline_powerline_fonts = 1
    "if !exists('g:airline_symbols')
    "    let g:airline_symbols = {}
    "endif
    "let g:airline_symbols.space = "\ua0"
Plugin 'tpope/vim-fugitive'
Plugin 'c9s/gsession.vim'
Plugin 'rstacruz/sparkup'
"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/Conque-Shell'
"Plugin 'hsanson/vim-android'
Plugin 'Townk/vim-autoclose'
"Plugin 'vim-scripts/TeTrIs.vim'

"Vundle configuration end
call vundle#end()
filetype plugin indent on

"Settings for syntastic
"set statusline+=%#warningmsg#%
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Tabs and indent
set expandtab           "Make insert spaces instead of hard tabs
set shiftwidth=4        "shift width of four
set softtabstop=4       "dunno what
set autoindent          "remember last line's indentation level

"Settings for file-specific indentation
filetype on
filetype plugin on
filetype indent on

"Folds
set foldmethod=indent   "insert folds according to indent

"Search
set incsearch           "display search results while typing pattern
"set hlsearch           "highlight searched items
"set smartcase           "smart case search, insensitive if all lowercase

"Appearance
colorscheme default     "default colorscheme
"set background=dark     "set dark background
syntax on

set number              "display line numbers
set scrolloff=3         "keep atleast 3 lines always below/above cursor
set cursorline          "highlight current line
set history=50          "set history to 50 undos

set modeline
set modelines=5

"KeyBindings
"cmap cwd lcd %:p:h      "enter :cwd<CR> to change working directory to current
"cmap W w
"cmap Q q
imap jk <Esc>
nmap <A-j> o<Esc>
nmap <A-k> O<Esc>
imap <S-CR> <CR><Esc>_d$a
map <F3> :mksession! .vim_session_ <CR>
map <F9> :source .vim_session_ <CR>
map <F4> :mksession! .vim_session_<CR>:wqa<CR>
map <F5> :mksession! .vim_session_<CR>:wa<CR>:Restart<CR>

"Autocorrect
abbr docuemnt document
abbr hte the
abbr incldue include
"abbr resovler resolver
