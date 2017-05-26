call plug#begin()
"Theme"
	Plug 'KeitaNakamura/neodark.vim'
""	Plug 'junegunn/seoul256.vim'
"Underlines the word under the cursor"
	Plug 'itchyny/vim-cursorword'

"Snippets"
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'tomtom/tlib_vim'
	Plug 'honza/vim-snippets'
	Plug 'garbas/vim-snipmate'

"Sintax"
	Plug 'vim-syntastic/syntastic'
	Plug 'posva/vim-vue', { 'for': 'vue' }
	Plug 'plasticboy/vim-markdown'
	Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
	Plug 'slim-template/vim-slim'
	Plug 'kchmck/vim-coffee-script'
	Plug 'vim-ruby/vim-ruby'

"color keyword highlighter"
	Plug 'ap/vim-css-color'

"insert mode completions with Tab"
	Plug 'ervandew/supertab'

"add end in ruby"
	Plug 'tpope/vim-endwise'

"Interactive command execution in Vim"
	Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"support for expanding abbreviations similar to emmet"
	Plug 'mattn/emmet-vim', { 'for': [ 'html', 'haml', 'erb', 'slim', 'scss', 'css' ] }

"automatically detecting indent settings"
	Plug 'ciaranm/detectindent'

"Dark powered asynchronous completion framework for neovim"
	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction
	Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } | Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

"Asynchronous linting and make framework for Neovim/Vim"
	Plug 'benekastah/neomake'

"A command-line fuzzy finder"
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

"Ruby on Rails power tools"
	Plug 'tpope/vim-rails', { 'for': 'ruby' }

"automatic closing of quotes, parenthesis, brackets, etc.,"
	Plug 'Raimondi/delimitMate'

"NerdTree"
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tpope/vim-sleuth'

	Plug 'terryma/vim-expand-region'
	Plug 'justinmk/vim-sneak'

	Plug 'vim-airline/vim-airline'
	Plug 'Yggdroot/indentLine'
	Plug 'vim-airline/vim-airline-themes'

"shows a git diff in the gutter"
	Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'

call plug#end()

syntax on
set number
set updatecount=50
set updatetime=250
set hidden
set nu
" highlight the current line
set cursorline
" Highlight active column
"set cuc cul

" Theme
"let g:seoul256_background = 235
"colo seoul256

syntax enable
set termguicolors
colorscheme neodark

let ruby_operators = 1
let ruby_space_errors = 1
let g:rubycomplete_rails = 1

"Sintax"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

"Deoplete"
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

"Neomake"
autocmd! BufWritePost * Neomake

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

" NERDTree
map <leader>w :NERDTreeFocusToggle<CR>
map <leader>q :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$', '\.idea$', '\~$','\.DS_Store']
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1


" air-line
let g:airline_theme='zenburn'
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

"================= Experimental ====================="

filetype plugin indent on " Enable filetype-specific indenting and plugins

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
