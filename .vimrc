" .vimrc
" Configuration Bépo
"
" Goulven Pouchard
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set number
set title
set ruler
set visualbell
set noerrorbells
set lbr!
set mouse=a
set mousehide
set ttyfast
set wrap
set textwidth=80
set history=20

" Délai de basculement du mode insertion/normal
set timeoutlen=1000	"pour les touches remappées
set ttimeoutlen=0	"pour les codes de touches (touche Échap)

" Recherche
set ignorecase
set smartcase
set incsearch
set hlsearch

" Indentation
set autoindent
set smartindent
set cindent

" Lecture/enregistrement
set autoread
set autowrite
autocmd FocusLost,TabLeave * :wall

if has("autocmd")
	autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Coloration syntaxique
if has("syntax")
	syntax on
endif

" Affichage
set showcmd
set showmode
set shortmess+=I
set cursorline

" set showmatch

" Folding
set foldcolumn=3
set foldmethod=manual


" Correction orthographique
"set spelllang=en,fr
"set spell
"set spellsuggest=5

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Chargement du gestionnaire de plugin vundle
" https://github.com/gmarik/Vundle.git ~/.vim/bundle/Vundle.vim
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'raimondi/delimitmate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'andrewradev/splitjoin.vim'


call vundle#end()
filetype plugin indent on
filetype plugin on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1 
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" The NERD Tree
let g:NERDTreeMapOpenVSplit='v'

" The NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDAltDelims_java=1
let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/'}}
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespaces=1

" vim-airline
" Attention installer le paquet fonts-powerline
" ou bien git clone https://github.com/powerline/fonts.git --depth=1
" cd fonts && ./install.sh
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='hybridline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

"Ultisnips
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-r>"
let g:UltiSnipsJumpBackwardTrigger="<c-t>"

" vim-surround
" Remappage des touches 'opérateur'
"
" d devient e
" c devient x
" y devient c
"
" if exists("g:surround_bepo_mappings")
"   nmap es  <Plug>Dsurround
"   nmap xs  <Plug>Csurround
"   nmap xS  <Plug>CSurround
"   nmap cs  <Plug>Ysurround
"   nmap cS  <Plug>YSurround
"   nmap css <Plug>Yssurround
"   nmap cSs <Plug>YSsurround
"   xmap <leader>S   <Plug>VSurround
"   xmap <leader>Sg  <Plug>VgSurround
" endif
"
" Puis on désactive le mappage de surround par défaut
" et on ajoute le mappage leader_s
let g:surround_no_mappings=1
let g:surround_bepo_mappings=1

