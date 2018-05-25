" 起動時に最大化して起動する
"au GUIEnter * simalt ~x
set lines=25	" 行数
set columns=110	 " 列数

" フォントと文字サイズ
set guifont=VL_Gothic:h10:w5

" デフォルト文字
if has('win64') || has('win32')
	let vimdirectory= 'C:\\Program Files(x86)\\vim81-kaoriya-win64\\vim81\\'
	execute printf('source %sdelmenu.vim',s:vimdirectory)
	set langmenu=ja_jp.utf-8
	execute printf('source %smenu.vim',s:vimdirectory)
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

function s:setColorscheme(colorsh)
	try
		colorscheme colorsh
		return v:true
	catch
		colorscheme default
		return v:false
	endtry
endfunction
