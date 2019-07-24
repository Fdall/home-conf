"""" BASIC SETTINGS
set nocompatible              " be iMproved, required
filetype off                  " required

scriptencoding utf-8          " utf-8 all the way
set encoding=utf-8
set clipboard+=unnamed        " Yanks go on clipboard instead.
set nobackup
set hlsearch                  " highlight search
set smartcase                 " be case sensitive when input has a capital letter

set tabstop=2                 " tab size eql 2 spaces
set softtabstop=2
set shiftwidth=2              " default shift width for indents
set expandtab                 " replace tabs with ${tabstop} spaces
set smarttab                  "

set nonumber
set showmatch

set foldenable
set foldmethod=manual
set foldlevelstart=99

set list                      " display unprintable characters f12 - switches
set listchars=tab:~>,nbsp:¬
autocmd FileType make setlocal noexpandtab


"""" SYNTAX SETTINGS
syntax on
if !isdirectory(expand("~/.vim/syntax"))
    !mkdir ~/.vim/syntax
endif
" cfengine
if !filereadable(expand("~/.vim/syntax/cf3.vim"))
    !curl -s "https://raw.githubusercontent.com/neilhwatson/vim_cf3/master/syntax/cf3.vim" > ~/.vim/syntax/cf3.vim
endif
au BufRead,BufNewFile *.cf set ft=cf3

" powershell
if !filereadable(expand("~/.vim/syntax/ps1.vim"))
    !curl -s "https://raw.githubusercontent.com/PProvost/vim-ps1/master/syntax/ps1.vim" > ~/.vim/syntax/ps1.vim
endif

au BufRead,BufNewFile *.ps1 set ft=ps1
au BufRead,BufNewFile *.ps1.st set ft=ps1

"""" PLUGIN SETTINGS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" pretty hilight of lines modified in git project
Plugin 'airblade/vim-gitgutter'
set updatetime=100

"NERD tree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

"Zoom on split windows
Plugin 'ZoomWin'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"""" CUSTOM SETTINGS
" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

