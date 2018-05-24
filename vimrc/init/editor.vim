let s:base_dir=$HOME
let s:global_base_dir= $HOME . '/.vim'
let s:backup_dir= s:base_dir . "/vim-backup"
let s:myvim_dir= s:global_base_dir . "/myvim"
set termencoding=char

if has("win32")
	let &termencoding= &encoding
endif

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac


let g:evenf = "T"

if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

"####表示設定####
" set previewheight=22
set number
set title
set showmatch
set matchtime=1
syntax on
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
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

set clipboard+=unnamed

"####検索設定####
set ignorecase
set smartcase
set noincsearch

"####外部設定####
"set noundofile
"set nobackup
"set noswapfile

let &undodir  = s:backup_dir
let &backupdir= s:backup_dir
let &directory= s:backup_dir
let &viminfo = ( s:backup_dir . "\.viminfo")
set tags=tags
autocmd FileType php :set dictionary=C:\~\.vim\myvim\php.dict
autocmd FileType c :set dictionary=C:\~\.vim\myvim\C.dict
autocmd FileType cpp :set dictionary=C:\~\.vim\myvim\C.dict
autocmd FileType cpp :set dictionary=C:\~\.vim\myvim\CPP.dict
autocmd FileType tex :set dictionary=C:\~\.vim\myvim\TEX.dict
autocmd FileType java :set dictionary=C:\~\.vim\myvim\j2se14.dict

let g:Align_xstrlen = 3

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
 
"####自作スクリプト読込####
execute printf('source %s\bundle\taglist_46\plugin\taglist.vim',s:global_base_dir)
" source expand(s:myvim_dir . "\myvim\cd.vim")
" source s:global_base_dir . "\bundle\taglist_46\plugin\taglist.vim"
" source s:myvim_dir . "\matchit.vim"
let b:match_words = "<if>:<end if>"

"####書式設定####
"javaの標準クラスのハイライト（色付けのこと）と、余分な空白に色付け
let java_highlight_all=1
let java_highlight_debug=1
let java_space_errors=1
let java_highlight_functions=1
au FileType java compiler javac

"####キーマッピング設定####
"ggで先頭へ行き、=Gでインデントし、''でさっきの位置へ戻る
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
inoremap <ESC> <ESC>:set iminsert=0<CR>
nmap <F2> <Plug>(altr-forward)
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>s :Oline<CR>
"挿入モード中の矢印は末端まで移動にする
imap <S-Right> <ESC>$i<RIGHT>
imap <S-Left> <ESC>^i<LEFT>
imap <S-Up> <ESC>ggi
imap <S-Down> <ESC>Gi
imap <C-b> <ESC>:Puw<CR>i
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)
xmap <silent><SPACE><SPACE> gc

"######コマンドライン#######
cnoremap qw wq
cnoremap mru Mru
cnoremap tlist Tlist

cnoremap ?p !C:\xampp\php\php.exe -l "%"
cnoremap ?? WatchdogsRun

command! -nargs=+ R :call Refuct(<f-args>)
command! -nargs=+ Qr :QuickRun <f-args>
command! Mru :Unite -vertical -winwidth=40 file_mru
command! Oline :Unite -vertical -winwidth=40 outline
