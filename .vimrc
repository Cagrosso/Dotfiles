execute pathogen#infect()

filetype plugin indent on   " required
syntax on

" highlight matching search terms
set hlsearch

" fix backspace to actually backspace...
set backspace=indent,eol,start

" shows last command bottom right of vim
set showcmd

" line numbers
set number

" Allows you to switch from unsaved buffer w/o saving it first. Keeps undo
" history for multiple files. Keep swap files if computer crashes
set hidden

" highlight cursor line
set cursorline

" colorscheme
if &term == "screen"
    set t_Co=256
endif
colorscheme molokai

" set tab size
set tabstop=2
set shiftwidth=2
set expandtab

set autoindent

" Map j and k to not skip wrapped lines
nnoremap j gj
nnoremap k gk

" Map <C-L>  (redraw screen) to also turn off search highlighting until next
" search
nnoremap <C-L> :nohl<CR><C-L>

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" NERDCommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=[%f]

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" To switch just type export $REACTON
let reacton = $REACTON
if reacton == "false"

  " jsbeautify
  "
  " ************ NEEDED FOR EXTJS *****************
  autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()
  autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()
  autocmd BufWritePre *.js :call JsBeautify()

  let g:syntastic_javascript_checkers=['jshint']
  " ************ NEEDED FOR EXTJS *****************
  
else

  " ************ NEEDED FOR REACT *****************
  let g:jsx_ext_required = 0

  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_javascript_eslint_args = ['--fix']
  set autoread
  au VimEnter *.js au BufWritePost *.js checktime
  autocmd BufWritePost *.js :checktime
  " ************ NEEDED FOR REACT *****************
  
endif

" Golint stuff
function ClearQuickfixList()
    call setqflist([])
endfunction

let g:go_disable_autoinstall = 0
set rtp+=/home/vagrant/gocode/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go call ClearQuickfixList() | execute 'GoLint' | cwindow

let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
