## Leader
```
let mapleader=" "
```
## 'nvim-tree/nvim-tree.lua'
- Toggle file tree
```
nmap <leader>b :NvimTreeToggle<CR>
`<Ctrl-]>`        cd                  
`<Ctrl-v>`        vsplit             
`<Ctrl-x>`        split             
`<Ctrl-t>`        tabnew           
`a`               create             
`d`               remove            
`-`               dir_up           
```
## 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Uses 'nvim-lua/plenary.nvim'
```
nnoremap <leader>ff <cmd>Telescope find_files<cr>
```
## 'preservim/nerdcommenter'
- Select lines in visual mode, by default
```
<leader>c<space>
```
## 'sindrets/diffview.nvim'
Uses 'nvim-lua/plenary.nvim'
- Start current diff
```
nmap <leader>df :DiffviewOpen<CR>
```
## 'airblade/vim-gitgutter'
- Next hunk
```
]c <Plug>(GitGutterNextHunk)
```
- Previous hunk
```
[c <Plug>(GitGutterPrevHunk)
```
- Stage hunk
```
<Leader>hs
```
- Unstage hunk
```
<Leader>hu
```
#### 'nvim-tree/nvim-web-devicons'
>_optional, for file icons_
- Installed `brew install jetbrainsmono-nerd-font`
- Using it in `~/.config/alacritty/alacritty.yml`
```yml
font:
  size: 14.0
  normal:
    family: JetBrainsMono Nerd Font
    style: Regular
  bold:
    family: JetBrainsMono Nerd Font
    style: Bold
  italic:
    family: JetBrainsMono Nerd Font
    style: Italic
  bold_italic:
    family: JetBrainsMono Nerd Font
    style: Bold Italic
```

