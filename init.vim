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

" vim-javascript
let g:javascript_plugin_jsdoc = 1

set t_Co=256

" Specify the path to `coverage.json` file relative to your current working directory.
let g:coverage_json_report_path = 'coverage/coverage-final.json'

" Define the symbol display for covered lines
let g:coverage_sign_covered = '⦿'

" Define the interval time of updating the coverage lines
let g:coverage_interval = 1000

" Do not display signs on covered lines
let g:coverage_show_covered = 0

" Display signs on uncovered lines
let g:coverage_show_uncovered = 1

" plugins
call plug#begin('~/.vim/plugged')

" Plugins for languages support
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'

" Syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'

" Vim LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" StatusBar
Plug 'vim-airline/vim-airline'
" highlighting css colors
Plug 'ap/vim-css-color'

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

Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

Plug 'ruanyl/coverage.vim'

Plug 'liuchengxu/vim-which-key'

Plug 'voldikss/vim-floaterm'

Plug 'ekalinin/Dockerfile.vim'

call plug#end()

source ~/.config/nvim/themes/onedark.vim
source ~/.config/nvim/keys/which-key.vim
source ~/.config/nvim/plug-config/floaterm.vim

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

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

" Aliases
cabbrev gocov GoCoverageToggle
