execute pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
colorscheme solarized
let g:solarized_termtrans=1

set autoindent
set backup
set backupdir=./.backup,~/.backup,.,/tmp
set colorcolumn=80
set cursorline
set expandtab
set modeline
set number
set ruler
set shiftwidth=2
set showmatch
set softtabstop=2
set tabstop=2
set viminfo=""

au BufWritePre * let &bex = '-' . strftime("%Y%m%d%H%M%S") . '~'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ }

let g:tmuxline_preset = 'full'
let g:tmuxline_powerline_separators = 0

set laststatus=2
set noshowmode

if $CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

if &shell =~ "zsh"
  set shellcmdflag=-fc
endif

set rtp+=~/.fzf

au BufRead,BufNewFile *.template setfiletype json

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

set rtp+=~/.fzf
