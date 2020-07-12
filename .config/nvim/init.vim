set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
let g:lsp_settings_servers_dir=$HOME.'/.local/share/vim-lsp-settings/servers'
tnoremap <silent> <C-[> <C-\><C-n>

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

augroup filetypedetect
  au! BufRead,BufNewFile *.tsx setfiletype typescript
augroup END
