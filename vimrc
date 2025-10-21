"Invoke pathogen for plugins"
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"Line numbers"
set number
"Tell me the name of the file I'm editing"
set title
"A tab is equivalent to 4 spaces"
set tabstop=4
"Shift by 4 spaces when I press tab"
set shiftwidth=4
"Do C-style indentation automatically"
set cindent
"Make backspace work like in most other apps"
set backspace=indent,eol,start
"Highlight search results"
set hlsearch
"Ignore case while searching..."
set ignorecase
"...but only ignore if the search string is all lowercase"
set smartcase
"Always keep status bar on"
set laststatus=2
"Set encoding to utf-8"
set encoding=utf-8
"Enable characters to demarcate the kind of whitespace used"
set listchars=extends:»,precedes:«,tab:·\ ,trail:◀
set list
"Use 16 colours in the terminal"
set t_Co=16
"Use fancy symbols in powerline"
let g:Powerline_symbols = "fancy"
"Ignore some file endings while expanding"
set wildignore=*.o,*~,*.pyc,.git
"New windows appear to the right of or below the existing window"
set splitright
set splitbelow
"Set timeout values for mappings and keycodes"
set timeoutlen=500
set ttimeoutlen=100
"Set foldmethod to fold all lines of the same or higher indent level..."
set foldmethod=indent
"... but keep it turned off at startup"
set foldlevelstart=99
"Set modeline, particularly for syntax-highlighting certain files correctly"
set modeline
"Treat all sh files as bash scripts for syntax highlighting"
let g:is_bash = 1
"Treat all tex files as latex files"
let g:tex_flavor = "latex"
"Enable Powerline (assumes powerline has been installed using"
"     pip3 install --user powerline-status"
set rtp+=$HOME/.local/lib/python3.10/site-packages/powerline/bindings/vim
"Always show statusline"
set laststatus=2
"Change leader for vimtex insert mode mappings from '`' to '#'"
let g:vimtex_imaps_leader = "#"
"For fixing italics fonts within screen"
set term=xterm-256color

"Switch on syntax highlighting"
syntax on
colorscheme vader
"Detect filetype automatically and indent depending upon filetype"
filetype plugin indent on

": is too painful to press"
nnoremap <Space> :
vnoremap <Space> :

"To give backspace a more useful purpose"
nnoremap <silent> <Backspace> i<Backspace><C-o>:stopinsert<CR>

"For copying and pasting text through the system clipboard"
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P

"For moving up and down through wrapped lines"
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
vnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> <Up> gk
vnoremap <silent> <Down> gj
inoremap <silent> <C-o>k <C-o>gk
inoremap <silent> <C-o>j <C-o>gj
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj

"Make Ctrl+Left and Ctrl+Right move through words"
nnoremap <silent> <C-Left> b
nnoremap <silent> <C-Right> w
"For moving to the end of a word, backwards
nnoremap <silent> E ge

"Make H and L act like Home and End"
nnoremap H ^
nnoremap L $

"For swapping parameters in a comma-separated list with Alt + Left or Right"
"Note: We use nmap and imap because we *want* the redefined versions"
nmap <silent> <M-Left> <,
nmap <silent> <M-Right> >,
imap <silent> <M-Left> <C-o><,
imap <silent> <M-Right> <C-o>>,

"For jumping to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"For when you forget to open a file with sudo"
noremap <Leader>ww :w !sudo tee % >/dev/null<CR>

"For toggling the NERDTree window on and off"
map <Leader>] :NERDTreeMirror<CR>:NERDTreeToggle<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

