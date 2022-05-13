
set nocompatible            " be iMproved, required
filetype off                " required

let g:plugged_home = '~/.vim/plugged'

call plug#begin('~/.config/nvim/plugged')
Plug 'wakatime/vim-wakatime'
" Lua integration
Plug 'nvim-lua/plenary.nvim'
Plug 'vimwiki/vimwiki'
" Tmux-Neovim
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
" Language Utils
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'andersevenrud/cmp-tmux'
Plug 'octaltree/cmp-look'
Plug 'mtoohey31/cmp-fish'
Plug 'hrsh7th/nvim-cmp'
Plug 'b0o/schemastore.nvim' " json schemas
Plug 'jose-elias-alvarez/null-ls.nvim'
" Snippet engine
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim' " icons for completion menu
" Programming
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dag/vim-fish'
Plug 'lifepillar/pgsql.vim'   " PostgreSQL syntax highlighting
Plug 'hashivim/vim-terraform' " Terraform syntax highlighting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
" Utils
Plug 'pbrisbin/vim-mkdir'     " automatically creates directory if does not exists
Plug 'tpope/vim-dotenv'       " loads dot env file variables
Plug 'tpope/vim-dadbod'       " database interface
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'     " list project diagnostic errors
" Formater
Plug 'jiangmiao/auto-pairs'
" Linter
Plug 'dense-analysis/ale'
"Better Visual Guide
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tmhedberg/simpylfold'
Plug 'neoclide/jsonc.vim'
Plug 'neomake/neomake'
Plug 'machakann/vim-highlightedyank'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
" Floating terminal
Plug 'voldikss/vim-floaterm'
" File Searching
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Theme
Plug 'marko-cerovac/material.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

filetype plugin indent on    " required
"filetype plugin on

" ============================================================================ "
" ===                           CONFIGURATION                              === "
" ============================================================================ "
let mapleader = ","
" Copy to clipboard
vmap <C-c> "+y
" Remap ii as Esc
":imap ii <Esc>
:imap jk <Esc>
:imap kj <Esc>
" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa
" Remove trailing white spaces on save
" autocmd BufWritePre * :%s/\s\+$//e
" Center the screen quickly
nnoremap <space> zz
" theme settings
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" IndentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
"  neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    "let g:python_host_prog =  '/usr/bin/python2'
    let g:python3_host_prog = '/opt/homebrew/bin/python3'
endif
if has("gui_running")
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
" Fix some common typos
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev Qa qa
cnoreabbrev Qw qw
cnoreabbrev Qwa qwa
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev WQ wq
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq


"----------------------------------------------
" General settings
"----------------------------------------------
set path+=**                      " searches current directory recursively
set encoding=utf-8
set autoread
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set number
set title
set colorcolumn=81                " highlight the 80th column as an indicator
" set list
" set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set lazyredraw
set cmdheight=1
set updatetime=300
set shortmess+=c
" Turn off backup
set nobackup
set noswapfile
set nowritebackup
" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

syntax on
syntax enable

""  ============================================================================ "
""  ===                          AIRLINE
""  ============================================================================ "
" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.

let g:ale_disable_lsp = 1

let g:airline_detect_modified=0
let g:airline_detect_paste=0
let g:airline_detect_crypt=1
let g:airline#extensions#fzf#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='night_owl'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = '⤫'
let airline#extensions#nvimlsp#warning_symbol = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#term#enabled = 0

function! s:update_highlights()
  hi CursorLine ctermbg=none guibg=NONE
  hi VertSplit ctermbg=none guibg=NONE
endfunction
autocmd User AirlineAfterTheme call s:update_highlights()


let g:airline#extensions#neomake#enabled = 1
let airline#extensions#neomake#error_symbol = 'E:'
let airline#extensions#neomake#warning_symbol = 'W:'

""  ============================================================================ "
""  ===                          ALE
""  ============================================================================ "
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
"let g:ale_go_gopls_init_options = {'ui.diagnostic.analyses': {
"    \ 'composites': v:false,
"    \ 'unusedparams': v:true,
"    \ 'unusedresult': v:true,
"    \ }}
" Equivalent to the above.
let b:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['prettier', 'eslint']
    \}
let g:ale_fix_on_save = 1
"let g:ale_linters = {
"    \'go': ['gofmt','revive','golint','goimports','staticcheck'],
"    \}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

"nnoremap ]l :ALENextWrap<cr>
"nnoremap [l :ALEPreviousWrap<cr>

""  ============================================================================ "
""  ===                          TREESITTER
""  ============================================================================ "
lua require("treesitter_config")

""  ============================================================================ "
""  ===                          MATERIAL THEME
""  ============================================================================ "

lua require("material_theme_config")
"colorscheme material
nnoremap <leader>mm :lua require('material.functions').toggle_style()<CR>


""  ============================================================================ "
""  ===                          NVIM LSP                                    === "
""  ============================================================================ "
lua require("lsp_config")
lua require("null_ls_config")

""  ============================================================================ "
""  ===                          NVIM CMP SETUP                              === "
""  ============================================================================ "
set completeopt=menu,menuone,noselect
lua require("nvim_cmp_config")

