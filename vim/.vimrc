" vim-plug
source ~/.vim/vim-plug.vim

" ======================================================================================
" Standard vim options
" ======================================================================================
filetype plugin indent on
" Search
set incsearch                           " Incremental searching
set ignorecase                          " Ignore case in searching
set smartcase                           " Don't ignore case if capital letters present

" Tabs and spaces
set expandtab                           " Insert space characters when tabs are used
set shiftwidth=4                        " Indentation using '>'
set tabstop=4                           " Indentation from tab key
set autoindent                          " Indentation on subsequent lines
set selection=exclusive                 " More intuitive selection in visual mode

set backspace=indent,eol,start          " Enable Standard backspacing
set sidescrolloff=3                     " Keep at least 3 lines left/right
set scrolloff=3                         " Keep at least 3 lines above/below
set splitright                          " Open split right, not left
set splitbelow                          " Open split below, not above

set wildmenu                            " Enable command line completion
set wildmode=longest:full,list:full     " First tab -> longest common string, afterwards -> cycles alt
set noshowmode                          " Hide default mode

set mouse=a                             " Enable mouse
set number                              " Line numbers

set directory^=$HOME/.vim/swapfiles//   " Place all swp files in the same location
set updatetime=300                      " After 300 ms, swap file will be saved to disk
set autoread                            " Auto reload files changed outside of vim

" Colorscheme
colorscheme gruvbox                     " Gruvbox colorscheme
set background=dark                     " Use dark version of colorscheme
let g:gruvbox_contrast='hard'           " Set text contrast to hard

" statusline
let g:airline#extensions#tabline#enabled = 1                    " Allow top status bar
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'    " Remove part of the status line
let g:airline_section_z = '%3p%% %3l/%L:%3v'                    " Format status line

" ======================================================================================
" Mappings
" ======================================================================================
let mapleader = "\<Space>"
" Save and close file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>c :close<CR>
" Pane split and navigation
nnoremap <Leader>t :split 
nnoremap <Leader>v :vsplit 
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
" Return to previous location
nnoremap <Leader>g <C-O>
" Make a pane full screen
nnoremap tt :tab split<CR>
" Navigation
nnoremap f w
nnoremap s b
nnoremap ; $
nnoremap y ^
" Leave insert mode quickly
inoremap jk <Esc>
" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap ) )<del>
inoremap [ []<left>
inoremap ] ]<del>
inoremap {; {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O

" Autocompletes
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Search and Replace in visual mode
function! Get_Visual_Selection()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    let selection = join(lines,'\n')
    let change = input('Change ' . selection . ' to: ')
    execute ":%s/".selection."/".change."/c"
endfunction
vnoremap <Leader>r :call Get_Visual_Selection()<CR>

" Reopens vim in the same location
if has("autocmd")
    au BufReadPost * if line("'\'") > 0 && line("'\'") <= line("$")
        \| exe "normal! g'\"" | endif
endif
