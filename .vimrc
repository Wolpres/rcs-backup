"For promptline.vim mostly
"
"promptline update vim command:
" :PromptlineSnapshot! ~/.shell_prompt.sh lightline

nmap J 5j
nmap K 5k
nmap L $
nmap H ^

set rtp+=~/.vim/bundle/Vundle.vim "":BundleInstall
call vundle#begin()


Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/promptline.vim'

call vundle#end()            " required
filetype plugin indent on    " required

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

let g:promptline_preset = {
      \'a'    : [ '\A' ],
      \'b'    : [ '\u' ],
      \'c'    : [ '\w' ],
      \'warn' : [ 'promptline#slices#last_exit_code()' ] }
