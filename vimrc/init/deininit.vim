" deinパス設定
let s:dein_dir = $HOME . '/' " directory for installing
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim' "<-固定
" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim本体をランタイムパスに追加
 if &runtimepath !~# '/dein.vim'
     execute 'set runtimepath^=' . s:dein_repo_dir
 endif
" 必須
call dein#begin(s:dein_dir)

" Plugins
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimfiler')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tyru/open-browser.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('t9md/vim-quickhl')
call dein#add('Shougo/vimproc',{
			\ 'build' : {
			\ 'windows' : 'make -f make_mingw64.mak',
			\ 'cygwin' : 'make -f make_cygwin.mak',
			\ 'mac' : 'make -f make_mac.mak',
			\ 'unix' : 'make -f make_unix.mak',
			\ },
			\ })
call dein#add('mattn/webapi-vim')
call dein#add('itchyny/lightline.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('justmao945/vim-clang')
call dein#add('kana/vim-altr')
call dein#add('mattn/emmet-vim')
call dein#add('tpope/vim-surround')
call dein#add('cohama/lexima.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('severin-lemaignan/vim-minimap')

" カラースキーマ集
call dein#add('jpo/vim-railscasts-theme')
call dein#add('altercation/vim-colors-solarized')
call dein#add('cocopon/iceberg.vim')
call dein#add('tomasr/molokai')

" 構文色付けプラグイン
call dein#add('hail2u/vim-css3-syntax')
call dein#add('Mizuchi/STL-Syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('PProvost/vim-ps1')
call dein#add('othree/html5.vim')
call dein#add('gorodinskiy/vim-coloresque')
call dein#add('cespare/vim-toml')

" 必須
call dein#end()
call dein#save_state()
filetype plugin indent on
syntax enable

" プラグインのインストール
if has('vim_starting') && dein#check_install()
	echo 'uninstalled plugin is exist. execute :call dein#install()'
  " call dein#install()
endif

" 各種プラグイン設定
set runtimepath^=expand('C:\~/.vim/bundle/taglist_46/plugin')
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'php': 'C:\~\.vim\myvim\dictionaries\php.dict',
			\ 'c': 'C:\~\.vim\myvim\dictionaries\C.dict',
			\ 'cpp': 'C:\~\.vim\myvim\dictionaries\CPP.dict,C:\~\.vim\myvim\dictionaries\C.dict',
			\ 'tex': 'C:\~\.vim\myvim\dictionaries\TEX.dict',
			\ }
let g:neocomplete#enable_at_startup=1
let g:neosnippet#snippets_directory='C:\~\.vim\bundle\neosnippet-snippets\neosnippets'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:user_emmet_leader_key='<c-t>'
let g:tcommentMapLeader1='<C-_>'
let NERDTreeIgnore=['.[oa]$','.(exe|obj)','.(so)$','.(tgz|gz|zip)$']
