set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'haya14busa/incsearch.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on

" vim-colors-solarized
syntax enable
set background=dark
set t_Co=256 " set 256 colors
let g:solarized_termtrans = 1 " terminal transparent bg support
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" misc
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set hlsearch
set pastetoggle=<F9>
set number
set numberwidth=3
set title
set ttyfast

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" ignore case when searching, except when pattern contains capital
set ignorecase
set smartcase

" os x stuff
" fix backspace won't work in insert mode (OS X?)
set backspace=indent,eol,start
set clipboard=unnamed

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.vim$', '\.git$']

" vim-airline
set laststatus=2 " display all the time
let g:airline_theme='solarized'
set encoding=utf-8

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filepath_completion_use_working_dir = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Put VIM's temp files somewhere
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Highlight the current line
set cursorline
" hi CursorLine cterm=none ctermbg=254 guibg=Gray89

" incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Toggle 80 column marker
nnoremap <F2> :call ToggleColorColumn()<CR>
func! ToggleColorColumn()
    if exists("b:colorcolumnon") && b:colorcolumnon
        let b:colorcolumnon = 0
        exec ':set colorcolumn=0'
    else
        let b:colorcolumnon = 1
        exec ':set colorcolumn=80'
    endif
endfunc
call ToggleColorColumn()

" indicate tabs
set list listchars=tab:→\

" vim-gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
