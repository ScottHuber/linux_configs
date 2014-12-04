execute pathogen#infect()
syntax on
filetype plugin on

" Don't want file type indentation
"filetype plugin indent on
filetype indent off

set cpoptions-=u

set tabstop=2
set shiftwidth=2
set autoindent
set number
set noexpandtab

set backspace=2

set undofile
set undodir=$HOME/.vim/undo
set undolevels=10000
set undoreload=100000

set synmaxcol=12000

colorscheme monokai

runtime macros/matchit.vim

if &term == "xterm-256color"
	set t_Co=256
endif

if has("gui_running")
	set columns=229
	set lines=40
	winpos 66 329
endif

:imap jk <Esc>
":nmap <silent> <C-K> :silent !grep -rHn <cword> /var/www_vl_tt/application/*<CR>:redraw!<CR>
:nmap <C-K> :grep -rHn '\<<cword>\>' /var/www_vl_tt/application/*

au BufNewFile,BufRead *.as set filetype=actionscript

"cygwin - set cursor to block
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" for replacing the current word under ther cursor with something else
" globally in file.  "<C-r><C-w>" puts current word under cursor in command line
:nmap <C-_> :%s/\<<C-r><C-w>\>//g<Left><Left>

"color 237 == #3a3a3a
:hi Search ctermbg=237

" setup status line {
	set laststatus=2                             		" always show statusbar  
	set statusline=  
	set statusline+=%-10.3n\                     		" buffer number  
	set statusline+=%f\                          		" filename   
	set statusline+=%h%m%r%w\                    		" status flags  
	set statusline+=\<%{strlen(&ft)?&ft:'none'}>\  	" file type  
	set statusline+=%=                           		" right align remainder  
	set statusline+=0x%-8B                       		" character value  
	set statusline+=%-14(%l,%c%V%)               		" line, character  
	set statusline+=%<%P                         		" file position   
" }

" show column # in status bar
set ruler

" put yanks in windows clipboard, take Ctrl-C from windows
set clipboard=unnamed

" F3 toggles cursor location horizontal + vertical lines
nnoremap <F3> :set cuc! cuc?<CR>:set cul! cul?<CR>

" Regular commands notes
" 
" Search replace, use value from match in result
" :s/\(\d\)/\1/
"
" Lookahead: Matches the preceding atom with zero width.  
"	Example - :s/\(foo\)\(bar\)\@=/\1zzz " turns xfoobarx into xfoozzzbarx
" \@=
"
"	Lookbehind: Matches with zero width if the preceding atom matches just before what follows.
" \@<=
"	Example - :s/\(foo\)\@<=\(bar\)/zzz\2 " turns xfoobarx into xfoozzzbarx
"
"	Modifications taking motions
"	d - delete leave in normal mode
"	c - delete leave in insert mode
"	y - yank leave in normal mode
"
"	Motions:
"	f - got to following character, leave cursor on character
"	t - got to following character, leave cursor left of character
"
"	Highligh cursor line and column
" :set cul cuc
"	:set nocul nocuc
"
"	Jump to enclosing scope
"	]}
"	[{
"
"	Resize windows (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
"	Ctrl-w = " equalize dimensions
"	Ctrl-w _ " maximize window
"	Ctrl-w + " resize height increase
"	Ctrl-w - " resize height decrease
"	Ctrl-w > " resize width increase
"	Ctrl-w < " resize width decrease
"
"	Moving the cursor
"	http://vim.wikia.com/wiki/All_the_right_moves
