"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin(stdpath('data') .  '/plugged')

    "" Misc
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-sensible'
    Plug 'vim-airline/vim-airline'
    Plug 'Raimondi/delimitMate'

    "" Vim-Session
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'

    "" Interface related
    Plug 'chriskempson/base16-vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'

    "" 'IDE' related
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Install plugins with CocInstall

    "" Python related
    Plug 'Vimjas/vim-python-pep8-indent'

    "" Reasonml related
    Plug 'reasonml-editor/vim-reason-plus'
    Plug 'pangloss/vim-javascript', {'for': ['javascript', 'reason']}

    "" HTML related
    Plug 'hail2u/vim-css3-syntax'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'mattn/emmet-vim'

    "" Javascript related
    Plug 'jelera/vim-javascript-syntax'

call plug#end()

"*****************************************************************************
"" General
"*****************************************************************************
"" Required
filetype plugin indent on
syntax on
set hidden
set number

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Search mappings: These will make it so that going to the next one in a
" " search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" Map leader to ,
let mapleader=','

" colorscheme base16-default-dark
" let base16colorspace=256

" set termguicolors

set relativenumber

set colorcolumn=80

:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

"*****************************************************************************
""" Abbreviations and Mappings
"*****************************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"*****************************************************************************
"" preservim/nerdtree
"*****************************************************************************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"*****************************************************************************
"" Yggdroot/indentLine
"*****************************************************************************
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = ''
let g:indentLine_faster = 1

"*****************************************************************************
"" vim-airline/vim-airline
"*****************************************************************************
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"*****************************************************************************
"" dense-analysis/ale
"*****************************************************************************
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_linters = {'cpp': ['cpplint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['yapf'], 'reason': ['refmt']}
let g:ale_fix_on_save = 1
let g:ale_reason_ols_executable = '/usr/local/bin/reason-language-server'
let g:ale_reason_ls_executable = '/usr/local/bin/reason-language-server'
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

"*****************************************************************************
"" neoclide/coc.nvim
"*****************************************************************************
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc extensions auto-install
let g:coc_global_extensions = ['coc-clangd', 'coc-markdownlint', 'coc-texlab']

" pip install python-language-server
" pip install pynvim

" Python related
let g:python_pep8_indent_hang_closing = 1
let g:ale_python_pylint_options = '--disable=C0114'
