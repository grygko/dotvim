
" -----------------------------------------------------------------------------
"  			GK changes
" -----------------------------------------------------------------------------
" commenting
" **********
" let g:EnhCommentifyUseAltKeys = 'Yes'
" let g:EnhCommentifyPretty = 'Yes'
"let g:EnhCommentifyUserBindings = 'yes'
"runtime plugin/Omap.vim 
"Omap <silent> <unique> <leader>c <Plug>Commentj
"Omap <silent> <unique> <leader>u <Plug>DeCommentj


"  display
"  ********
if has("gui_running")
    if has("gui_gtk2")
"        set gfn=Lucida\ Sans\ Typewriter\ 10
"        set gfn=Monaco\ 10
"        set gfn=Inconsolata\ 12
"        set gfn=Monospace\ 10
        set gfn=Droid\ Sans\ Mono\ 10
"        set gfn=Courier\ 10\ Pitch\ 11
    elseif has("gui_win32")
        set gfn=Consolas:h11:cANSI
    endif

    colorscheme mayansmoke
    set guioptions-=T   " hide tools panel
    set guioptions-=m   " hide menu
    set lines=50
    set columns=80
endif
