" Vundle
set nocompatible             " not compatible with the old-fashion vi mode
" filetype off                 " required!

" zsh
set shell=/bin/zsh\ -l

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"git control
Bundle 'tpope/vim-fugitive'
"easy grep
Bundle 'EasyGrep'
" All kinds of lists in view
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
" Speed nevigating and editing
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Townk/vim-autoclose'
" Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'

" snipmate component
"   Bundle 'MarcWeber/vim-addon-mw-utils'
"   Bundle 'tomtom/tlib_vim'
"   Bundle 'honza/vim-snippets'
"   Bundle 'garbas/vim-snipmate'
" python dedicate
"   Bundle 'klen/python-mode'

" markdown dedicate
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
" Bundle 'omnicppcomplete'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rizzatti/dash.vim'


" general
filetype on                  " enable filetype-specific plugins
filetype plugin indent on    " enable filetype-specific plugins
set history=500               " keep 500 lines of command line history
set number                   " enable line numbers
set autoindent               " enable autoindent
" set noexpandtab                " use space instead of tab
set tabstop=4                " insert 2 spaces for a tab
set shiftwidth=4             " the number of space characters inserted for indentation
syntax on                    " enable syntax highlighting
colors default               " vim color scheme
set autoread                 " auto read when file is changed from outside
" set mouse=a                  " mouse support
if has("gui_running")        " GUI color and font settings
  set guifont=Monaco:h14
  set t_Co=256               " 256 color mode
end
if has("gui_macvim")         " macvim shift movement
  let macvim_hig_shift_movement = 1
endif
set cursorline               " highlight current line
set clipboard=unnamed        " yank to the system register (*) by default
set showmatch                " Cursor shows matching ) and }
set showmode                 " Show current mode
set backspace=2              " make backspace work like most other apps
set ignorecase               " Ignore case when searching
set hlsearch                 " Highlight search things

" set foldmethod=syntax
set foldmethod=indent
set foldlevel=5
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
augroup PYTHON
    autocmd!
    autocmd FileType py setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" disable sound on errors
set noeb vb t_vb=

" Hide toolbar and scrollbars in MacVim
set guioptions-=T
set guioptions-=L
set guioptions-=r

" ctag file auto search
set tags=tags;

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" to move effeciently between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" to move tab by left/right key
nmap <right> :tabnext<cr>
nmap <left> :tabprevious<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>


" encoding settings
let $LANG="zh_CN.UTF-8"
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

" comment lines with cmd+/
" map <D-/> :TComment<cr>
" vmap <D-/> :TComment<cr>gv

" status line {
set laststatus=2

" --- PowerLine
let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column

let g:tagbar_autofocus = 1
" open sidebar
map <silent> <F2> :NERDTreeToggle<CR>
" --- Hex editor
map <silent> <F6> ::%!xxd<cr>
" --- tagbar
map <silent> <F9> :TagbarToggle<cr>
" --- Gundo: document history. Not work on python 3.7
" map <silent> <F7> :GundoToggle<cr>
" --- move in split-window
"  ?????????????
" --- ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let NERDTreeShowBookmarks = 1
let g:ctrlp_show_hidden = 1
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

"" --- tlist
"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"map <silent> <F9> :TlistToggle<cr>

" --- Easygrep: use system grep
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepMode=2
let g:EasyGrepFilesToExclude = ".git,*.bak,*~,cscope.*,*.a,*.o,*.pyc,*.bak"


" --- python-mode
" Load the whole plugin
" let g:pymode = 1
let g:pymode_lint_cheker = "pylint"

" --- markdown
let g:vim_markdown_frontmatter=1

" --- hex editor

" --- dash app
nmap <silent> <leader>d <Plug>DashSearch

" --- omnicppcomplete, replaced by youcompleteme
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
" let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
" let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
" let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" --- youcompleteme
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1

if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif
