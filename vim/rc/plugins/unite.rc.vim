" 未設定

function! s:unite_my_settings() abort
    nnoremap <buffer><expr><C-j> unite#do_action('vsplit')
    nnoremap <buffer><expr><C-j> unite#do_action('vsplit')

    imap <buffer>jj <Plug>(unite_insert_leave)
    nmap <buffer>x <Plug>(unite_quick_match_jump)

    nnoremap <silent><buffer><ESC><ESC> q
    inoremap <silent><buffer><ESC><ESC> <ESC>q

    call unite#custom#default_action('file', 'tabopen')
endfunction

autocmd MyAutoCmd FileType unite call s:unite_my_settings()

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup'
    let g:unite_source_grep_recursive_opt = ''
endif

