" Plugin key-mappings.
imap <C-d>     <Plug>(neosnippet_expand_or_jump)
smap <C-d>     <Plug>(neosnippet_expand_or_jump)
xmap <C-d>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/honza/vim-snippets/snippets'

".texはplaintex?として扱われてたみたいなのでlatexに変更
let g:tex_flavor='latex'
