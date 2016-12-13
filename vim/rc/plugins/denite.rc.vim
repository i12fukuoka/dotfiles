" 未設定

if executable('ag')
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogropu', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'default_opts', ['--folow', '--no-group', '--no-color'])
endif

