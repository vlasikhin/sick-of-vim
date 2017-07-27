call plug#begin()
	Plug 'KeitaNakamura/neodark.vim'
	Plug 'rakr/vim-one'
	Plug 'tpope/vim-sensible'

	Plug 'benekastah/neomake'

	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction
	Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } | Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

	Plug 'mhinz/vim-grepper'

	Plug 'peterhoeg/vim-qml', { 'for': 'qml' }

	Plug 'posva/vim-vue', { 'for': 'vue' }

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	Plug 'KabbAmine/zeavim.vim'

	Plug 'tpope/vim-rails', { 'for': 'ruby' }

	Plug 'mattn/emmet-vim', { 'for': [ 'html', 'haml', 'erb' ] }

	Plug 'Shougo/vimproc.vim', { 'do': 'make' }

	Plug 'bling/vim-airline' | Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'

	Plug 'ciaranm/detectindent'

	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-surround'

	Plug 'terryma/vim-expand-region'
	Plug 'justinmk/vim-sneak'

	Plug 'vim-airline/vim-airline'
	Plug 'Yggdroot/indentLine'
	Plug 'vim-airline/vim-airline-themes'

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

"colorscheme neodark
colorscheme one
set background=dark " for the dark version

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
let g:airline_theme='one'
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
