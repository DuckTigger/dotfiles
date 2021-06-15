filetype indent on
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'

Plugin 'vim-latex/vim-latex'

Plugin 'zsh-users/zsh-syntax-highlighting'

Plugin 'ervandew/supertab'

Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf' 

Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/syntastic'
Plugin 'kamykn/spelunker.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

set shellslash
set termguicolors

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:vimtex_view_method='chromium'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Sets the visual bell when using MVim
autocmd! GUIEnter * set vb t_vb="|f"

setlocal nospell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
