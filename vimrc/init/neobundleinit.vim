" neobundleパス設定

" vim8未満はdeinが使えないのでこちらで対応
if v:version < 800
	set nocompatible
	filetype plugin indent on
	function! s:getDictionaryList(dict_dir)
		" dictionariesからdictファイルを列挙
		let flist=expand(a:dict_dir.'*.dict')
		let filelist=split(flist,"\n")
		let dict={}
		for fpath in filelist
			let ext=tolower(fnamemodify(fpath,":t:r")) " ファイル名のみ取得
			let dict[ext]=fpath
		endfor
		return dict
	endfunction

	let s:base_vimrcs_dir = $HOME . '/vimrcs/'
	let s:dict_dir = s:base_vimrcs_dir . 'myvim/dictionaries/'
	let s:snippets_dir = s:base_vimrcs_dir . 'myvim/snippets/'
	if has('unix') || has('mac')
		let s:neobundle_dir = $HOME.'/.vim/bundle/' " unix
	else
		let s:neobundle_dir = 'C:\vim/bundle/' " windows
	endif

	let s:neobundle_putting_dir = s:neobundle_dir . 'neobundle.vim'
	" neobundle本体の存在チェックとインストール
	if !isdirectory(s:neobundle_putting_dir)
		execute '!git clone https://github.com/Shougo/neobundle.vim' shellescape(s:neobundle_putting_dir)
	endif

	" neobundle本体をランタイムパスに追加
	if &runtimepath !~# '/neobundle'
		execute 'set runtimepath^=' . s:neobundle_putting_dir
	endif

	call neobundle#begin(expand(s:neobundle_dir))
	NeoBundleFetch 'Shougo/neobundle.vim'

	" add Plugins
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/unite-outline'
	NeoBundle 'Shougo/neocomplete.vim'
	NeoBundle 'Shougo/neosnippet.vim'
	NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundle 'Shougo/vimfiler'
	NeoBundle 'nathanaelkane/vim-indent-guides'
	NeoBundle 'tyru/open-browser.vim'
	NeoBundle 'Shougo/neomru.vim'
	NeoBundle 't9md/vim-quickhl'
	NeoBundle 'Shougo/vimproc.vim',{'build':'make'}
	NeoBundle 'mattn/webapi-vim'
	NeoBundle 'itchyny/lightline.vim'
	NeoBundle 'tomtom/tcomment_vim'
	NeoBundle 'justmao945/vim-clang'
	NeoBundle 'kana/vim-altr'
	NeoBundle 'mattn/emmet-vim'
	NeoBundle 'tpope/vim-surround'
	NeoBundle 'cohama/lexima.vim'
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'easymotion/vim-easymotion'
	NeoBundle 'takubokudori/camelcasemotion'
	NeoBundle 'tpope/vim-abolish'

	" カラースキーマ
	NeoBundle 'jpo/vim-railscasts-theme'
	NeoBundle 'altercation/vim-colors-solarized'
	NeoBundle 'cocopon/iceberg.vim'
	NeoBundle 'tomasr/molokai'

	" 構文色付けプラグイン
	NeoBundle 'hail2u/vim-css3-syntax'
	NeoBundle 'Mizuchi/STL-Syntax'
	NeoBundle 'jelera/vim-javascript-syntax'
	NeoBundle 'PProvost/vim-ps1'
	NeoBundle 'othree/html5.vim'
	NeoBundle 'gorodinskiy/vim-coloresque'
	NeoBundle 'cespare/vim-toml'

	call neobundle#end()
	filetype plugin indent on
	syntax enable

	NeoBundleCheck
	" 各種プラグイン設定
	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_overwrite_completefunc = 1
	let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	let s:dict_dir=$HOME . '/vimrcs/myvim/dictionaries/' 
	let g:dictionarylist=s:getDictionaryList(s:dict_dir)
	let g:neocomplete#sources#dictionary#dictionaries = g:dictionarylist

	let g:neocomplete#enable_at_startup=1
	let g:neosnippet#snippets_directory= s:neobundle_dir . '/neosnippet-snippets/neosnippets/,' . s:snippets_dir
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	let g:user_emmet_leader_key='<c-t>'
	let g:tcomment_mapleader1='<C-_>'
	let NERDTreeIgnore=['.[oa]$','.(exe|obj)','.(so)$','.(tgz|gz|zip)$']
endif
