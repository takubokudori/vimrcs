" 起動時に最大化して起動する
"au GUIEnter * simalt ~x
set lines=25	" 行数
set columns=110	 " 列数

" フォントと文字サイズ
set guifont=VL_Gothic:h10:w5

" デフォルト文字
if has('win64') || has('win32')
	let vimdirectory= 'C:\\vim80-kaoriya-win64\\vim80\\'
	source s:vimdirectory . 'delmenu.vim'
	set langmenu=ja_jp.utf-8
	source s:vimdirectory . 'menu.vim'
endif

" カラースキーム

if !setColorscheme(monokai)
	setColorscheme(railscasts)
endif

" colorscheme
autocmd FileType tex :call setColorscheme(railscasts)

"set guioptions-=T " invisible toolbar
"set guioptions-=m " invisible menu
"set guioptions-=r " invisible right scrollbar
"set guioptions-=R
"set guioptions-=l " invisible left scrollbar
"set guioptions-=L

" IME の on/off に合わせてカーソルの色を変える
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Green gui=NONE
    hi CursorIM guifg=NONE guibg=Red gui=NONE
endif

function setColorscheme(colorsh)
	try
		colorscheme colorsh
		return v:true
	catch
		colorscheme default
		return v:false
	endtry
endfunction
