set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set updatetime=100
set number

set tabpagemax=8
set showtabline=2

" Git Gutter
let g:gitgutter_enabled = 1
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight clear SignColumn

"vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

" vim-go
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter='golangci-lint'
let g:go_metalinter_autosave=1
let g:go_highlight_types=1
let g:go_metalinter_enabled=[]
let g:go_metalinter_autosave_enabled=[]

" coc.nvim
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" ALE (Asynchronus Linting Engine)
let g:ale_linters = {
\  'go': ['golangci-lint'],
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\}

let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\  'css': ['prettier'],
\  'scss': ['prettier'],
\}

let g:ale_fix_on_save = 1

set t_Co=256

" plugins
call plug#begin('~/.vim/plugged')

" Plugins for languages support
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'

" Vim LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" StatusBar
Plug 'vim-airline/vim-airline'
" highlighting css colors
Plug 'skammer/vim-css-color'

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" Indenting
Plug 'Yggdroot/indentLine'

" Themes
Plug 'joshdick/onedark.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linting
Plug 'dense-analysis/ale'

" Vim session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

source ~/.config/nvim/themes/onedark.vim

" Shortcuts
nmap <Tab> %

nnoremap <leader>v <cmd>CHADopen<cr>

nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Use <c-space> for trigger completion.
nnoremap <silent><C-space> :call CocActionAsync('doHover')<cr>

map <C-p> :Files<CR>
map <C-f> :Rg<CR>
map <C-g> :BCommits!<CR>

nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>