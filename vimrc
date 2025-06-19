" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" FZF Integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP Support
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Git Features
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax highlighting (best option without treesitter)
Plug 'sheerun/vim-polyglot'

" Async make
Plug 'tpope/vim-dispatch'

call plug#end()

" FZF key bindings
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

" LSP settings
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Basic settings
syntax enable
set number
set relativenumber
set incsearch
set expandtab
set noswapfile
set nobackup
set nohlsearch
set nowrap
set scrolloff=4
set colorcolumn=80
set list
set tabstop=2
set shiftwidth=2
set softtabstop=2
set lcs=tab:>-,trail:-,space:.

set notermguicolors
hi NonText ctermfg=0
hi ColorColumn cterm=None ctermbg=0
hi String ctermfg=10
hi Identifier ctermfg=14
hi Function ctermfg=15
hi Type ctermfg=4
hi PreProc ctermfg=13
hi DiffAdd cterm=bold ctermfg=2 ctermbg=None
hi! link Added DiffAdd
hi DiffChange cterm=bold ctermfg=3 ctermbg=None
hi! link Changed DiffChange
hi DiffDelete cterm=bold ctermfg=1 ctermbg=None
hi! link Removed DiffDelete
hi Constant ctermfg=13
hi LineNr ctermfg=6
hi Statement ctermfg=11
hi Comment ctermfg=6
hi Special ctermfg=None
hi Pmenu None
