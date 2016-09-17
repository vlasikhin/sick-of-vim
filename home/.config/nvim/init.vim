call plug#begin()
	Plug 'junegunn/seoul256.vim'
	Plug 'tpope/vim-sensible'

	Plug 'benekastah/neomake'


	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction

	Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " | Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }

	Plug 'mhinz/vim-grepper'

	Plug 'peterhoeg/vim-qml', { 'for': 'qml' }

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	Plug 'KabbAmine/zeavim.vim'

	Plug 'tpope/vim-rails', { 'for': 'ruby' }

	Plug 'rust-lang/rust.vim', { 'for': 'rust' } | Plug 'racer-rust/vim-racer'

	Plug 'elixir-lang/vim-elixir'
	Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

	Plug 'mattn/emmet-vim', { 'for': [ 'html', 'haml', 'erb', 'slim', 'scss', 'css' ] }

	Plug 'Shougo/vimproc.vim', { 'do': 'make' }

	Plug 'airblade/vim-rooter'

	Plug 'scrooloose/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	Plug 'tpope/vim-sleuth'
	Plug 'scrooloose/nerdcommenter'

	Plug 'ciaranm/detectindent'

	Plug 'terryma/vim-expand-region'
	Plug 'justinmk/vim-sneak'

	Plug 'vim-airline/vim-airline'
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Because of fish-shell
set shell=sh

let g:seoul256_background = 238
colo seoul256

set relativenumber
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
let mapleader = "\<Space>"

nnoremap <Tab> :bNext<CR>
nnoremap <Leader><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>

let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <C-g> :FzfLines<CR>
nnoremap <Leader><C-p> :FzfGitFiles<CR>
nnoremap <Leader><C-h> :FzfBCommits<CR>

map <C-n> <plug>NERDTreeFocusToggle<CR>

let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_autofind = 1

"Grepping utilities
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>ag  :Grepper -tool ag  -grepprg ag --vimgrep -G '^.+\.txt'<cr>
nnoremap <leader>*   :Grepper -tool ack -cword -noprompt<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
