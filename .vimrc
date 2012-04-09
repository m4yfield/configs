call pathogen#infect('~/.vim/bundle')
syntax on
set number
filetype plugin indent on

if has("mouse")
	set mouse=a
	set mousehide
endif

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
