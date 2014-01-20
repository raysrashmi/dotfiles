call pathogen#infect()
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup      " no backup files
set nowritebackup  " no backup file while editing
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set hidden
set hlsearch
" To load proper ruby
set shell=/bin/sh


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Declare bundles are handled via Vundle
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
runtime macros/matchit.vim
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'


" Define bundles via Github repos
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bigloser/vim-ruby-cute'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'croaky/vim-colors-github'
Bundle 'danro/rename.vim'
Bundle 'greplace.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'henrik/vim-open-url'
Bundle 'itspriddle/vim-marked'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'nanki/treetop.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nono/jquery.vim'
Bundle 'othree/html5.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'shemerey/vim-peepopen'
Bundle 'slim-template/vim-slim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'timcharper/textile.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tsaleh/vim-matchit'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/LustyExplorer'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/tComment'
Bundle 'xenoterracide/html.vim'
Bundle 'xolox/vim-misc'

filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Color scheme
if has("gui_running")
  syntax enable
  set background=light
  colorscheme solarized
endif



" Numbers
set number
set numberwidth=5

set wildmode=longest,list

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Cucumber navigation commands
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" Switch between the last two files
nnoremap <leader><leader> <c-^>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Using silver searcher
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'

    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Git Gutter
let g:gitgutter_eager = 0

" neocomplcache.vim
" let g:neocomplcache_enable_at_startup = 1

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Auto save file when lost focus from the file
autocmd BufLeave,FocusLost * silent! wall

" NERDTree for projects
map <leader>n :NERDTreeToggle<CR>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
let g:gitgutter_realtime = 0
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
