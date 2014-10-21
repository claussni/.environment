set autoindent      " automatic indentation
set expandtab       " expand tabs to spaces
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ls=1            " allways show status line
set nobackup        " disable leaving backup files around
set nocompatible    " use vim defaults
set noignorecase    " don't ignore case when searching
set nostartofline   " don't jump to first character when paging
set novisualbell    " turn off visual bell
set nowrap          " don't wrap lines
set nowritebackup   " disable writing backup files at all
set number          " show line numbers
set ruler           " show the cursor position all the time
set scrolloff=3     " keep 3 lines when scrolling
set shiftwidth=4    " numbers of spaces to (auto)indent
set shortmess=atI   " Abbreviate messages
set showcmd         " display incomplete commands
set sm              " show matching braces
set smartindent     " smart autoindent for C like programming languages
set softtabstop=4   " numbers of spaces of tab character
set tabstop=4       " width of tab character
set title           " show title in console title 
set ttyfast         " smoother changes
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set listchars=tab:▸\ ,eol:¬     " Use the same symbols as TextMate for tabstops and EOLs
set list

highlight NonText guifg=#4a4a59     " Show invisible characters
highlight SpecialKey guifg=#4a4a59  " Show control characters

autocmd BufNewFile,Bufread *.xml set nowrap " Disable line wrapping for XML files
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby " Enable Ruby syntax colors for Vagrantfiles

" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'

" Additionnal Bundles directly loaded via GitHub
Plugin 'Soares/butane.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/VimClojure'

call vundle#end()
filetype plugin indent on

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Map :bd command to :Bclose for Butane window handling
cmap bd Bclose

" Enable Solarized colorscheme only in GUI. Torte otherwise.
if has('gui_running')
    colorscheme solarized
    set background=dark
else
    colorscheme torte
endif

" Easy buffer navigation
noremap <C-F8> :NERDTreeToggle<CR>
noremap <C-PageUp> :bn<CR>
noremap <C-PageDown> :bp<CR>

" Duplicating lines with Ctrl-D in normal
" and in editing mode
map <c-d> yy P
imap <c-d> <esc>yyPi

syntax on
