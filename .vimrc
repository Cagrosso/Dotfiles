execute pathogen#infect()

filetype plugin indent on   " required
syntax on

" Highlight matching search terms
set hlsearch

" Fix backspace to actually backspace...
set backspace=indent,eol,start

" Shows last command bottom right of vim
set showcmd

" Lightline status bar https://github.com/itchyny/lightline.vim
if !has('gui_running')
    set t_Co=256
endif

set laststatus=2

" Stop vim from saying INSERT, VISUAL, etc when lightline already does this
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineFilename()
  return expand('%:t') ==# '' ? '[No Name]' : expand('%:p:h:t') . '/' . expand('%:t') 
endfunction

" Lightline status bar https://github.com/itchyny/lightline.vim

" Line numbers
set number 
set relativenumber

" Keep at least this many lines above/below cursor
set scrolloff=1

" Change vim split to full block
set fillchars+=vert:█

" Allows you to switch from unsaved buffer w/o saving it first. Keeps undo
" history for multiple files. Keep swap files if computer crashes
" set hidden

" Highlight cursor line
set cursorline

" Colorscheme
if &term == "screen"
    set t_Co=256
endif
" colorscheme molokai
colorscheme maui
" colorscheme Monokai

" Set tab size
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set smartindent

" Set global replace by default
" set gdefault

" Set highlighting of matching parenthesis
set showmatch

" Map j and k to not skip wrapped lines
nnoremap j gj
nnoremap k gk

" Map <C-L>  (redraw screen) to also turn off search highlighting until next
" search
nnoremap <C-L> :nohl<CR><C-L>

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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

let g:syntastic_auto_jump = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" To switch just type export $REACTON

" jsbeautify
"
" ************ NEEDED FOR EXTJS *****************
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>

function CallJsBeautify() 
  let b:winview = winsaveview()
  call JsBeautify()
  call winrestview(b:winview)
  unlet b:winview
endfunc

autocmd BufWritePre *.js :call CallJsBeautify()

let g:syntastic_javascript_checkers=['jshint']
" ************ NEEDED FOR EXTJS *****************

" ************ NEEDED FOR REACT *****************
" let g:jsx_ext_required = 0

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_args = ['--fix']
" set autoread
" au VimEnter *.js au BufWritePost *.js checktime
" autocmd BufWritePost *.js :checktime
" ************ NEEDED FOR REACT *****************
  
let g:go_disable_autoinstall = 0
set rtp+=/home/vagrant/gocode/src/github.com/golang/lint/misc/vim

let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
let g:go_metalinter_enabled = ['golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['golint', 'errcheck']
let g:go_metalinter_autosave = 1

" youcompleteme configs
" https://github.com/Valloric/YouCompleteMe
" let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
