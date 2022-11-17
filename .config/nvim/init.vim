set nocompatible
filetype off
set guifont=Monaco:h25
set scrolloff=5

" 忽略大小写
set ignorecase
set clipboard=unnamed
" Do incremental searching.
set incsearch
" 显示相对行号
set relativenumber
" 显示行号
set number
" 显示当前模式
set showmode
" 搜索语法高亮
set hlsearch
" 关闭兼容vi
set nocompatible
" 开启语法高亮功能
syntax enable
set so=5
syntax on
set cursorline
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler

setlocal noswapfile " 不要生成swap文件
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set magic " 设置魔术
set matchtime=2 " 短暂跳转到匹配括号的时间
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为 1
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  "空格键开关折叠



" 插件管理
call plug#begin('~/.vim/plugged')
" Shorthand notation for plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 自动补全
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

let mapleader=";"

" ======== Markdown Preview configuration ======== 
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1  " auto close preview
let g:mkdp_browser = '/usr/bin/microsoft-edge-stable' " specify default browser to open preview page
let g:mkdp_echo_preview_url = 1 " echo preview page url in cmd, default:0
let g:mkdp_theme='dark'
let g:mkdp_port = '8583'
let g:mkdp_open_ip = '172.22.76.144'

nmap <leader>s <Plug>MarkdownPreview
nmap <leader>t <Plug>MarkdownPreviewStop
nmap <leader>p <Plug>MarkdownPreviewToggle

"======== NERDTree 设置 ========
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
map <F2> :NERDTreeToggle<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" ======= airline 配置 =======
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_theme = 'desertink'  " 主题
let g:airline_theme = 'papercolor'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0',
       \ '1': '1',
       \ '2': '2',
       \ '3': '3',
       \ '4': '4',
       \ '5': '5',
       \ '6': '6',
       \ '7': '7',
       \ '8': '8',
       \ '9': '9'
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>h <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>l <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>

" ========== coc扩展设置 ==========
" *coc-vimlsp*
	" document highlight
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
" coc背景色设置
colors ron
hi Pmenu ctermfg=7 ctermbg=100
hi PmenuSel ctermfg=white ctermbg=100
hi CocFloating ctermfg=black ctermbg=150
" coc自动补全按键设置
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
