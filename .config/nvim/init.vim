" Plugins
	if ! filereadable(system('echo -n "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"'))
		echo "Downloading junegunn/vim-plug to manage plugins..."
		silent !mkdir -p $XDG_CONFIG_HOME/nvim/autoload/
		silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim
		autocmd VimEnter * PlugInstall
	endif

	set rtp+=~/.config/nvim/autoload/plug.vim
	call plug#begin('~/.config/nvim/plugins')
		" Color + Style
			Plug 'arcticicestudio/nord-vim'
			Plug 'andreasvc/vim-256noir'
			Plug 'jonathanfilip/vim-lucius'
			"Plug 'vim-airline/vim-airline'
			Plug 'justinmk/vim-syntax-extra'
			Plug 'junegunn/goyo.vim'
			Plug 'franbach/miramare'
			Plug 'aonemd/kuroi.vim'

		" Quality-of-life
			Plug 'junegunn/vim-easy-align'
			Plug 'vimwiki/vimwiki'
			Plug 'sirver/UltiSnips'

		" Searching
			Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
			Plug 'rking/ag.vim'

		" Plugins that just add highlighting
			Plug 'JuliaEditorSupport/julia-vim', {'for': 'jl'}
			Plug 'lervag/vimtex',	{'for': 'tex'}
			Plug 'tikhomirov/vim-glsl'
			Plug 'ziglang/zig.vim', {'for': 'zig'}
	call plug#end()

" Common settings
	filetype plugin indent on
	syntax on
	set clipboard+=unnamedplus
	set nocompatible
	set noswapfile
	set hidden
	set undofile
	set undodir="~/.vim/undo"
	set laststatus=1
	set splitbelow splitright
	set wildmode=longest,list,full

	colorscheme 256_noir

	set foldmethod=syntax
	set foldnestmax=5
	set nofoldenable
	set foldlevel=2

	set tabstop=4
	set softtabstop=0 noexpandtab
	set shiftwidth=4

	set conceallevel=0
	set concealcursor=niv

	" Specify formatting style
		autocmd BufNewFile,BufRead *.h,*.c set formatprg=astyle\ -A2SxWwm0k1xC80t4
		"A2 = attach style braces
		"S = indent switch cases
		"xW = preprocessor indent level 0
		"w = indent multiline #defines
		"m0 = something with 0 minimal indent of conditionals
		"k1 = align pointer to type
		"xC = max code length
		"t4 = indent with 4 space width tabs

	" Automatically deletes all trailing whitespace and newlines at end of file on save.
		autocmd BufWritePre * %s/\s\+$//e
		autocmd BufWritepre * %s/\n\+\%$//e

" Zig
	let g:zig_fmt_autosave = 0

" vimtex
 	let g:vimtex_quickfix_mode = 0

" Ultisnips
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Airline
"	let g:airline_section_z = '%l/%L:%c'
"	let g:airline_skip_empty_sections = 1
"	let g:airline_mode_map = {
"	      \ '__' : '-',
"	      \ 'n'  : 'N',
"	      \ 'i'  : 'I',
"	      \ 'R'  : 'R',
"	      \ 'c'  : 'C',
"	      \ 'v'  : 'V',
"	      \ 'V'  : 'V',
"	      \ '' : 'V',
"	      \ 's'  : 'S',
"	      \ 'S'  : 'S',
"	      \ '' : 'S',
"	      \ }

" Keymaps and such
	let mapleader=","
	let maplocalleader=","

" Remap movement keys between windows
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

" Common quality-of-life binds
	map <silent> <leader>v :vsplit<CR>
	noremap <silent> <F1> :set nonumber!<CR>
	noremap <silent> <F2> :Goyo<CR>
	nnoremap <space> za
	noremap <silent> <leader>q :b#<CR>
	noremap <silent> <leader>w :wa<CR>

	"nnoremap <F4> :make -j4<CR>

	autocmd FileType zig nnoremap <buffer> <F3> :!zig build<CR>
	autocmd FileType zig nnoremap <buffer> <F4> :!zig build play<CR>
	autocmd FileType c,h nnoremap <buffer> <F3> :!make -j4<CR>
	autocmd FileType c,h nnoremap <buffer> <F4> :!./build/tests<CR>

	"" Spellcheck
	nnoremap <F5> :setlocal spell!<CR>
	nnoremap <F6> :setlocal spelllang=sv<CR>
	nnoremap <F7> :setlocal spelllang=en<CR>

	" Save file as sudo on files that require root permission
		cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

	" Indentation
		nnoremap <tab> ==
		noremap <leader><tab> gq
		noremap <leader><s-tab> gggqG

	" Quicker substituation
		nnoremap <leader>s :%s//g<left><left>

" FZF
	map   <leader>f :FZF<CR>

" Ag
	map 	<leader>a :Ag<CR>

" Vim-Easy-Align
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)
	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

" Exit insert mode
	imap <leader>j <ESC>
