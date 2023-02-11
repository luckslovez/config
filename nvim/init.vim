call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/nerdcommenter'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'sindrets/diffview.nvim'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
colorscheme tokyonight
lua require'nvim-tree'.setup {}
lua require'nvim-web-devicons'.setup {}
let mapleader=" "
nmap <leader>b :NvimTreeToggle<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nmap <leader>df :DiffviewOpen<CR>
nmap <leader>w :tabclose<cr>
set clipboard=unnamed
set undofile
