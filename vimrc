set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch
set ignorecase
set smartcase
set laststatus=2  " Always display the status line
set hidden
set scrolloff=5

" To load proper ruby
set shell=/bin/sh

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Declare bundles are handled via Vundle
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Define bundles via Github repos

Plugin 'Shougo/neocomplcache'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bigloser/vim-ruby-cute'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'croaky/vim-colors-github'
Plugin 'danro/rename.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'henrik/vim-open-url'
Plugin 'itspriddle/vim-marked'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'nanki/treetop.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nono/jquery.vim'
Plugin 'othree/html5.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'rizzatti/dash.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shemerey/vim-peepopen'
Plugin 'slim-template/vim-slim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'timcharper/textile.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'vim-scripts/LustyExplorer'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/greplace.vim'
Plugin 'vim-scripts/tComment'
Plugin 'xenoterracide/html.vim'
Plugin 'xolox/vim-misc'
Plugin 'raysrashmi/vim-matchit'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'esneider/YUNOcommit.vim'

call vundle#end()

filetype plugin indent on
filetype plugin on

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
set list listchars=tab:»·,trail:·

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Numbers
set number
set numberwidth=5

set wildmode=longest,list

" Splits
set splitbelow
set splitright

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

"checking on (set spell)
set complete+=kspell

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

" Keep all gist by default private
let g:gist_post_private = 1

" Open browser after creating a gist
let g:gist_open_browser_after_post = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Git Gutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" Neocomplcache options
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_max_list = 10
"let g:neocomplcache_auto_completion_start_length = 3
"let g:neocomplcache_force_overwrite_completefunc = 1

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Auto save file when lost focus from the file
autocmd BufLeave,FocusLost * silent! wall

" completion for Markdown and git commit
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell

augroup prewrites
   autocmd!
    autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e
augroup END

"tab space 4 for html
augroup vimrcEx
  au FileType html,eruby setlocal sw=4 sts=4
augroup END

" Numbers.vim
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" NERDTree for projects
map <leader>n :NERDTreeToggle<CR>

" Open MarkedApp
map <leader>m :MarkedOpen<CR>

" Fix the difficult-to-read default setting for diff text highlighting.  The
" " bang (!) is required since we are overwriting the DiffText setting. The
" highlighting
" " for "Todo" also looks nice (yellow) if you don't like the "MatchParen"
" colors.
highlight! link DiffText MatchParen

" More indent for html.erb
"
let g:html_indent_tags += '\|article\|aside\|audio\|bdi\|canvas\|command\|datalist\|details\|figcaption\|figure\|footer\|header\|hgroup\|mark\|meter\|nav\|output\|progress\|rp\|rt\|ruby\|section\|summary\|time\|video'

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <Leader>f :Flay<CR>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" The Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:YUNOcommit_after = 5

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

colorscheme github
