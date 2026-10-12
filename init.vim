set tabstop=2
set shiftwidth=2
set noexpandtab

set updatetime=100
set number

set tabpagemax=8
set showtabline=2

set relativenumber number

" vim-which-key timeout
set timeoutlen=500

syntax enable

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

" Git Gutter
let g:gitgutter_enabled = 1
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight clear SignColumn

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_COMMAND="fd --type f"
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

" vim-go
let g:go_metalinter_command='golangci-lint run'
let g:go_metalinter='golangci-lint'
let g:go_metalinter_autosave=0
let g:go_highlight_types=1
let g:go_metalinter_enabled=[]
let g:go_metalinter_autosave_enabled=0
let g:go_jump_to_error=0

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

let g:ale_fix_on_save = 0
" By default it is set to --enable-all, which is not expected
" if the config file is provided
let g:ale_go_golangci_lint_options = ''
" It will prevent some errors if golangci-lint linter would run on single file
" (i.e. typecheck linter)
let g:ale_go_golangci_lint_package = 1

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

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-session
let g:session_autoload = 'no'

"indentLine
let g:indentLine_setConceal = 0

au BufNewFile,BufRead *.ejs set filetype=html

" plugins
call plug#begin('~/.vim/plugged')

" Plugins for languages support
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'lervag/vimtex'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

" Syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rust-lang/rust.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Vim LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

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
Plug 'catppuccin/nvim', { 'branch': 'vim', 'as': 'catppuccin' }

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

Plug 'easymotion/vim-easymotion'

call plug#end()

source ~/.config/nvim/themes/onedark.vim
source ~/.config/nvim/keys/which-key.vim
source ~/.config/nvim/plug-config/floaterm.vim

" Shortcuts
nmap <Tab> %

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <leader>v <cmd>CHADopen<cr>

nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"nnoremap <leader>l :ls<cr>:b
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

map <C-p> :Files<CR>
map <C-f> :Rg<CR>
map <C-g> :BCommits!<CR>

nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call ShowDocumentation()<CR>

" Open/close termianl
nnoremap <silent> <Leader>; :FloatermToggle<CR>
tnoremap <silent> <Leader>; <C-\><C-n>:FloatermToggle<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Aliases
cabbrev gocov GoCoverageToggle