" CtrlP
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip	" Unix
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe	" Windows
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.tmp
set wildignore+=*/Nas/*

let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore={
			\ 'dir':	'\v[\/]\.(git|hg|svn)$',
			\ 'file':	'\v\.(exe|so|dll)$',
			\ 'link':	'some_bad_symbolic_links',
			\}

" Indent Guides
let g:indent_guides_enable_on_vim_startup=0

" DelimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_smart_quotes='\w\%#'

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au syntax * RainbowParenthesesLoadRound
au syntax * RainbowParenthesesLoadSquare
au syntax * RainbowParenthesesLoadBraces

" Theme gruvbox 
if has ('gui_running')
	set guifont=D2Coding\ for\ Powerline\ 14
	colorscheme gruvbox
	set background=dark
else
	set background=light
	colorscheme PaperColor
endif

"" mapping du clavier bépo->qwerty en mode normal
""
" n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
" i  Insert mode map. Defined using ':imap' or ':inoremap'.
" v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
" x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
" s  Select mode map. Defined using ':smap' or ':snoremap'.
" c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
" o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
" 
" <Space>  Normal, Visual and operator pending mode map. Defined using
"          ':map' or ':noremap'.
" !  Insert and command-line mode map. Defined using 'map!' or
" 'noremap!'.
 
noremap b ^
onoremap b ^
noremap é b
onoremap é b
noremap p w
onoremap p w
noremap o o
noremap è <c-w>
noremap èè <c-w><c-w>
noremap èd <c-w><Up>
noremap ès <c-w><Down>
noremap èt <c-w><Left>
noremap èr <c-w><Right>
noremap ^ p
noremap v v
noremap d k
onoremap d k
noremap l $
onoremap l $
noremap j t
onoremap j t
noremap z /
onoremap z /
noremap w K
noremap a a
noremap u e
onoremap u e
noremap i i
noremap e d
noremap \ \
noremap , ~
noremap c y
noremap t h
onoremap t h
noremap s j
onoremap s j
noremap r l
onoremap r l
noremap n u
noremap m @
noremap à r
noremap y s
noremap x c
noremap . .
noremap k X
noremap ' x
noremap q z
noremap qq zz
noremap gg gg
noremap ga g~
noremap h ;
onoremap h ;
noremap f f
onoremap f f

noremap B \|
onoremap B \|
noremap É B
onoremap É B
noremap P W
onoremap P W
noremap O O
noremap È J
noremap \! P
noremap D <c-u>
onoremap D <c-u>
noremap L %
noremap J T
onoremap J T
noremap Z ?
onoremap Z ?
noremap A A
noremap U E
onoremap U E
noremap I I
noremap E D
noremap ; =
noremap C Y
noremap T N
onoremap T N
noremap S <c-d>
onoremap S <c-d>
noremap R n
onoremap R n
noremap N U
noremap M '
onoremap M '
noremap À R
noremap Y S
noremap X C
noremap K <
noremap ? >
noremap Q Z
noremap G G
onoremap G G
noremap H ,
onoremap H ,
noremap F F
onoremap F F
noremap Ç "

" remappage text ojects
onoremap ap aw
onoremap aP aW
onoremap ip iw
onoremap iP iW
onoremap a) as
onoremap i) is
onoremap aj ap
onoremap ij ip

noremap " !		" Filre externe
noremap « -		" Ligne précédente
onoremap « -
noremap » +		" Ligne suivante
onoremap » +
noremap @ q		" Enregist. macro
noremap + <c-a>		" Incrémenter
noremap - <c-x>		" Décrémenter
noremap / {		" Début paragraphe
onoremap / {
noremap * }		" Fin paragraphe
onoremap * }
noremap = -		" DDP du dessous

" touches Crtl
noremap <c-i> H		" Haut écran
noremap <c-u> M		" Milieu écran
noremap <c-a> L		" Bas écran
noremap <c-o> <c-b>	" Page dessus
noremap <c-e> <c-f>	" Page dessous
noremap <c-l> <c-y>	" Défil. ligne au dessous
noremap <c-j> <c-e>	" Défil. ligne au dessus
noremap <c-c> <c-]>	" Ctags identifiant
noremap <c-f> <c-g>	" Info curseur
noremap <c-q> #		" Id tag précédent
noremap <c-h> *		" Id tag suivant
noremap <c-n> &		" Refaire
noremap <c-b> m		" Définir marque
noremap <c-m> `		" Marque précédente
noremap <c-s> :w<CR>	" Enregistrer
noremap <c-k> Q		" Ex mode
noremap <c-x> <c-c>	" Normal/cancel

let mapleader="ç"

" extensions ^ du bépo
noremap ô :NERDTreeToggle<CR>
noremap î :IndentGuidesToggle<CR>
noremap û :UltiSnipsEdit<CR>
noremap ê :RainbowParenthesesToggle<CR>

" mappages avec Leader
nmap <leader>t :TagbarToggle<CR>

" plugin vim-Repeat
nmap . <Plug>(RepeatDot)
nmap n <Plug>(RepeatUndo)
nmap N <Plug>(RepeatUndoLine)

" Procédure de remapage des touches Henkan et Muhenkan sur Typematrix en bépo.
" créer le fichier .xmodmaprc dans le répertoire utilisateur
" Y mettre les lignes:
" 
" keycode 100 = Escape
" keycode 97 = ccedilla
" keycode 102 = ccedilla
"
" Le keycode 97 est là pour replacer le ç lorsque le typematrix est en mode
" japonais (fn+F3), le ç est mappé en touche <leader> de vim et est disponible 
" sur les deux cotés du clavier.
"
" Faire charger par le script .config/autoload/*.desktop la commande:
" /usr/bin/xmodmap /home/<rep_utilisateur>/.xmodmaprc .
