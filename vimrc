" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen - easy vim scripts managment (GK)
" should be placed before 'filetype plugin indent on' command
" *************************************
 call pathogen#infect()
""call pathogen#runtime_append_all_bundles() " from vimcasts.org
call pathogen#helptags()

" allow backspacing over everything in insert mode
""set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" 256 colors in Vim (terminal must be preconfigured too!)
" http://vim.wikia.com/wiki/256_colors_in_vim
" *****************
set t_Co=256

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd FileType tex setlocal ts=4 sts=2 sw=2 expandtab  " TODO: tex.vim???

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
""if !exists(":DiffOrig")
""  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
""		  \ | wincmd p | diffthis
""endif

" -----------------------------------------------------------------------------
"  			GK changes
" -----------------------------------------------------------------------------
set modelines=0		" prevents security exploits

" Searching / Moving
" ******************
set ignorecase
set smartcase
" clear out search to get rid of distracting highlighting once found
nnoremap <leader><space> :noh<cr>

filetype plugin on

" Tab settings
" ************
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Fold settings (from stackoverflow)
" *************
set foldmethod=indent
set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf

" detect filetypes
" ****************
" detect CrossTex files as BibTex
""au BufRead,BufNewFile *.xtx	set filetype=bib
""au BufRead,BufNewFile *.mac	set filetype=apdl


" commenting
" **********
" let g:EnhCommentifyUseAltKeys = 'Yes'
" let g:EnhCommentifyPretty = 'Yes'
""let g:EnhCommentifyUserBindings = 'yes'
""runtime plugin/Omap.vim 
""Omap <silent> <unique> <leader>c <Plug>Commentj
""Omap <silent> <unique> <leader>u <Plug>DeCommentj

" latexsuite
" **********
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
""set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
""set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
""filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
""let g:tex_flavor='latex'

" inverse searches in LaTeX
" *************************
" http://vim.wikia.com/wiki/Vim_can_interact_with_xdvi
"":map \ld :execute '!xdvi -editor "vim --servername 'v:servername' --remote +\%l \%f" -sourceposition ' . line(".") . expand("%") . " '" . expand(Tex_GetMainFileName(':r')) . ".dvi' >/dev/null&" <CR><CR>

" MoinMoin syntax highlighting - commented due to move to filetype.vim
" ****************************
"au! BufRead,BufNewFile *.moin
"    \ if getline(1) =~ '^@@ Syntax: 1\.5$' | setf moin1_5
"    \ | else | setf moin1_6 | endif

" MiniBufExplorer
" ***************
""let g:miniBufExplMapWindowNavVim = 1
""let g:miniBufExplMapWindowNavArrows = 1
""let g:miniBufExplMapCTabSwitchBufs = 1
""let g:miniBufExplModSelTarget = 1
""let g:miniBufExplorerAutoUpdate = 0  " dont get in the IPython way <C-s>

" Exuberant CTAGS
" ***************
""let Tlist_Ctags_Cmd='/usr/bin/ctags'

" Python code completion (omni)
" *****************************
""autocmd FileType python set omnifunc=pythoncomplete#Complete


" Status line
" ***********
set wildmenu        " :help wildmenu
set laststatus=2    " status line is always shown
" show file name, ext, mode, position in file, buffer number
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

" Show invisibles (tabstops, EOL)
" *******************************
set listchars=tab:▸\ ,eol:¬     " `:set list` to toggle

