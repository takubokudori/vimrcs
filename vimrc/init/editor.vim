let s:base_dir	=	$HOME
let s:vimrcs_dir=	$HOME . '/vimrcs'
let s:backup_dir=	s:base_dir . "/vim-backup"
let s:myvim_dir	=	s:vimrcs_dir . "/myvim"

if has("win32")
	set termencoding=char " terminalencoding
	let &termencoding= &encoding
endif

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac


let g:evenf = "T"

if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

"####python####
" set pythondll=C:\python27\python27.dll
set pythonthreedll=C:\python36\python36.dll

"####表示設定####
" set previewheight=22
set laststatus=2
set scrolloff=5
set noshowmode
set number
set title
set showmatch
set matchtime=1
syntax on " syntax highlight
set smartindent
set tabstop=2
set shiftwidth=2
set cindent
set wildmenu
autocmd FileType * setlocal formatoptions-=ro
autocmd FileType py :IndentGuidesToggle<CR>
set mouse=a
set cursorline
set ambiwidth=double
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

set clipboard+=unnamed " share clipboard

"####検索設定####
set ignorecase
set smartcase
set noincsearch
set hlsearch

"####バックアップ設定####
"set noundofile
"set nobackup
"set noswapfile

let &undodir  = s:backup_dir
let &backupdir= s:backup_dir
let &directory= s:backup_dir
let &viminfo = ( s:backup_dir . "/.viminfo")
set tags=tags

let g:Align_xstrlen = 3

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"####自作スクリプト読込####
let b:match_words = "<if>:<end if>"

"####書式設定####
"javaの標準クラスのハイライト（色付けのこと）と、余分な空白に色付け
let java_highlight_all=1
let java_highlight_debug=1
let java_space_errors=1
let java_highlight_functions=1
au FileType java compiler javac

"####キーマッピング設定####
"dall で全削除
nnoremap == gg=G''
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap dall ggVG"0d
nnoremap <SPACE>p "0p
nnoremap <SPACE>P "0P
nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap q: <Nop>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap gb gT
nnoremap <Space>n :set relativenumber!<CR>
nnoremap<silent> <SPACE><SPACE> :TComment<CR>
" nnoremap sh <C-w>h
" nnoremap sj <C-w>j
" nnoremap s <Nop>
" nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap ss <C-w>w
nnoremap sw <C-w>w
nnoremap <S-Right> $
nnoremap <S-Left> ^
nnoremap <S-Up> gg
nnoremap <S-Down> G
" タグジャンプ先が複数ある場合に選択できるようにする
" DLは https://github.com/universal-ctags/ctags
nnoremap <C-]> g<C-]>
if has('win32') || has('win64')
	inoremap <ESC> <ESC>:set iminsert=0<CR>
endif
if has('unix')
	command Sudo :w !sudo tee %
endif
nmap <F2> <Plug>(altr-forward)
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>s :Oline<CR>
nnoremap <Space>* m'g<C-]>
nnoremap <Space>; m':GtagsCursor<CR>
"挿入モード中の矢印は末端まで移動にする
imap <S-Right> <ESC>$i<RIGHT>
imap <S-Left> <ESC>^i<LEFT>
imap <S-Up> <ESC>ggi
imap <S-Down> <ESC>Gi
imap <C-b> <ESC>:Puw<CR>i
if has('win32') || has('win64')
	imap <C-s> <Plug>(neosnippet_expand_or_jump)
	smap <C-s> <Plug>(neosnippet_expand_or_jump)
	xmap <C-s> <Plug>(neosnippet_expand_target)
else
	imap <C-e> <Plug>(neosnippet_expand_or_jump)
	smap <C-e> <Plug>(neosnippet_expand_or_jump)
	xmap <C-e> <Plug>(neosnippet_expand_target)
endif
xmap <silent><SPACE><SPACE> gc

"######コマンドライン#######
cnoremap qw wq " typo
cnoremap mru Mru
cnoremap tlist Tlist

cnoremap ?? WatchdogsRun

command! -nargs=+ R :call Refuct(<f-args>)
command! -nargs=+ Qr :QuickRun <f-args>
command! Mru :Unite -vertical -winwidth=40 file_mru
command! Oline :Unite -vertical -winwidth=40 outline

" カレントディレクトリを遡ってtagsファイルを見つけようとする
function! s:findTagsFile() abort
	let l:tagspath='tags' " タグパス
	let l:beforepath='' " 直前のフルパス
	while glob(l:tagspath)==''
		if l:beforepath==fnamemodify(l:tagspath,':p')
			return 0 " 結局見つからなかった場合
		endif
		let l:beforepath=fnamemodify(l:tagspath,':p')
		let l:tagspath='../' . l:tagspath
	endwhile
	" 見つかった場合
	execute 'set tags=' . fnamemodify(l:tagspath,':p')
	return 1
endfunction

call s:findTagsFile()
