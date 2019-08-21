scriptencoding utf-8

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=green
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

"""""""""""""" Basics #basics
""" Tabs #tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

""" Format Options #format-options
set formatoptions=tcrq
set textwidth=100

""" Handling backup copies
" make a copy of the file and overwrite the original one
set backupcopy=yes

""" UI Basics #ui-basics
" turn off mouse
set mouse=""
""" omni #omni
" enable omni syntax completion
set omnifunc=syntaxcomplete#Complete

call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'slim-template/vim-slim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  Plug 'tomasr/molokai'
  Plug 'neomake/neomake'
    " Run Neomake when I save any buffer
    augroup neomake
      autocmd! BufWritePost * Neomake
    augroup END
    " Don't tell me to use smartquotes in markdown ok?
    let g:neomake_markdown_enabled_makers = []

    " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
    let g:neomake_elixir_enabled_makers = ['mycredo']
    function! NeomakeCredoErrorType(entry)
      if a:entry.type ==# 'F'      " Refactoring opportunities
        let l:type = 'W'
      elseif a:entry.type ==# 'D'  " Software design suggestions
        let l:type = 'I'
      elseif a:entry.type ==# 'W'  " Warnings
        let l:type = 'W'
      elseif a:entry.type ==# 'R'  " Readability suggestions
        let l:type = 'I'
      elseif a:entry.type ==# 'C'  " Convention violation
        let l:type = 'W'
      else
        let l:type = 'M'           " Everything else is a message
      endif
      let a:entry.type = l:type
    endfunction

    let g:neomake_elixir_mycredo_maker = {
          \ 'exe': 'mix',
          \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
          \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
          \ 'postprocess': function('NeomakeCredoErrorType')
          \ }

  Plug 'c-brenn/phoenix.vim'
  Plug 'tpope/vim-projectionist' " required for some navigation features
  Plug 'slashmili/alchemist.vim'
  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'elixir-lang/vim-elixir'
  Plug 'vim-ruby/vim-ruby'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    "let g:airline_theme = 'luna'
    "let g:airline_theme = 'lucius'
    let g:airline_theme = 'lucius'
    let g:bufferline_echo = 0
    let g:airline_powerline_fonts=0
    let g:airline_enable_branch=1
    let g:airline_enable_syntastic=1
    let g:airline_branch_prefix = '⎇ '
    let g:airline_paste_symbol = '∥'
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#ale#enabled = 1

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'Fzf'
    nnoremap <C-p> :FzfFiles<CR>
    nnoremap <C-g> :FzfLines<CR>
    nnoremap <Leader><C-p> :FzfGitFiles<CR>
    nnoremap <Leader><C-h> :FzfBCommits<CR>

call plug#end()

syntax on
set number
set updatecount=50
set updatetime=250
set hidden
set nu

" highlight the current line
set cursorline

" Theme

syntax enable
set termguicolors
colorscheme molokai
set background=dark

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

let g:zv_file_types = {
      \ 'ruby'                   : 'ruby,ruby_2,rails',
      \ 'css'                    : 'css,bootstrap_3',
      \ 'javascript'             : 'javascript,jquery,angularjs,jasmine',
      \}

" My leader key
let mapleader = "\<Space>"

" Autosave
let g:auto_save = 1

" Searching
set hlsearch
set incsearch
set smartcase
set title

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
nnoremap <Tab> :bNext<CR>
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

" NERDTree
map <leader>w :NERDTreeFocusToggle<CR>
map <leader>q :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$', '\.idea$', '\~$','\.DS_Store']
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeWinPos = "left"

"================= Experimental ====================="

filetype plugin indent on " Enable filetype-specific indenting and plugins

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
