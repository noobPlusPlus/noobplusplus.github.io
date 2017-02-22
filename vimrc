"" Vundle 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'

Plugin 'Valloric/ListToggle'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'a.vim'

Plugin 'c.vim'

Plugin 'tacahiroy/ctrlp-funky'

Plugin 'majutsushi/tagbar'

Plugin 'Lokaltog/vim-powerline'

Plugin 'scrooloose/syntastic'

Plugin 'wakatime/vim-wakatime'

Plugin 'kevinw/pyflakes-vim'

Plugin 'Yggdroot/indentLine'

Plugin 'davidhalter/jedi-vim'

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

Plugin 'iamcco/markdown-preview.vim'

Plugin 'tomasr/molokai'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'powerline/fonts'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" Common config
set nu
set laststatus=2
autocmd InsertLeave * se nocul " 用浅色高亮当前行
autocmd InsertEnter * se cul " 用浅色高亮当前行
set autoread " 自动载入
set confirm
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab " 不用空格代替tab

" NERDTree config
" autocmd vimenter * NERDTree
nmap <F2> :NERDTreeToggle<Cr>
let NERDTreeIgnore=['\.pyc$']

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_poweline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

" ctrlp.vim config
set rtp+=~/.vim/bundle/ctrlp.vim

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " Linux
let g:ctrlp_custom_ignore = '\v[/\]\.(git|hg|svn)$'

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" ctrlp-funky config
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" tagbar config
nmap <F8> :TagbarToggle<Cr>

" Syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		" Nothing was closed, open syntastic errorlocation panel
		Errors
	endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>

nnoremap <silent> <F12> :lclose<CR>
nnoremap <silent> <C-F12> :lopen<CR>

" universal ctags config
map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
imap <F4> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file

let g:pyflakes_use_quickfix = 0

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" color config
syntax enable
set t_Co=256
" solarized color
"set background=dark
"colorscheme solarized

" molokai color
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" indent Line config
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_concealcursor = 'vc'


" set screen size
nmap <C-F9> :vertical resize-20<CR>
nmap <C-F10> :vertical resize+20<CR>

let g:tex_conceal = ""

" setting ycm
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_show_diagnostics_ui = 0 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

let g:ycm_auto_trigger = 1

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set clang
let g:clang_complete_auto = 0
let g:clang_use_library = 0
let g:clang_debug = 0
let g:clang_library_path = '/usr/lib/'
let g:clang_user_options='|| exit 0'
"

" Jedi setting
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"

"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" vim-markdown config
" Disable Folding
" Add the following line to your .vimrc to disable the folding configuration:
let g:vim_markdown_folding_disabled = 1

" Enable TOC window auto-fit
" Allow for the TOC window to auto-fit when it's possible for it to shrink. It
" never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Syntax Concealing
" Concealing is set for some syntax.
" For example, conceal [link text](link url) as just link text.
" To enable conceal use Vim's standard conceal configuration.
set conceallevel=2
" To disable conceal regardless of conceallevel setting, add the following to
" your .vimrc:
" let g:vim_markdown_conceal = 0
"
" Syntax extensions
" YAML Front Matter
" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1

" TOML Front Matter
" Highlight TOML front matter as used by Hugo.
" TOML syntax highlight requires vim-toml.
let g:vim_markdown_toml_frontmatter = 1

" JSON Front Matter
" Highlight JSON front matter as used by Hugo.
" JSON syntax highlight requires vim-json.
let g:vim_markdown_json_frontmatter = 1


" Markdown Preview Config
let g:mkdp_path_to_chrome = "firefox"
" path to the chrome or the command to open chrome(or other modern browsers)
map <silent> <F7> <Plug>MarkdownPreview
map <silent> <C-F7> <Plug>StopMarkdownPreview

" Set <F5> auto Compile and Running
map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'python'
		exec "!python %"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

