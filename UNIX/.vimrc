:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END:

:" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Initialize plugin system
call plug#end()
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeIgnore = ['^node_modules$']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
 return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a  modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:coc_global_extensions = [  'coc-tsserver', 'coc-pairs', 'coc-snippets', 'coc-json' ]
set encoding=UTF-8
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set noswapfile
set nobackup
" always uses spaces instead of tab characters
set expandtab

set laststatus=2
set statusline+=%F
set title
"set titlestring=%{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}
"set clipboard+=unnamedplus  " use the clipboards of vim and win

" Remap keys for applying codeAction to the current line.
"set paste               " Paste from a windows or from vim
"set go+=a               " Visual selection automatically copied to the clipboard

nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" colors
colorscheme gruvbox
:set bg=dark
if g:colors_name == "gruvbox"
  highlight Normal ctermbg=16 guibg=#000000
  "List other overrides here
endif""

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" rainbow
let g:rainbow_active = 1

let g:gruvbox_guisp_fallback = 'bg'


" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []
