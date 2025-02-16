let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" let data_dir = '~/.vim'
" echo data_dir
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin section for now
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/repeat.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'stsewd/fzf-checkout.vim'
Plug 'morhetz/gruvbox'
" Plug 'git@github.com:ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'lspcontainers/lspcontainers.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " For vsnip users.
  " I'm not sure what vsnip is except that it provides code snippets
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'mfussenegger/nvim-jdtls'
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'leoluz/nvim-dap-go'
  Plug 'mxsdev/nvim-dap-vscode-js'
  Plug 'theHamsta/nvim-dap-virtual-text'
  " Plug 'microsoft/vscode-js-debug', { 'opt': 'true', 'run': 'npm install --legacy-peer-deps && npm run compile' }
endif

" vue support
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Plug 'wakatime/vim-wakatime'
call plug#end()

set background=dark
colorscheme gruvbox

" start to my sets
set belloff=all
set shiftwidth=4
" set shiftwidth=2
set relativenumber
set numberwidth=5
set tabstop=2 softtabstop=2
set expandtab
" set noexpandtab
set smartindent
set nu
set noswapfile
set incsearch
set scrolloff=6
set completeopt=menuone,preview,noinsert,noselect
" set colorcolumn=80
set signcolumn=yes
set guifont=Monaco:h10
set nowrap
" trying something new, turning off highlights manually
" set nohlsearch
set hidden
" set wildignore=*/node_modules/*
set formatoptions-=t
set formatoptions-=o
set hlsearch
set ignorecase
set smartcase
set noeol
set nofixeol

" this is adjusting the comment string for sql files, default was incorrect
autocmd FileType sql setlocal commentstring=\-\-\ %s
" autocmd FileType tf setlocal commentstring=# %s
" autocmd FileType hcl setlocal commentstring=# %s
" autocmd FileType terraform setlocal commentstring=# %s
" autocmd FileType tfvars setlocal commentstring=# %s

" sets not using right now
"
" coloring for parens and 80-mark line
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
hi MatchParen cterm=bold ctermbg=none ctermfg=green

" lets
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25 

" general setup 
if executable('rg')
  let g:rg_derive_root='true'
endif

" insert-mode remaps
inoremap <BS> <ESC>:nohlsearch<CR>li
inoremap <leader>kj <Esc>
inoremap <leader>vc <Esc>
inoremap <C-s> <Esc>:w<CR>l
" move line all the way to left
" inoremap <leader>mb <Esc>0dw

" normal-mode remaps
nnoremap / /\v
nnoremap yY "+y$
nnoremap <BS> :nohlsearch<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>= <C-W>=
nnoremap <Leader>0 <C-W>_
nnoremap <Leader>+ :vertical resize +5<CR> 
nnoremap <Leader>- :vertical resize -5<CR> 
nnoremap <Leader>r :res 30<CR> 
nnoremap <leader>m :MaximizerToggle!<CR>
" nnoremap <leader>am :term<CR>
nnoremap <leader>am :sp<CR>:res 30<CR><C-W>j:term<CR>i
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>csv :vsp<CR><C-W>l:sp<CR>:e ~/cheatsheets/vim.md<CR><C-W>j:e ~/cheatsheets/intros/vim.txt<CR><C-W>k:vert res 60<CR>
nnoremap <leader>cst :vsp<CR><C-W>l:sp<CR>:e ~/cheatsheets/tmux.md<CR><C-W>j:e ~/cheatsheets/intros/tmux.txt<CR><C-W>k:vert res 60<CR>
nnoremap <leader>csm :vsp<CR><C-W>l:sp<CR>:e ~/cheatsheets/vimium.md<CR><C-W>j:e ~/cheatsheets/intros/vimium.txt<CR><C-W>k:vert res 60<CR>
nnoremap <leader>iv :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>nb :e ~/Desktop/onboard-help/README.md<CR>
nnoremap <leader>ne :NERDTreeToggle <CR>
nnoremap <leader>nf :NERDTreeFind <CR>
" I want to use the same keybinding to close the terminal, need fn for that?
nnoremap <leader>7 <C-^><CR>
nnoremap <Space> <nop>
nnoremap <leader><ENTER> i <Esc>r<ENTER>k<CR>
nnoremap <leader>sn :set relativenumber!<CR>
" nnoremap Q q
nnoremap <leader>ddp dap"+p
nnoremap ygy "+yy
nnoremap ygf gg0"+yG
nnoremap ygf gg0"+yG
" sometimes you gotta turn off the 80 column bar for the anime girl...
nnoremap <leader>ccy :set colorcolumn=80<CR>
nnoremap <leader>ccn :set colorcolumn=""<CR>

" this sets up the prompt for Emmet to put in html with emmet syntax
nnoremap <leader>em :Emmet 

if has('nvim')
  nnoremap <leader>sv :so ~/.config/nvim/init.vim<CR>
else
  nnoremap <leader>sv :so ~/.vimrc<CR>
endif

" vimspector v nvim-dap
if has('nvim')

  " nnoremap <Leader>de :call vimspector#Reset()<CR>
  nnoremap <Leader>dc :lua require'dap'.continue()<CR>
  nmap <Leader>dj :lua require'dap'.step_over()<CR>
  nmap <Leader>dl :lua require'dap'.step_into()<CR>
  nmap <Leader>dh :lua require'dap'.step_out()<CR>

  " reverse must be supported by adapter
  nmap <Leader>dsb :lua require'dap'.step_back()<CR>
  nmap <Leader>drc :lua require'dap'.reverse_continue()<CR>

  " these do not step? ...
  nmap <Leader>dgh :lua require'dap'.up()<CR>
  nmap <Leader>dgj :lua require'dap'.down()<CR>
  nmap <Leader>dgt :lua require'dap'.goto_()<CR>
  nmap <Leader>drt :lua require'dap'.run_to_cursor()<CR>
  nmap <Leader>dor :lua require'dapui'.open()<CR>
  nmap <Leader>dcr :lua require'dapui'.close()<CR>

  " :lua require'dap'.set_log_level('TRACE')<CR>

  nnoremap <Leader>db :lua require'dap'.toggle_breakpoint()<CR>
  nnoremap <Leader>dcb :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>
  nnoremap <Leader>dlm :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

  " for later
  " nnoremap <Leader>dlb :lua require'dap'.set_exception_breakpoints({filters}, {exceptionOptions})
  " nnoremap <Leader>dlb :lua
  " require'dap'.set_exception_breakpoints({\"raised\", \"uncaught\"})

  nnoremap <Leader>drl :lua require'dap'.run_last()<CR>
  nnoremap <Leader>ddc :lua require'dap'.disconnect()<CR>
  nnoremap <Leader>dlb :lua require'dap'.list_breakpoints()<CR>
  nnoremap <Leader>dT :lua require'dap'.clear_breakpoints()<CR>

else

  " vimspector setup
  let g:vimspector_enable_mappings = 'HUMAN'
  " packadd! vimspector

  " nnoremap <Leader>dd :call vimspector#Launch()<CR>
  " nnoremap <Leader>de :call vimspector#Reset()<CR>
  " nnoremap <Leader>dc :call vimspector#Continue()<CR>

  " nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
  " nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

  " nmap <Leader>dk <Plug>VimspectorRestart
  " nmap <Leader>dh <Plug>VimspectorStepOut
  " nmap <Leader>dl <Plug>VimspectorStepInto
  " nmap <Leader>dj <Plug>VimspectorStepOver

  " nmap <Leader>di <Plug>VimspectorBalloonEval
  " nmap <Leader>dx <Plug>VimspectorEval
  " nmap <Leader>dw <Plug>VimspectorWatch
  " nmap <Leader>do <Plug>VimspectorShowOutput
  " " nmap <Leader>dr <Plug>VimspectorRestart

endif

" current lsp setup, in VimL
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <C-k> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <C-j> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <Leader>qfs <cmd>lua vim.diagnostic.set_qflist()<CR>

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>

"
" Fugitive
" merge-conflict remaps
" go into merge-conflict window with dv
" writing this here, related

" these are native to vim
" using :diffget shortcuts
" dp keep change in current buffer 'put change'
" do keep change in other buffer 'get change'
" they accept a count 
nnoremap <leader>tl :diffget //3<CR> ]c
nnoremap <leader>th :diffget //2<CR> ]c
nnoremap <leader>ts :G<CR>
nnoremap <leader>tc :Git commit<CR>
nnoremap <leader>tk :Git checkout<CR>
nnoremap <leader>tw :Gwrite<CR>
nnoremap <leader>tP :Git -p push<CR>
nnoremap <leader>tG :Git -p push gitlab master<CR>
nnoremap <leader>tp :Git -p pull<CR>
nnoremap <leader>gl :Git log --oneline<CR>

" command-mode remaps
cnoremap <leader>vc <Esc><BS>

" visual-mode remaps
vnoremap <leader>vc <Esc><CR>

" terminal-mode remaps, local is <C-W>N or <C-\><C-n>, using first here
" just puts you into mode where vim commands recognized, still need :q!
tnoremap <leader>vc <C-\><C-n>
tnoremap <leader>am <C-\><C-n>:q!<Enter>

" for YCM Completer
" nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <silent> <Leader>g= :YcmCompleter Format<CR>"

" let nerdtree show hidden files
let NERDTreeShowHidden = 1

" maps I don't know what they do yet
" inoremap <C-f> <Esc><Esc>:BLines!<CR>
" map <C-g> <Esc><Esc>:BCommits!<CR>

" FZF remaps
" needed to change this to o, 
" other maps were expecting p,
" leading to delay
map <leader>o <Esc><Esc>:Files!<CR>
  
" primagen remaps
" nnoremap <leader>gc :GCheckout<CR>
" are we switching to this:

" helping nvim install automatically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

" plugin setup
if empty(glob('~/.vim/autoload/plug.vim'))
" if empty(glob(data_dir . '/autoload/plug.vim'))
  " silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.gihubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
        \ https://raw.gihubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" fzf settings still understanding
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } } " let $FZF_DEFAULT_OPTS
" let $FZF_DEFAULT_OPTS='--reverse'

" transparent background
hi! Normal guibg=NONE ctermbg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" remaps for toggling qf list
" nnoremap <C-k> :cnext<CR>
" nnoremap <C-j> :cprev<CR>

nnoremap <leader>qfc :cclose<CR>
nnoremap <leader>qfo :copen<CR>
nnoremap <leader>qfh :chistory<CR>

" think previous and next on this, even though I know that's not _technically_ correct
nnoremap <leader>qfp :colder<CR>
nnoremap <leader>qfn :cnewer<CR>

" try new keymap for navigating qf list
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" called args list b/c is originally all files passed to vim
" keymaps navigate args list
nnoremap <leader>ap :prev<CR>
nnoremap <leader>an :next<CR>

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" }}}