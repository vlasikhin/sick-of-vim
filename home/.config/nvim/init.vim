call plug#begin()
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'tomtom/tlib_vim'
	Plug 'honza/vim-snippets'
	Plug 'garbas/vim-snipmate'

	Plug 'editorconfig/editorconfig-vim'
	Plug 'ervandew/supertab'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-sensible'
	Plug 'Shougo/vimproc.vim', { 'do': 'make' }
	Plug 'mattn/emmet-vim', { 'for': [ 'html', 'haml', 'erb', 'slim', 'scss', 'css' ] }
	Plug 'ciaranm/detectindent'
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction
	Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " | Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

	Plug 'benekastah/neomake'
	Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
	Plug 'slim-template/vim-slim'
	Plug 'kchmck/vim-coffee-script'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	Plug 'tpope/vim-rails', { 'for': 'ruby' }
	Plug 'vim-ruby/vim-ruby'
	Plug 'thoughtbot/vim-rspec'
 	Plug 'jgdavey/vim-blockle'
	Plug 'Raimondi/delimitMate'
	Plug 'skalnik/vim-vroom'
	Plug 'scrooloose/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	Plug 'tpope/vim-sleuth'
	Plug 'scrooloose/nerdcommenter'

	Plug 'airblade/vim-rooter'

	Plug 'terryma/vim-expand-region'
	Plug 'justinmk/vim-sneak'

	Plug 'vim-airline/vim-airline'
	Plug 'Yggdroot/indentLine'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'airblade/vim-gitgutter'
call plug#end()
set number


" Theme
set background=dark
colorscheme PaperColor

let g:enable_bold_font = 1

let g:indentLine_color_term = 239
set nu
"set relativenumber
set hidden

set updatetime=250

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

autocmd! BufWritePost * Neomake

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

"let g:monster#completion#rcodetools#backend = "async_rct_complete"

let g:zv_file_types = {
			\ 'ruby'                   : 'ruby,ruby_2,rails',
			\ 'css'                    : 'css,bootstrap_3',
			\ 'javascript'             : 'javascript,jquery,angularjs,jasmine',
			\}

"Keybindings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" My leader key
let mapleader = "\<Space>"

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
nnoremap <Tab> :bNext<CR>
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

"nnoremap <Leader><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <C-g> :FzfLines<CR>
nnoremap <Leader><C-p> :FzfGitFiles<CR>
nnoremap <Leader><C-h> :FzfBCommits<CR>

map <leader>w :NERDTreeFocusToggle<CR>
map <leader>q :NERDTreeToggle<CR>

" air-line
let g:airline_theme = "murmur"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeShowHidden = 0

"================= Experimental ====================="

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

" Syntax highlighting and theme
syntax enable

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/


" highlight the current line
set cursorline
" Highlight active column
set cuc cul

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
