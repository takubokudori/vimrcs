let g:Align_xstrlen = 3
if exists('*webapi#json#decode') && exists('*lexima#add_rule')
	let g:user_emmet_settings = webapi#json#decode(join(readfile(expand($HOME . '/vimrcs/myvim/snippets.json')),"\n"))
	call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
	call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})
endif