"For toggling the Gundo window on and off"
map <silent> <Leader>[ :GundoToggle<CR>

"For toggling the git gutter on and off"
nnoremap <silent> <Leader>gg :GitGutterToggle<CR>

"For toggling the taglist window on and off"
"map <silent> <Leader><CR> :TlistToggle<CR>"
"Search for the tags file recursing outwards until you hit root (/)"
set tags=tags;/

"For opening a new file quickly in a new tab from normal mode"
nmap t :tabe 

"For un-highlighting after a search is done"
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

"For centering the screen on the search-find"
nnoremap n nzz
nnoremap N Nzz

"For keeping the selection on after indenting/un-indenting in visual mode"
vnoremap <silent> > >gv
vnoremap <silent> < <gv

"For moving tabs left and right"
"Use Alt+PgUp for left and Alt+PgDn for right"
nnoremap <silent> [5;3~
			\ :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> [6;3~
			\ :execute 'silent! tabmove ' . tabpagenr()<CR>
inoremap <silent> [5;3~
			\ <ESC>:execute 'silent! tabmove ' . (tabpagenr()-2)<CR>a
inoremap <silent> [6;3~
			\ <ESC>:execute 'silent! tabmove ' . tabpagenr()<CR>a

"For converting long constants into upper case quickly (after typing them)"
inoremap <C-u> <Esc>viwUea

"For clearing a line without deleting it in normal mode"
"- The escape helps exit visual mode when the line is already empty"
nnoremap dl 0v$hx<Esc>

"For attaching an indented line to the end of the previous line (with a space)"
nnoremap d<Backspace> ^d0i<Backspace> <Esc>

"For opening vimrc quickly"
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
"For loading vimrc changes quickly"
nmap <Leader>sv :source $MYVIMRC<CR><C-l>

"For preventing an incomplete comment from deleting text"
nnoremap <Leader>c <Nop>
vnoremap <Leader>c <Nop>

"For moving up and down faster, but not as fast as PgUp and PgDn"
nmap <C-k> 3k
nmap <C-j> 3j
vmap <C-k> 3k
vmap <C-j> 3j
nmap <C-Up> 3k
nmap <C-Down> 3j
imap <C-Up> <C-o>3k
imap <C-Down> <C-o>3j
vmap <C-Up> 3k
vmap <C-Down> 3j

"For moving the screen, but not the cursor..."
nnoremap <S-Up> <C-y>
nnoremap <S-Down> <C-e>
vnoremap <S-Up> <C-y>
vnoremap <S-Down> <C-e>
inoremap <S-Up> <C-o><C-y>
inoremap <S-Down> <C-o><C-e>

"For there are things faster than <C-w>w"
nnoremap <C-w><C-Left>  <C-w><Left>
nnoremap <C-w><C-Right> <C-w><Right>
nnoremap <C-w><C-Up>    <C-w><Up>
nnoremap <C-w><C-Down>  <C-w><Down>

"For disabling accidental Ctrl-Home and Ctrl-End presses"
nnoremap <C-End> <Nop>
nnoremap <C-Home> <Nop>
inoremap <C-End> <Nop>
inoremap <C-Home> <Nop>
vnoremap <C-End> <Nop>
vnoremap <C-Home> <Nop>

"For switching paste mode on/off during insert"
"Otherwise, indents will cascade"
set pastetoggle=<F4>

"For figuring out the highlight group under the cursor"
map <Leader>h
			\ :echo
			\ "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
			\ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
			\ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
			\       . ">"
			\ <CR>

"For autoformatting a C/C++ file using astyle"
nnoremap <silent> <Leader>fc
			\ :%!astyle --mode=c --style=k/r --indent=tab --pad-oper
			\           --unpad-paren --delete-empty-lines --align-pointer=name
			\           --break-blocks<CR>
"For autoformatting a python file using autopep8"
nnoremap <silent> <Leader>fy :%!autopep8 -<CR>

"For autoformatting a file using par with a width of 79 characters"
set formatprg="par 79"
"For formatting the whole document"
nnoremap <Leader>fa ggVGgq
"For formatting the current paragraph"
nnoremap <Leader>fp mzvapgq`z

"For removing trailing spaces"
nnoremap <silent> <Leader>fs :%s/\s\+$//g<CR>

"For spellcheck"
nnoremap <silent> <Leader>ss
			\ :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <Leader>sa
			\ :setlocal nospell<CR>

"For exceeding 80 characters in a line"
if exists('+colorcolumn')
	set colorcolumn=100
else
	au BufWinEnter * let w:m2=matchadd('ColorColumn', '\%>80v.\+', -1)
endif

"For adding file templates from .vim/templates"
au BufNewFile * :silent! exec ":0r ".$HOME."/.vim/templates/template.".&ft.
			\ " | :normal Gdd$"

"Creating an autocommand group to ensure this runs after loading plugins and"
"loading the colorscheme"
augroup CustomHighlights
	autocmd!

	"For setting the search match colour appropriately"
	autocmd colorscheme,VimEnter * highlight Search ctermbg=011 ctermfg=000

	"For inverting colours on selection"
	autocmd colorscheme,VimEnter * highlight clear Visual
	autocmd colorscheme,VimEnter * highlight Visual cterm=reverse

	"For setting the git gutter colors properly"
	autocmd colorscheme,VimEnter * highlight clear SignColumn
	autocmd colorscheme,VimEnter * highlight GitGutterAdd ctermfg=2 ctermbg=0
	autocmd colorscheme,VimEnter * highlight GitGutterChange ctermfg=3 ctermbg=0
	autocmd colorscheme,VimEnter * highlight GitGutterDelete ctermfg=1 ctermbg=0
	autocmd colorscheme,VimEnter * highlight GitGutterChangeDelete ctermfg=3 ctermbg=0
augroup END

"LaTeX shortcuts"
nnoremap <silent> <Leader>le i\begin{enumerate}\end{enumerate}O\item 
nnoremap <silent> <Leader>li i\begin{itemize}\end{itemize}O\item 
nnoremap <silent> <Leader>lin i\begin{itemize}[nosep]\end{itemize}O\item 
nnoremap <silent> <Leader>li- i\begin{itemize}[label=--]\end{itemize}O\item 
nnoremap <silent> <Leader>li-n i\begin{itemize}[label=--,nosep]\end{itemize}O\item 
nnoremap <silent> <Leader>lq i\begin{equation}\end{equation}O
nnoremap <silent> <Leader>l8q i\begin{equation*}\end{equation*}O
nnoremap <silent> <Leader>la i\begin{align}\end{align}O
nnoremap <silent> <Leader>l8a i\begin{align*}\end{align*}O
nnoremap <silent> <Leader>ls viw<ESC>`>a}<ESC>hviw<ESC>`<i\emph{<ESC>
vnoremap <silent> <Leader>ls <ESC>`<i\emph{<ESC>`>6la}<ESC>
nnoremap <silent> <Leader>lb viw<ESC>`>a}<ESC>hviw<ESC>`<i\textbf{<ESC>
vnoremap <silent> <Leader>lb <ESC>`<i\textbf{<ESC>`>8la}<ESC>
"Format Google Scholar citations"
vmap <silent> <Leader>fc :s/^  /\t/g<CR>gv:s/=/ = /g<CR>gv:s/[{}]/"/g<CR><C-l>
nmap <silent> <Leader>lt ^f{lgUl/\d<CR>4lgUl<C-l>

"Shortcut for nonumber"
nnoremap <Leader>n :set number<CR>
nnoremap <Leader>nn :set nonumber<CR>
