" 起動時に最大化して起動する
"au GUIEnter * simalt ~x
set lines=25
set columns=110
" set lines=30
" set columns=120

" フォントと文字サイズ
set guifont=VL_Gothic:h10:w5
" set guifont=VL_Gothic:h9:w5

" デフォルト文字コード

source C:\Program Files (x86)\vim80-kaoriya-win64\vim80\delmenu.vim
set langmenu=ja_jp.utf-8
source C:\Program Files (x86)\vim80-kaoriya-win64\vim80\menu.vim

" カラースキーム

try
	colorscheme monokai
catch
	try
		colorscheme railscasts
	catch
		colorscheme default
	endtry
endtry

" colorscheme railscasts
autocmd FileType tex :colorscheme railscasts

" ツールバー非表示
"set guioptions-=T

" メニュー非表示
"set guioptions-=m

" 右スクロールバー非表示
"set guioptions-=r
"set guioptions-=R

" 左スクロールバー非表示
"set guioptions-=l
"set guioptions-=L

" IME の on/off に合わせてカーソルの色を変える
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Green gui=NONE
    hi CursorIM guifg=NONE guibg=Red gui=NONE
endif
