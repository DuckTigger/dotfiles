filetype indent on
" filetype plugin indent on
set tabstop=4
set shiftwidth=4
set nocompatible              " be iMproved, required

filetype off                  " required

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/L9'

Plug 'lervag/vimtex'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'zsh-users/zsh-syntax-highlighting'

Plug 'ervandew/supertab'

Plug 'valloric/youcompleteme'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf' 
" Plug 'townk/vim-autoclose'
Plug 'raimondi/delimitmate'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/syntastic'
Plug 'kamykn/popup-menu.nvim'
Plug 'kamykn/spelunker.vim'
Plug 'sonph/onehalf'
Plug 'dylanaraps/wal.vim'
Plug 'mracos/mermaid.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


let uname = system('uname -a')
"if !has('macunix')
"	colorscheme wal
"endif

let g:catppuccin_flavour = "mocha"
colorscheme catppuccin

" imap ;; <Esc>
nmap <Space> a

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
set conceallevel=1
" let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_viewer_zathura = 1
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<A+Tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set t_Co=256

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Sets the visual bell when using MVim
autocmd! GUIEnter * set vb t_vb="|f"

setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" let g:ycm_filetype_blacklist = {
" \ 'tagbar': 1,
" \ 'notes': 1,
" \ 'markdown': 1,
" \ 'netrw': 1,
" \ 'unite': 1,
" \ 'text': 1,
" \ 'vimwiki': 1,
" \ 'pandoc': 1,
" \ 'infolog': 1,
" \ 'leaderf': 1,
" \ 'tex': 1,
" \ 'mail': 1
" \}
