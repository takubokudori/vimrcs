scriptencoding utf-8

function s:setColorscheme(colorsh)
	try
		execute printf('colorscheme %s',a:colorsh)
		return v:true
	catch
		colorscheme default
		return v:false
	endtry
endfunction

function s:setFont(font)
	try
		execute printf('set guifont=%s:h10:w5',a:font)
		return v:true
	catch
		return v:false
	endtry
endfunction

" 起動時に最大化して起動する
"au GUIEnter * simalt ~x
set lines=25	" 行数
set columns=110	 " 列数


" フォントと文字サイズ

call s:setFont('VL_Gothic')

" デフォルト文字
if has('win64') || has('win32')
	let s:vimdirectory= 'C:\\Program Files (x86)\\vim-kaoriya-win64\\vim82\\'
	execute printf('source %sdelmenu.vim',s:vimdirectory)
	set langmenu=ja_jp.utf-8
	execute printf('source %smenu.vim',s:vimdirectory)
endif

" カラースキーム

if !s:setColorscheme('monokai')
	call s:setColorscheme('railscasts')
endif

" colorscheme
autocmd FileType tex :call s:setColorscheme('railscasts')

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
