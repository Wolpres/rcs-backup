" Setts, Mapps ---------------                                             {{{
set nocompatible

filetype off
set nu
set mouse=a
set scrolloff=5
set encoding=utf-8
set fileencoding=utf-8
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set expandtab
set noswapfile
set list
set listchars=tab:>\ ,eol:«,trail:·
scriptencoding utf-8
filetype plugin indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab!
set ruler
set noshowmode
set laststatus=2
set magic
set splitright
set splitbelow

nmap :W :w
nmap :Q :q
nmap :Wq :wq
nmap J 5j
vmap J 5j
nmap K 5k
vmap K 5k
nmap L E
vmap L E
nmap H B
vmap H B
nmap <C-h> ^
vmap <C-h> ^
nmap <C-l> $
vmap <C-l> $
nmap <Tab> i<Tab><Esc>
vmap <Space> <Nop>
nmap <F12> :NERDTreeToggle<CR>

nmap 1t 1gt
nmap 2t 2gt
nmap 3t 3gt
nmap 4t 4gt
nmap 5t 5gt
nmap 6t 6gt
nmap 7t 7gt
nmap 8t 8gt
nmap 9t 9gt
nmap tt gt
nmap t1 1gt
nmap t2 2gt
nmap t3 3gt
nmap t4 4gt
nmap t5 5gt
nmap t6 6gt
nmap t7 7gt
nmap t8 8gt
nmap t9 9gt

au FileType html nmap <C-,> odocument.write("<br>");<Esc>8ha
au FileType html imap <C-,> <Esc>odocument.write("<br>");<Esc>8ha

" }}}

" CursorLines ----------------                                             {{{
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set cursorcolumn
hi CursorColumn term=bold cterm=bold guibg=Grey40

au InsertEnter * set cursorline!
au InsertEnter * set cursorcolumn!
au InsertLeave * set cursorline
au InsertLeave * set cursorcolumn
" }}}

" Plug -----------------------                                             {{{
call plug#begin('~/.vim/plugged')

Plug 'edkolev/promptline.vim'

call plug#end()
" }}}

" Vundle ---------------------                                             {{{
set rtp+=~/.vim/bundle/Vundle.vim "":BundleInstall
call vundle#begin()

"Bundle 'neomake/neomake'
"Bundle 'vim-syntastic/syntastic'
Bundle 'vorillaz/devicons'
Bundle 'jiangmiao/auto-pairs'
Bundle 'prabirshrestha/async.vim'
Bundle 'prabirshrestha/asyncomplete.vim'
Bundle 'wellle/tmux-complete.vim'
Bundle 'Shougo/deoplete.nvim'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'vim-airline/vim-airline'
"Bundle 'vim-airline/vim-airline-themes'
"Bundle 'powerline/powerline'
"Bundle 'ryanoasis/powerline-extra-symbols'
"Bundle 'powerline/fonts'
Bundle 'itchyny/lightline.vim'
Bundle 'maximbaz/lightline-ale'
Bundle 'w0rp/ale'

Bundle 'mattn/emmet-vim'

Bundle 'cj/vim-webdevicons'
Bundle 'ryanoasis/nerd-fonts'
Bundle 'mhartington/vim-devicons'
Bundle 'vim-scripts/html-improved-indentation'


"Bundle 'drmingdrmer/xptemplate'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" ColorScheme ----------------                                             {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
	set termguicolors
endif
syntax enable
colorscheme OceanicNext

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

highlight LineNr guibg=#353537
" }}}

" Skeletons ------------------                                             {{{
au BufNewFile *.cpp
	\ exe "normal i/**\r@File: " . expand('%:t:r') . "\r@Author: Josef Dostál\r@Date: " . strftime('%d.%m.%Y') . "\r/\r#include <iostream>\r\rusing namespace std;\r\rint main() {\r\rreturn 0;\r}\<Esc>kk"
au BufNewFile *.c
	\ exe "normal i/**\r@File: " . expand('%:t:r') . "\r@Author: Josef Dostál\r@Date: " . strftime('%d.%m.%Y') . "\r/\r#include <stdio.h>\r\rint main() {\r\rreturn 0;\r}\<Esc>kk"
au BufNewFile *.java
	\ exe "normal ipublic class " . expand('%:t:r') . " {\r public static void main(String[] args) {\r\r}\r}\<Esc>kk"
au BufNewFile *.html
	\ exe "normal ihtml:5\<Esc>\<C-z>,"
" }}}

" Fold -----------------------                                             {{{
set foldnestmax=10
"set nofoldenable
set foldlevel=0

au FileType vim set foldmethod=marker
au FileType c set foldmethod=syntax
au FileType cpp set foldmethod=syntax
au FileType java set foldmethod=syntax

nmap ( :%foldo<CR>
nmap ) :%foldc<CR>
nmap <Space> za


" }}}

" Neomake --------------------                                             {{{
"
"" When writing a buffer.
"call neomake#configure#automake('w')
"" When writing a buffer, and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
"" When reading a buffer (after 1s), and when writing.
"call neomake#configure#automake('rw', 1000)
"
"if has("nvim")
"    set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
"
"    autocmd! BufWritePost,BufEnter * Neomake
"
"    let g:neomake_place_signs = 1
"    let g:neomake_open_list = 2
"
"    let g:neomake_php_enabled_makers = ['php']
"
"    " Look for local eslint and if not use globally installed one
"    let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
"    let g:neomake_javascript_enabled_makers = ['eslint']
"    let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
"
"    let g:neomake_go_enabled_makers = ['go']
"    let g:neomake_python_enabled_makers = ['python']
"endif
"
"let g:neomake_cpp_enabled_makers=['clang']
"let g:neomake_clang_args=[
"      \ '-Wall',
"      \ ]
"
"let g:neomake_c_enabled_makers=['gcc']
"let g:neomake_gcc_args=[
"      \ '-fsyntax-only',
"      \ '-Wall',
"      \ '-Wextra',
"      \ '-Wpedantic',
"      \ '-fopenmp',
"      \ ]
" }}}

" Ale ------------------------                                             {{{
"let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] %s (%linter%)'

set statusline=%{LinterStatus()}
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_linters = {
	\ 'cpp': ['clang'],
	\ 'c': ['gcc'],
	\ 'html': ['tidy', 'eslint'],
	\ 'javascript': ['eslint']
	\ }
" }}}

" LightLine ------------------                                             {{{
set guifont=Fura\ Mono\ Regular\ for\ Powerline\ Plus\ Nerd\ File\ Types\
"let g:lightline.separator = { 'left': '', 'right': '' }
"let g:lightline.subseparator = { 'left': '|', 'right': '|' }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'ctrlpmark' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! LightLineFilename()
  return expand('%f')
endfunction
" }}}

" Others ---------------------                                             {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'

set viewoptions=folds
"mkview



let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType html set autoindent

" }}}
