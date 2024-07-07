set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

scriptencoding utf-8

let s:base_dir	=	$HOME
let s:vimrcs_dir=	$HOME . '/vimrcs'
let s:backup_dir=	s:base_dir . "/vim-backup"
let s:myvim_dir	=	s:vimrcs_dir . "/myvim"

if has("win32")
	set termencoding=char " terminalencoding
	let &termencoding= &encoding
endif



let g:evenf = "T"

if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

"####autocmd####
augroup vimrc
	autocmd!
	autocmd FileType * setlocal formatoptions-=ro
	autocmd FileType py :IndentGuidesToggle<CR>
augroup END

"####python####
" set pythondll=C:\python27\python27.dll
set pythonthreedll=C:\python36\python36.dll

"####表示設定####
" set previewheight=22
set belloff=all
set laststatus=2
set scrolloff=5
set noshowmode
set number
set title
set showmatch
set matchtime=1
syntax on " syntax highlight
set synmaxcol=256
set smartindent
set tabstop=4
set backspace=2
set shiftwidth=4
set cindent
set wildmenu
set mouse=a
set cursorline
set ambiwidth=double
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set noerrorbells
set novisualbell

if has('win32') || has('win64')
    set clipboard=unnamed " share clipboard
endif
if has('unix')
    set clipboard=unnamedplus " share clipboard
endif
set expandtab

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
set tags=tags

let g:Align_xstrlen = 3

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <A-g> <Plug>(openbrowser-smart-search)
vmap <A-g> <Plug>(openbrowser-smart-search)

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
nnoremap == gg=G''
" 誤爆防止
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap q: <Nop>
nnoremap <TAB> >>
nnoremap <S-TAB> <<
"これやるとIMEが半角になるが許容する
inoremap <S-TAB> <C-o><<
"dallでクリップボードを変えずに全削除
nnoremap dall ggVG"0d
nnoremap <SPACE>p "0p
nnoremap <SPACE>P "0P
nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap gb gT
nnoremap <Space>n :set relativenumber!<CR>
nnoremap<silent> <SPACE><SPACE> :TComment<CR>
" nnoremap s <Nop>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap ss <C-w>w
nnoremap sw <C-w>w
nnoremap <S-Right> $
nnoremap <S-Left> ^
nnoremap <S-Up> gg
nnoremap <S-Down> G
vnoremap <S-Right> $
vnoremap <S-Left> ^
vnoremap <S-Up> gg
vnoremap <S-Down> G
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
nnoremap <Space>* mMg<C-]>
nnoremap <Space>; mM:GtagsCursor<CR>
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
" typo修正
cnoremap qw wq
cnoremap mru Mru
cnoremap tlist Tlist

cnoremap ?? WatchdogsRun

command! -nargs=+ R :call Refuct(<f-args>)
command! -nargs=+ Qr :QuickRun <f-args>
command! Mru :Unite -vertical -winwidth=40 file_mru
command! Oline :Unite -vertical -winwidth=40 outline

command -nargs=1 MyLineSearch let @m=<q-args> | call search('^\s*'. @m)
command -nargs=1 MyLineBackSearch let @m=<q-args> | call search('^\s*'. @m, 'b')
nnoremap <Space>f :MyLineSearch<Space>
nnoremap <Space>F :MyLineBackSearch<Space>

" カレントディレクトリを遡ってtagsファイルを見つけようとする
function! s:findTagsFile() abort
	let l:tagspath='tags' " タグパス
	let l:beforepath='' " 直前のフルパス
	while glob(l:tagspath)==''
		if l:beforepath==fnamemodify(l:tagspath,':p')
			return 1 " 結局見つからなかった場合
		endif
		let l:beforepath=fnamemodify(l:tagspath,':p')
		let l:tagspath='../' . l:tagspath
	endwhile
	" 見つかった場合
	execute 'set tags=' . fnamemodify(l:tagspath,':p')
	return 0
endfunction

call s:findTagsFile()

augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}
