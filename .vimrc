set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
if v:version > 701
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Git wrapper for vim
Plugin 'tpope/vim-fugitive'
" Repeat fix for vim
Plugin 'tpope/vim-repeat'
" Nicely line up text and things
Plugin 'godlygeek/tabular'
" Puppet vim things
Plugin 'rodjek/vim-puppet'
" Syntax checking and things
Plugin 'scrooloose/syntastic'
" Code Completion
" Plugin 'Valloric/YouCompleteMe'
" Undo Visualization
Plugin 'sjl/gundo.vim'
" Ctrl-P full path fuzzy finder
Plugin 'kien/ctrlp.vim'
" Useful version control commands (maybe?)
Plugin 'vim-scripts/vcscommand.vim'
" Useful command aliasing stuff.
Plugin 'vim-scripts/cmdalias.vim'
" JSON proper syntax highlighting and indention, also some quote magic.
Plugin 'elzr/vim-json'
" Powerline vim statusline. DISABLE IF POWERLINE IS INSTALLED ON SYSTEM.
" Enable for vundle to maintain, otherwise.
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
call vundle#end()
endif
"" Shortcuts
" Map my leader key to space.
let mapleader=" "

" Superuser write (for when sudo is forgotten)
map <leader>suw :w !sudo tee % > /dev/null<CR>

" Make ctrl-commands work in insert mode
imap <C-W> <C-O><C-W>

" Load the gundo window
map <leader>g :GundoToggle<CR>

" Move by display line, not file line
noremap j gj
noremap k gk
noremap <up> gk
noremap <down> gj

" Move buffers by using ctrl-l and ctrl-; for left and right
map <C-j> :bp <CR>
map <C-k> :bn <CR>

" Map qq to quit without saving. CMAP DOESN'T WORK!
map <leader>qq :q!<CR>

" A few basic maps for quick command-mode stuff.
map <leader>q :q<CR>
map <leader>wq :wq<CR>
map <leader>w :w<CR>
map <leader>pa :set paste<CR>
map <leader>np :set nopaste<CR>
map <leader>cs :let @/ = ""<CR>

"" Basic Settings
syntax on                   " Syntax Highlighting
filetype on                 " Filetype Detection
filetype plugin indent on   " Load indent file for filetype
set number                  " Line numbering
" Set line numbering coloring [next line]
highlight LineNr ctermfg=31
" Set completion box coloring [next line]
highlight Pmenu ctermfg=45 ctermbg=23
highlight PmenuSel ctermfg=23 ctermbg=45
set title                   " Change console title bar
set wildmenu                " Menu completion in command mode with <Tab>
set wildmode=full           " <Tab> cycles between matching choices

set noerrorbells            " No bells!
set vb t_vb=                " No blink!

set wildignore+=.git        " Ignore these files/directories with wildmenu completion

set ruler                   " Always show cursor position
set nostartofline           " Try not to move cursor to start of line when moving
set virtualedit=block       " Let cursor move past last character in visual block mode 
set scrolloff=3             " Keep 3 context lines above and below cursor
set backspace=2             " Allow backspacing over autoindent, eol, bol
set wrap                    " Wrap text
set linebreak               " Don't wrap in middle of word
set autoindent              " Always have autoindent on
set smartindent             " Use smart indent if an indent file doesn't exist
set shiftwidth=4            " Indent level is 2 spaces wide
set tabstop=4               " <tab> inserts 4 spaces
set softtabstop=4           " backspace over autoindent deletes both spaces
set expandtab               " Use spaces instead of tabs for autoindent
set shiftround              " Round indent to a multiple of shiftwidth
"set textwidth=80            " 80 column line limit
set formatoptions=tcroql    " Set text and comment formatting to auto
if exists('+colorcolumn')
    let &colorcolumn=81         " Highlight the 81st line
endif
hi ColorColumn ctermbg=23  
set splitbelow              " Open new split panes below...
set splitright              " ...and to the right.

"" Read/write settings
set hidden                  " Allow buffers to be hidden without complaining about changes.
set noautoread              " Don't re-read changed files automatically.
set modeline                " Allow vim options embedded in files
set modelines=5             " within the first or last 5 lines.

"" Messages, info, status, etc.
" Try to enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" End powerline setup
set laststatus=2            " Always show status line (powerline)
set showtabline=2           " Show tab line (powerline)
set noshowmode              " Disable insert/normal/visual prompt (it's in powerline)
set showcmd                 " Show incomplete commands as typing
set report=0                " Always show changed line count for :commands

"" Searching/patterns
set ignorecase              " Ignore case during searching
set smartcase               " Unless there are uppercase letters in the regex
set hlsearch                " Use search highlighting
set incsearch               " Incrementally search while /searching.

"Set backup and swap directories to one of the following:
set backupdir=~/.vim/backup//,~/.backup//,/tmp//
set directory=~/.vim/backup//,~/.backup//,/tmp//

"Set syntax completion
set omnifunc=syntaxcomplete#Complete

" Set ctrlp working mode to nearest ansestor for version control.
let g:ctrlp_working_path_mode = 'ra'

" Disable searching of .git/.svn directories in ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '',
  \ 'link': '',
  \ }

" Color fix for konsole
set t_Co=256

"Setup persistant undo
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo//,~/.vim_undo//,~/tmp//
endif
