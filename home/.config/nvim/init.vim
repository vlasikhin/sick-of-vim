call plug#begin()
	Plug 'junegunn/seoul256.vim'

	Plug 'editorconfig/editorconfig-vim'
	Plug 'ervandew/supertab'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-sensible'
	Plug 'Shougo/vimproc.vim', { 'do': 'make' }
	Plug 'mattn/emmet-vim', { 'for': [ 'html', 'haml', 'erb', 'slim', 'scss', 'css' ] }
	Plug 'ciaranm/detectindent'

	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction
	Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " | Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

	Plug 'benekastah/neomake'
	Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
	Plug 'slim-template/vim-slim'
	Plug 'kchmck/vim-coffee-script'

	Plug 'mhinz/vim-grepper'
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
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'tpope/vim-fugitive'

	Plug 'airblade/vim-gitgutter'
call plug#end()
set number

" Because of fish-shell
set shell=sh

" settings for Seoul Theme
let g:seoul256_background = 234
colo seoul256

let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5

"set relativenumber
set hidden

set updatetime=250

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

let mapleader = "\<Space>"

nnoremap <Tab> :bNext<CR>
nnoremap <Leader><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>

let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <C-g> :FzfLines<CR>
nnoremap <Leader><C-p> :FzfGitFiles<CR>
nnoremap <Leader><C-h> :FzfBCommits<CR>

map <C-n> <plug>NERDTreeFocusToggle<CR>

" air-line
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
let g:NERDTreeShowHidden = 1

"Grepping utilities
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>ag  :Grepper -tool ag  -grepprg ag --vimgrep -G '^.+\.txt'<cr>
nnoremap <leader>*   :Grepper -tool ack -cword -noprompt<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
