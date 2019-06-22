let mapleader=""
syntax enable
syntax on
colorscheme desert

:set autowrite   " 自动保存

set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码
"  折行
"autocmd FileType c,cpp  setl fdm=syntax | setl fen
set number
set cursorline
set norelativenumber
set wrap
set noshowcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" Vundle manage
set nocompatible              " be iMproved, required
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap j h
noremap i k
noremap k j

noremap h i
noremap H I
noremap I 5k
noremap K 5j
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

" N key: go to the start of the line
noremap <C-j> 0
" I key: go to the end of the line
noremap <C-l> $

inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>


map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map si :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tu :tabe<CR>
map tk :-tabnext<CR>
map ti :+tabnext<CR>

map sw <C-w>t<C-w>H
map sd <C-w>t<C-w>K





" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar' " Tag bar"
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mbbill/undotree'
Plugin 'gdbmgr'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine' " Indentation level"
Plugin 'bling/vim-bufferline' " Buffer line"
"Plugin 'kepbod/quick-scope' " Quick scope"

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'connorholyday/vim-snazzy'


" Error checking
Plugin 'w0rp/ale'

" Other visual enhancement
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'itchyny/vim-cursorword'

" Git
Plugin 'rhysd/conflict-marker.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Python
Plugin 'vim-scripts/indentpython.vim'

" Markdown
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plugin 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plugin 'vimwiki/vimwiki'

" Bookmarks
Plugin 'kshenoy/vim-signature'

" Other useful utilities
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/goyo.vim' " distraction free writing mode
Plugin 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plugin 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plugin 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip

" Dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'kana/vim-textobj-user'
Plugin 'fadein/vim-FIGlet'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


let g:SnazzyTransparent = 1
color snazzy

 "--------------------------------------------------------------------------------
 " TagList :Tlist 和 wm
 "--------------------------------------------------------------------------------
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_Show_Menu=1
"let Tlist_Auto_Open=1

" Tagbar
"nmap tag :TagbarToggle<CR>
let g:tagbar_width=25
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()

" NetRedTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=15
let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "u"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "p"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


let g:winManagerWindowLayout='TagList'
nmap wm :WMToggle<cr>

" syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------------------------------------------------------------------------------
" cscope:建立数据库：cscope -Rbq；  F5 查找c符号； F6 查找字符串；   F7 查找函数谁调用了，
"--------------------------------------------------------------------------------
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif


:set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"F5 查找c符号； F6 查找字符串；   F7 查找函数定义； F8 查找函数谁调用了，
nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR> 
nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
"nmap <silent> <F7> :cs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>


 "--------------------------------------------------------------------------------
"  自动加载ctags: ctags -R
if filereadable("tags")
      set tags=tags
endif


"  自动保存 kernel 的ctags文件
if isdirectory("kernel/") && isdirectory("mm/")
	au BufWritePost *.c,*.h silent! !ctags -L tags.files&
	au BufWritePost *.c,*.h silent! !cscope -bkq -i tags.files&
endif


"--------------------------------------------------------------------------------
" global:建立数据库
"--------------------------------------------------------------------------------
if filereadable("GTAGS")
	set cscopetag
	set cscopeprg=gtags-cscope
	cs add GTAGS
	au BufWritePost *.c,*.cpp,*.h silent! !global -u &
endif


 "--------------------------------------------------------------------------------
 " QuickFix
 "--------------------------------------------------------------------------------
 nmap <F1> :cn<cr>   " 切换到下一个结果
 nmap <F2> :cp<cr>   " 切换到上一个结果

 "--------------------------------------------------------------------------------
" MiniBufExp :  Ctrl + Tab 键可以在minibuf中选择，Ctrl+h,j,k,l或者方向键
" 来选择窗口
 "--------------------------------------------------------------------------------
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

 "--------------------------------------------------------------------------------
 " A, c和h文件切换
 "--------------------------------------------------------------------------------
nnoremap <silent> <F12> :A<CR>


