" 常に補完候補を表示する
let g:deoplete#enable_at_startup = 1

" タブで補完候補を選択できるようにする
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"
