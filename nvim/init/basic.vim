" vim: set ft=vim:

"=============================================================================
" => General
"=============================================================================
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Redraw fix
set re=0

"=============================================================================
" => Files, backups and undo
"=============================================================================
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"=============================================================================
" => VIM UI
"=============================================================================
set showcmd       " Shows incomplete command
set wildmenu      " Set command-line completion

" Where Vim looks for completions is controlled by the complete setting.
" The default is .,w,b,u,t,i, which means Vim will look in:
"
" . The current buffer.
" w Buffers in other windows.
" b Other loaded buffers.
" u Unloaded buffers.
" t Tags.
" i Included files.

set complete=.,w,b,u,i

set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=_build/*,*.beam

" Set line numbers
set number

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight current line
set cursorline

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set noerrorbells  " Disables the error bell sound when an error is encountered
set novisualbell  " Disables the visual bell effect when an error is encountered
set t_vb=         " Disables the visual bell effect for terminal Vim
set tm=500        " Sets the duration (in milliseconds) of the visual bell effect

set timeoutlen=500 " Specifies the time (in milliseconds) to wait for a mapped sequence to complete
set ttimeoutlen=0  " Disables the timeout for key sequences in terminal mode
set modeline      " Enables the reading of modelines in files
set clipboard=unnamedplus " Allows Vim to interact with the system clipboard

set mouse=a       " Enables mouse support in all modes (normal, insert, and visual)


"=============================================================================
" => Colors and Fonts
"=============================================================================

set termguicolors

" Enable syntax highlighting
syntax enable


"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark  " Set the background color to dark

let g:one_allow_italics = 1  " Enable italics in the 'one' colorscheme

colorscheme one  " Set the 'one' colorscheme

let g:airline_theme='one'  " Set the 'one' colorscheme for the Airline plugin

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Terminal color schema
let g:terminal_color_0 = '#2E3436'  " Black
let g:terminal_color_8 = '#555753'  " Bright black
let g:terminal_color_1 = '#CC0000'  " Red
let g:terminal_color_9 = '#EF2929'  " Bright red
let g:terminal_color_2 = '#4E9A06'  " Green
let g:terminal_color_10 = '#8AE234' " Bright green
let g:terminal_color_3 = '#C4A000'  " Yellow
let g:terminal_color_11 = '#FCE94F' " Bright yellow
let g:terminal_color_4 = '#3465A4'  " Blue
let g:terminal_color_12 = '#729FCF' " Bright blue
let g:terminal_color_5 = '#75507B'  " Magenta
let g:terminal_color_13 = '#AD7FA8' " Bright magenta
let g:terminal_color_6 = '#06989A'  " Cyan
let g:terminal_color_14 = '#34E2E2' " Bright cyan
let g:terminal_color_7 = '#D3D7CF'  " White
let g:terminal_color_15 = '#EEEEEC' " Bright white


"=============================================================================
" => Text, tab and indent related
"=============================================================================
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines

set list
set showbreak=↪\
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set textwidth=80

"=============================================================================
" => Status line
"=============================================================================
set laststatus=2  " Always show statusline

"=============================================================================
" => Movement, windows, tabs, etc
"=============================================================================

nnoremap <cr> :noh<cr><cr>

" Tabs management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>te :tabedit<c-r>=expand("%:p:h")<cr>/

" Windows resizing
nnoremap <Left> :vertical resize +1<cr>
nnoremap <Right> :vertical resize -1<cr>
nnoremap <Up> :resize +1<cr>
nnoremap <Down> :resize -1<cr>

" I dont use Ex Mode
nnoremap Q <nop>

imap jj <Esc>

nnoremap <Leader>rr :set relativenumber<CR>
nnoremap <Leader>rn :set norelativenumber<CR>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <S-Left>
cnoremap <C-w> <S-Right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


command SessSave call SessionSave()
command SessRestore call SessionRestore()