""  ============================================================================ "
""  ===                          GIT SIGNS
""  ============================================================================ "
lua require('gitsigns').setup()

""  ============================================================================ "
""  ===                          TROUBLES
""  ============================================================================ "
lua require("trouble_config")

""""""""""""""""""""""""""""""""""""""""""""
""              vim-go
""""""""""""""""""""""""""""""""""""""""""""

"autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua GoImports(1000)

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2
"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2
"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2
"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

""""""""""""""""""""""""""""""""""""""""""""
""              syntax
""""""""""""""""""""""""""""""""""""""""""""
" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo
au BufRead,BufNewFile *.tf            set filetype=terraform
au BufRead,BufNewFile *.terraform     set filetype=terraform
au BufRead,BufNewFile *.yaml.j2       set filetype=yaml
au BufRead,BufNewFile *.env.*         set filetype=sh
au BufRead,BufNewFile *.json.golden   set filetype=json
" file types
au FileType css setlocal ts=2 sw=2 sts=2 et
au FileType html setlocal ts=4 sw=4 sts=4 et omnifunc=
au FileType java setlocal ts=4 sw=4 sts=4 noet au FileType go setlocal ts=4 sw=4 sts=4 noet
au FileType javascript setlocal ts=2 sw=2 sts=2 et
au FileType typescript setlocal ts=2 sw=2 sts=2 et
au FileType tsx setlocal ts=2 sw=2 sts=2 et
au FileType javascript.jsx setlocal ts=2 sw=2 sts=2 et
au Filetype json setlocal ts=2 sw=2 sts=2 et
"au FileType json autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>
au FileType markdown setlocal spell ts=4 sw=4 sts=4 et
au FileType make setlocal sw=4 sts=4 noet nowrap
au FileType py setlocal ts=4 sw=4 sts=4 et
au FileType scss setlocal ts=2 sw=2 sts=2 et
au FileType yaml setlocal ts=2 sw=2 sts=2 et
au FileType lua setlocal ts=2 sw=2 sts=2 et



""""""""""""""""""""""""""""""""""""""""""""
""              git-fugitive
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gb :Git blame<cr>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nnoremap <leader>gr :GRead<cr>
nnoremap <leader>gm :GMove<cr>
nnoremap <leader>gw :GBrowse<cr>


""""""""""""""""""""""""""""""""""""""""""""
""              nerdtree
""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$',
    \ '^.git$'
\]
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
"nnoremap <silent> <C-b> :NERDTreeToggle<CR>

map <C-b> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'✹',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
    \ }


""""""""""""""""""""""""""""""""""""""""""""
""              terminal
""""""""""""""""""""""""""""""""""""""""""""
"""  turn terminal to normal mode with escape
"""tnoremap <Esc> <C-\><C-n>
""""" start terminal in insert mode
"""au BufEnter * if &buftype == 'terminal' | :startinsert | endif
""" open terminal on ctrl+n
"""function! OpenTerminal()
"""    split term://fish
"""    resize 10
"""endfunction
"""nnoremap <c-n> :call OpenTerminal()<CR>



let g:floaterm_keymap_new = '<c-n>'
let g:floaterm_keymap_hide = '<c-n>'
let g:floaterm_keymap_toggle = '<c-n>'
let g:floaterm_wintype = 'split'
"let g:floaterm_wintype = 'vsplit'
"let g:floaterm_wintype = 'float'
" Set floaterm gray when focus out
" hi FloatermNC guibg=gray

""""""""""""""""""""""""""""""""""""""""""""
""     TELESCOPE
""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>ff <cmd>Telescope find_files<cr>

lua << EOF
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy=true,
            override_generic_sorter=true,
            override_file_sorter=true,
            case_mode="smart_case",
            }
        }
    }
require('telescope').load_extension('fzf')
EOF
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>K :lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <leader>Ki :lua require'telescope.builtin'.lsp_implementations()<CR>
nnoremap <leader>Ks :lua require'telescope.builtin'.spell_suggest()<CR>
nnoremap <leader>gsta :lua require'telescope.builtin'.git_stash()<CR>
nnoremap <leader>gst :lua require'telescope.builtin'.git_status()<CR>
nnoremap <leader>gb :lua require'telescope.builtin'.git_branches()<CR>

nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}<CR>

"----------------------------------------------
" Searching
"----------------------------------------------
set ignorecase
set smartcase                     " turn on smartcase
set incsearch
set hlsearch

if has('nvim')
    set inccommand=split
endif

nnoremap n nzzzv
nnoremap N Nzzzv


""""""""""""""""""""""""""""""""""""""""""""
""              navigation
""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Move between buffers with Shift + arrow key...
nnoremap <Left> :bprevious<cr>
nnoremap <Right> :bnext<cr>

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" open new split panes to right and below
set splitright
set splitbelow
nnoremap <leader>e :e.<cr>
nnoremap <leader>v :vs.<cr>
nnoremap <leader>h :Hexplore!<cr>
nnoremap <leader>? :History<cr>
nnoremap <leader>t :tabs<cr>
nnoremap <leader>l :vsp<cr>
nnoremap <leader>w :sp<cr>
