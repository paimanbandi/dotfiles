call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lifepillar/vim-gruvbox8'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'
call plug#end()

set path+=**
set mouse=a
let mapleader = " "
set rnu

inoremap hh <Esc>

""" gruvbox8
set background=dark
colorscheme gruvbox8

""" fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = []

""" coc
let g:coc_global_extensions = [
        \ 'coc-tsserver',
        \ 'coc-eslint',
        \ 'coc-json'
        \ ]

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <leader>a :CocDiagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

""" vimspector
nnoremap <Leader>vl :call vimspector#Launch()<CR>
nnoremap <Leader>vr :call vimspector#Reset()<CR>
nnoremap <Leader>vc :call vimspector#Continue()<CR>

nnoremap <Leader>vb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>vm :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>vt <Plug>VimspectorRestart
nmap <Leader>vo <Plug>VimspectorStepOut
nmap <Leader>vi <Plug>VimspectorStepInto
nmap <Leader>vv <Plug>VimspectorStepOver

""" netrw
let g:netrw_list_hide= '.*\.swp$,.DS_Store$'
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

""" floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

