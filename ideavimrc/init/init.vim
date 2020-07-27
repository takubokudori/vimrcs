let mapleader= ","

"####表示設定####
set laststatus=2
set noshowmode
set title
set showmatch
set showmode
set matchtime=1
" set tabstop=2
" set shiftwidth=2
set scrolloff=5
set clipboard+=unnamed " share clipboard

"####検索設定####
set ignorecase
set smartcase
set noincsearch
set hlsearch

set iminsert=2

"####キーマッピング設定####
"dall で全削除
nnoremap == :action ReformatCode<CR>
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
" wをuppercamelとかにも対応させる
nnoremap w [w
nnoremap b [b
nnoremap [w w
nnoremap [b b
nnoremap <Space>n :set relativenumber!<CR>
nnoremap <SPACE><SPACE> :action CommentByLineComment<CR>
nnoremap <SPACE>* mM:action GotoDeclaration<CR>
nnoremap <SPACE>; mM:action GotoDeclaration<CR>
nnoremap <SPACE>r :action RenameElement<CR>
nnoremap \r :action Run<CR>
nnoremap \d :action Debug<CR>
nnoremap \b :action Build<CR>
nnoremap \B :action BuildSolutionAction<CR>
nnoremap \ga :action Git.Add<CR>
nnoremap \gc :action Git.Commit<CR>
nnoremap \gf :action Git.Fetch<CR>
nnoremap \gp :action Git.Pull<CR>
nnoremap ,a :action GotoAction<CR>
nnoremap <F2> :action GotoRelated<CR>

nnoremap sl <C-w>l
nnoremap ss <C-w>w
nnoremap sw <C-w>w
nnoremap <S-Right> $
nnoremap <S-Left> ^
nnoremap <S-Up> gg
nnoremap <S-Down> G
"挿入モード中の矢印は末端まで移動にする
imap <S-Right> <ESC>$i<RIGHT>
imap <S-Left> <ESC>^i<LEFT>
imap <S-Up> <ESC>ggi
imap <S-Down> <ESC>Gi
imap <C-b> <ESC>:Puw<CR>i
vnoremap <SPACE><SPACE> <C-/>
set surround " vim-surround like(ideavim only)
