syntax on
filetype plugin indent on

set autoindent
set backup
set backupdir=./.backup,~/.backup,.,/tmp
set colorcolumn=80
set cursorcolumn
set cursorline
set expandtab
set mouse=a
set modeline
set number
set relativenumber
set ruler
set shiftwidth=2
set showmatch
set softtabstop=2
set tabstop=2
set viminfo=""

au BufWritePre * let &bex = '-' . strftime("%Y%m%d%H%M%S") . '~'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

if $CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

if &shell =~ "zsh"
  set shellcmdflag=-fc
endif

"set rtp+=~/.fzf

au BufRead,BufNewFile *.template setfiletype json

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
let g:ansible_attribute_highlight = "ob"

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --completion --key-bindings --no-update-rc' }
Plug 'ddollar/golang-template.vim', { 'for': 'go' }

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }
set laststatus=2
set noshowmode

Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_markdown_mdl_exec = 'markdownlint'
let g:syntastic_markdown_mdl_args = ''
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_preset = 'full'
let g:tmuxline_powerline_separators = 0

Plug 'smerrill/vcl-vim-plugin', { 'for': 'vcl' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'andrewstuart/vim-kubernetes'
Plug 'sickill/vim-monokai'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'tmux-plugins/vim-tmux'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'

call plug#end()

:silent! colorscheme monokai

au BufNewFile,BufRead Jenkinsfile setf groovy
au BufRead,BufRead *.hcl setf terraform
