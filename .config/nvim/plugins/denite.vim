set termguicolors
set pumblend=30

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

nnoremap [denite] <Nop>
nmap <C-d> [denite]
nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite -start-filter<CR>
nnoremap <silent> [denite]r :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]p :<C-u>Denite file/rec -start-filter<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]h :bp<CR>
nnoremap <silent> [denite]l :bn<CR>

autocmd FileType denite set winblend=30
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'vsplitswitch')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter set winblend=30
autocmd FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
  imap <silent><buffer> <CR> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <C-[> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-[> denite#do_map('quit')
endfunction

call denite#custom#var('grep', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden'])
call denite#custom#var('grep', 'default_opts', [])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
call denite#custom#option('_', {
  \ 'split': 'floating',
  \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
  \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
  \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
  \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2)
  \ })
