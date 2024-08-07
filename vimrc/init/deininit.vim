scriptencoding utf-8

" deinパス設定

if v:version >= 800
	function! s:getDictionaryList(dict_dir)
		" dictionariesからdictファイルを列挙
		let l:flist=expand(a:dict_dir.'*.dict')
		let l:filelist=split(flist,"\n")
		let l:dict={}
		for l:fpath in filelist
			let l:ext=tolower(fnamemodify(fpath,":t:r")) " ファイル名のみ取得
			let l:dict[ext]=fpath
		endfor
		return dict
	endfunction

	let s:base_vimrcs_dir = $HOME . '/vimrcs/'
	let s:dict_dir = s:base_vimrcs_dir . 'myvim/dictionaries/'
	let s:snippets_dir = s:base_vimrcs_dir . 'myvim/snippets/'
	if has('unix') || has('mac')
		let s:dein_dir = $HOME.'/.vim/dein/' " unix
	else
		let s:dein_dir = 'C:\vim/dein/' " windows
	endif

	let s:dein_putting_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'
	" dein.vim本体の存在チェックとインストール
	if !isdirectory(s:dein_putting_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_putting_dir)
	endif

	" dein.vim本体をランタイムパスに追加
	if &runtimepath !~# '/dein.vim'
		execute 'set runtimepath^=' . s:dein_putting_dir
	endif

	if dein#load_state(s:dein_dir)
		call dein#begin(s:dein_dir)

		" add Plugins
		call dein#add('Shougo/dein.vim')
		call dein#add('Shougo/neocomplete.vim')
		call dein#add('Shougo/neomru.vim')
		call dein#add('Shougo/neosnippet-snippets')
		call dein#add('Shougo/neosnippet.vim')
		call dein#add('Shougo/unite-outline')
		call dein#add('Shougo/unite.vim')
		call dein#add('Shougo/vimfiler')
		call dein#add('Shougo/vimproc.vim',{'build':'make'})
		call dein#add('cohama/lexima.vim')
		call dein#add('easymotion/vim-easymotion')
		call dein#add('itchyny/lightline.vim')
		call dein#add('justmao945/vim-clang')
		call dein#add('kana/vim-altr')
		call dein#add('lighttiger2505/gtags.vim')
		call dein#add('mattn/emmet-vim')
		call dein#add('mattn/webapi-vim')
        call dein#add('mattn/vim-lsp-settings')
		call dein#add('nathanaelkane/vim-indent-guides')
        call dein#add('prabirshrestha/vim-lsp')
		call dein#add('scrooloose/nerdtree')
		call dein#add('t9md/vim-quickhl')
		call dein#add('tomtom/tcomment_vim')
		call dein#add('tpope/vim-surround')
		call dein#add('tyru/open-browser.vim')
		" call dein#add('vim-scripts/taglist.vim')
		call dein#add('takubokudori/camelcasemotion')
		call dein#add('tpope/vim-abolish')
		call dein#add('previm/previm')

		" カラースキーマ
		call dein#add('altercation/vim-colors-solarized')
		call dein#add('cocopon/iceberg.vim')
		call dein#add('jpo/vim-railscasts-theme')
		call dein#add('takubokudori/vim-monokai')
		call dein#add('tomasr/molokai')

		" 構文色付けプラグイン
		call dein#add('Mizuchi/STL-Syntax')
		call dein#add('PProvost/vim-ps1')
		call dein#add('cespare/vim-toml')
		call dein#add('gorodinskiy/vim-coloresque')
		call dein#add('hail2u/vim-css3-syntax')
		call dein#add('jelera/vim-javascript-syntax')
		call dein#add('othree/html5.vim')

		call dein#end()
		call dein#save_state()
	endif
	filetype plugin indent on
	syntax enable

	" プラグインの編集後は必ずキャッシュを消す
	" call dein#clear_state()

	" プラグインのインストール
	if has('vim_starting') && dein#check_install()
		" echo 'uninstalled plugin is exist. execute :call dein#install()'
		call dein#install()
	endif

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
	let g:neosnippet#snippets_directory= s:dein_dir . '/repos/Shougo/neosnippet-snippets/neosnippets/,' . s:snippets_dir
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	let g:user_emmet_leader_key='<c-t>'
	let g:tcomment_mapleader1='<C-_>'
	let NERDTreeIgnore=['.[oa]$','.(exe|obj)','.(so)$','.(tgz|gz|zip)$']

    " lsp settings {{{
    let g:lsp_signs_error = {'text': 'ER'}
    let g:lsp_signs_warning = {'text': 'WA'}
    if !has('nvim')
      let g:lsp_diagnostics_float_cursor = 1
    endif
    let g:lsp_log_file = ''

    let g:lsp_settings = {
          \ 'efm-langserver': {
          \   'disabled': 0,
          \   'allowlist': ['markdown'],
          \  }
          \ }

    function! s:on_lsp_buffer_enabled() abort
      setlocal completeopt=menu
      setlocal omnifunc=lsp#complete
    endfunction

    augroup lsp_install
      au!
      au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END
    " }}}
endif

