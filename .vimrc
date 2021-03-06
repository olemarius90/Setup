""""""""""""""""""""""""""""
" vimrc by Ole Marius Hoel Rindal - omrindal
" Latest change 17..06.13

""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""
set nocompatible
set autoindent
set smartindent
set showmatch
set ruler
set incsearch
set number
set shiftwidth=4
set ignorecase
set encoding=utf-8
"set encoding=iso-8859-15
set showcmd
set splitright
colorscheme desert
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""
" Text,tab and indent related
"""""""""""""""""""""""""""
"Use spaces insted of tabs
set expandtab
set smarttab
"1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

"Linebreak on 100 characters
set lbr
set tw=100

"Auto indent
set ai
"Smart indent
set si
"Wrap lines
set wrap

""""""""""""""""""""""""""""
" Files, backups
""""""""""""""""""""""""""""
set noswapfile "I never use this
""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""
imap ii <esc>


"""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""
syntax enable
 
"If gvim 
if has("gui_running")
    "Sets black colorsheme
     colorscheme desert
     "Set background color
     set background=dark
     "Set font
     "set guifont=Andale\ Mono\ 9
     "Set initial size
     set lines=62
     set columns=84 
     set guioptions-=T
 endif

 """""""""""""""""""""""""""
 " For Cscope
 """""""""""""""""""""""""""
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-a' twice (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-a><C-a>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-a><C-a>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-a><C-a>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-a><C-a>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-a><C-a>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-a><C-a>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-a><C-a>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-a><C-a>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-a before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-a>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-a>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-a>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-a>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-a>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-a>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-a>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-a>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    " Setting up for tabular split
    " Hitting CTRL-x before the search type does a tabular edit
    nmap <C-x>s :tab scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-x>g :tab scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-x>c :tab scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-x>t :tab scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-x>e :tab scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-x>f :tab scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-x>i :tab scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-x>d :tab scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
