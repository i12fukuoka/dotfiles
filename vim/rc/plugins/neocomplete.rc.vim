let g:neocomplete#disable_auto_complete = 0

let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#auto_complete_delay  30

let g:neocomplete#enable_fuzzy_completion = 1

let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#min_keyword_length = 3

" let g:neocomplete#enable_auto_select = 1

let g:neocomplete#enable_auto_delimiter = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" let g:marching_enable_neocomplete = 1

let g:neocomplete#sources#omni#input_patterns.python =
        \ '[^. *\t]\.\w*\|\h\w*

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns._ = '\h\w*'
" let g:neocomplete#keyword_patterns.rst =

call neocomplete#custom#source('look', 'min_pattern_length', 4)
" call neocomplete#custom#source('_', 'converters',

" Plugin key-mappings.
inoremap <expr><C-g>    neocomplete#undo_completion()
inoremap <expr><C-l>    neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
