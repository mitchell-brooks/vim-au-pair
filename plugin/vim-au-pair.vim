" Remap opening chars to print closing chars
" with cursor in between
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
" Remap closing char to type through itself
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> > strpart(getline('.'), col('.')-1, 1) == ">" ? "\<Right>" : ">"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : '""<Left>'
inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "``<Left>"
" Remap backspace to delete both characters if bracket is empty / opening /
" closing chars are adjacent
inoremap <expr> <BS> DeletePair()

function! DeletePair()
	" dictionary of opening and corresponding closing chars
	let pairs = {"(":")",	"[":"]", "{":"}",	"<":">", "'":"'",	'"':'"', "`":"`",}
	" get character before cursor
	let prevChar = strpart(getline('.'), col('.')-2, 1)
	" get character after cursor
	let nextChar = strpart(getline('.'), col('.')-1, 1)

	if has_key(pairs, prevChar) && pairs[prevChar] == nextChar
			return "\<Right>\<BS>\<BS>"
		endif
	return "\<BS>"
endfunction

