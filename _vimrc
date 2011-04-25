let g:C_CodeSnippets = 'C:\Program Files\vim\vimfiles\codesnippets-c\'
let g:C_Template_Directory = 'C:\Program Files\vim\vimfiles\plugin\templates\'
let g:Tags_Exe = 'C:\Program Files\vim\vim72\tags.exe'
"let g:TagsParserNoPerlWarning = 1
":amenu ToolBar.Foo icon='C:\Program Files\vim\vimfiles\icons\info.pcx' :echo "\ce"<CR> 
":amenu ToolBar.BuiltIn23 :call C_CommentCode("a")<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"              PROJECT
""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""
"            EVENTS HENDLER
""""""""""""""""""""""""""""""""""""""""""""""
:autocmd BufWinEnter *.h    call OpenTags() "so tags.vim
:autocmd BufWinEnter *.c    call OpenTags() "LoadTags()
:autocmd BufWinEnter *.cpp  call OpenTags()
:autocmd BufWritePost *.h   call CreateCtagFile()
:autocmd BufWritePost *.c   call CreateCtagFile()
:autocmd BufWritePost *.cpp call CreateCtagFile()
:autocmd BufWritePost *.java  call CreateCtagFileJ()
:autocmd BufWinEnter *.java   call LoadTagsJ() 
""""""""""""""""""""""""""""""""""""""""""""""
"             BUF EXPLORER                       
""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerSplitHorzSize = 5
let g:bufExplorerOpenMode=1 "Open in new window.

""""""""""""""""""""""""""""""""""""""""""""""
"          MINI BUF EXPLORER
""""""""""""""""""""""""""""""""""""""""""""""
"let g:miniBufExplForceSyntaxEnable = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplMapWindowNavVim = 1

""""""""""""""""""""""""""""""""""""""""""""""
"            P 4 H E L P E R 
""""""""""""""""""""""""""""""""""""""""""""""
let g:p4hUserPsswd = ""
let g:p4hUserLogin = ""
let g:p4hCompName = ""

""""""""""""""""""""""""""""""""""""""""""""""
"             TAGS EXPLORER
""""""""""""""""""""""""""""""""""""""""""""""
"let TE_Ctags_Path = 'C:/utils/cygwin/bin/ctags.exe' 
"let TE_Use_Right_Window = 1
"let TE_WinWidth = 40 
"nnoremap <silent> <F8> :TagExplorer<CR>

""""""""""""""""""""""""""""""""""""""""""""""
"             TAGS LIST
""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'C:/utils/cygwin/bin/ctags.exe'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window =1
let Tlist_WinWidth = 40
nnoremap <silent> <F8> :TlistToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"             NERD TREE
""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeQuitOnOpen = 1
let NERDTreeWinPos = 'right'
nnoremap <silent> <F7> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"          SOURCE EXPLORER
""""""""""""""""""""""""""""""""""""""""""""""
let g:SrcExpl_winHeight =20 
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = [
         \ "__Tag_List__",
         \ "_NERD_tree_",
         \ "Source_Explorer"
     \ ]
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R --c++-kinds=+p --fields=+iaSK --extra=+q *.cpp *.c *.h *.bid"
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsKey = "<C-F12>"
nnoremap <silent> <F12> :SrcExplToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""
colorscheme denim "asu1dark  delek pyte
behave mswin
syntax on
""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""
if version >= 700
"   По умолчанию проверка орфографии выключена.
    setlocal spell spelllang=
    setlocal nospell
    function ChangeSpellLang()
        if &spelllang =~ "en_us"
            setlocal spell spelllang=ru
            echo "spelllang: ru"
        elseif &spelllang =~ "ru"
            setlocal spell spelllang=
            setlocal nospell
            echo "spelllang: off"
        else
            setlocal spell spelllang=en_us
            echo "spelllang: en"
        endif
    endfunc

    " map spell on/off for English/Russian
    map <F11> <Esc>:call ChangeSpellLang()<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"Maiximized Window
au GUIEnter * simalt ~x

""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
"autofold
" function for C-programming settings
"function Csettings()
"  syn region myFold start="{" end="}" transparent fold
  set foldmethod=syntax
  set foldminlines=3
  set foldcolumn=0 "2
"  set foldclose=all
"endfunction

"au Filetype c,cpp,h call Csettings()
""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   MENU
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.utf-8        :e ++enc=utf-8 <CR>

an 10.325 &File.&New\ Tab<Tab>:tabnew           :confirm tabnew<CR>

"menu Project.Native      :call NativeCode()<CR>
"menu Project.UiOne       :call UiOneCode()<CR>

"map <C-N> :call NativeCode()<CR><CR>
"map <C-U> :call UiOneCode()<CR><CR>

function NativeCode()
  set ts=4 
  set sw=4 
  function CreateCommonTags()
    echo "No Common Tags"
  endfunction
endfunction

"function UiOneCode()
  "set ts=4
  "set sw=4
  
  "nmap  <F5> <Esc>,bu<CR>
  "imap  <F5> <Esc>,bu<CR>
  "nmap  <C-F5> <Esc>,ru<CR>
  "imap  <C-F5> <Esc>,ru<CR>

  "function CreateCommonTags()
      "if(finddir("ui",".;") != '')    
          "execute "cd " . finddir("ui",".;") . "/.."         
          "let uip=getcwd()
          "let l:uiptags=uip . "\\tags.vim"
          "let l:uipcomtags=uip . "\\tags"
          "if(filereadable("tags"))            
          "else
              "silent ! ctags -R --c++-kinds=+p --fields=+iaSK --extra=+q ui\platform\ksdk\framework\*.cpp ui\platform\ksdk\framework\*.h brew\uione\trigplayer\inc\*.h
              "execute "sp " . l:uipcomtags
              "call ParsCtagFile(1)          
          "endif        
          "execute "so " . l:uiptags
          "execute "set tags+=" . l:uipcomtags
          "cd -
      "endif
  "endfunction
"endfunction

menu Plugin.Project.Start :Project<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
"                   AUTOLOAD
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"                   MAP SECTION
""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-F1> <Esc>:Project<CR>

map  <F2> <Esc>:w<CR>
imap <F2> <Esc>:w<CR>i

" Run of Buf Explorer
map <F3> <Esc><C-w>t<Esc>:HSBufExplorer<CR>
imap <F3> <Esc><C-w>t<Esc>:HSBufExplorer<CR>
map <C-F3> <Esc>:MarksBrowser<CR>
map <F4> <Esc>:TRegister<CR>

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" Load tags.vim file for highlight text.
"map <C-F6>  :so tags.vim<CR>

" Work with P4
map <C-F6> ,rv<CR><Esc>:e<CR><CR>
map <F6>   ,op<CR><Esc>:e<CR><CR>
"map <F5>   ,dh<CR><CR>
"map <C-F5> ,dc<CR><CR>

"map  <F7> <Esc>:!start ctags --recurse --c++-kinds=+p --fields=+iaSK --extra=+q<CR> 
"map <C-F7> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"map  <C-F7> <Esc>:!start ctags -R --fields=K <CR> 
"map  <C-F7> <Esc>:%!astyle -s3 -S -b --convert-tabs <CR> 
"map  <C-F7> <Esc>:%!astyle --convert-tabs --style=gnu<CR> 

"nmap <F8> :cclose<CR>
"map  <C-F8> :emenu Encoding.<TAB>

"map  <C-m> :call LoadTags()<CR> 
"<Esc><F7><C-F5><C-F6> 
":sp tags<CR>:%s/^\([^  :]*:\)\=\([^    ]*\).*/syntax keyword Functions \2/<CR>:wq! tags.vim<CR>/^<CR>:so tags.vim<CR><CR>
"
"map <C-F9> :call CreateMetrics()<CR>
map <C-F9> :call OpenTags()<CR>


map  <F10> <Esc>:call Kwbd(1)<CR> 
cmap <F10> <Esc>:call Kwbd(1)<CR> 
imap <F10> <Esc>:call Kwbd(1)<CR> 

map  <C-F10> <Esc>:tabc<CR> 
cmap <C-F10> <Esc>:tabc<CR> 
imap <C-F10> <Esc>:tabc<CR> 

nnoremap <C-]> g<C-]>
nnoremap <c-w>] <c-w>]:tab split<cr>gT:q<cr>gt

" Turn off seach highlight
:map <C-Down> :nohls<CR>

" Turn on seach highlight
:map <C-Up> :hls!<CR>

:map <C-b><C-s> ,bs<CR><CR>
:map <C-c><C-s> ,sc<CR><CR>
:map <C-b><C-t> ,bt<CR><CR>
:map <C-c><C-t> ,tc<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
"                   SET SECTION
"
""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
set autoread " remove msg W16
set buftype="" " remove msg W12 
set noeb "No ring the bell (beep or screen flash) for error messages
set novb

" установить keymap, чтобы по Ctrl+^ переключался на русский и обратно
set keymap=russian-jcukenwin 
" по умолчанию - латинская раскладка
set iminsert=0
" по умолчанию - латинская раскладка при поиске
set imsearch=0

"возможность использовать команды при русской раскладке
set langmap=Ж:,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ё`
"set langmap=йцу...ЙЦУ...;qwe...QWE...

" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
set iskeyword=@,48-57,_,192-255


"игнорировать прописные/строчные при поиске
"set ignorecase

" создавать .bak файлы (по умолчанию <oldname>~)
set backup 
set nocompatible

set guifont=Courier:h12
set et! "space instead of tab
set nu! "line numbers 
set autochdir " auto change work's dir
set bsdir=buffer " open file from current buffer folder  

call NativeCode() " UiOneCode()
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden
" Включить автоотступы
set autoindent

set scrolloff=4
set tw=90 " max length of lines
"set swb=useopen,usetab,split " if a buffer is already opened in one of the windows, Vim 
               " will jump to that window, instead of creating a new window. 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
set tags=./tags
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  FUNCTION SECTION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------- METRICS ---------------------------------------------
let g:Script_metrics = 'C:\p4_perforce1777_SMASLYAEV\developers\mgalkin\projects\6050\6050_metrics.pl'

function CreateMetrics()
  let name = inputdialog('Enter the Name of the Metric: ')
  if strlen(name) == 0
    silent execute ":! perl " . g:Script_metrics . " -f " . expand("%") . " -o temp.txt"
  else
    silent execute ":! perl " . g:Script_metrics . " -f " . expand("%") . " -m " . name . " -o temp.txt"             
  endif
  tabnew temp.txt
endfunction

" ----------------------- END metrics ------------------------------------------


"""""""""""""""""""""""""""""""""""""""
function LoadTags()
   silent call CreateCommonTags()
   if(filereadable("tags.vim"))
       silent so tags.vim
   else
       call CreateCtagFile()
   endif
   "if(filereadable("tags"))    
   "else
       "call LoadTags()
   "endif
  
endfunction

"""""""""""""""""""""""""""""""""""""""
function CreateCtagFile()
    let l:wd=getcwd()
    if filewritable(l:wd) == 2
        silent ! ctags -R --c++-kinds=+p --fields=+iaSK --extra=+q *.cpp *.c *.h *.bid
        call ParsCtagFile2(0)
        silent so tags.vim
    endif
endfunction

function ParsCtagFile2(comm)
  silent execute ":!\"" . g:Tags_Exe . "\" tags tags.vim" 
endfunction

function ParsCtagFile(comm)
    if(a:comm == 0)
        sp tags
    endif
    %s/.*\sprototype.*//e
    %s/^!.*//e
    "%s/\~\(\S*\>\).*\~.*\sfunction/syntax match Functions \/[\~]\1\//e
    "%s/^\(\S*\>\).*::.*\sfunction/syntax match Functions \/[:]\1\//e
    %s/^\(\S*\>\).*\sfunction.[ ]class.*//e
    "%s/^\(\S*\>\).*\sfunction\s.*/syntax keyword Functions \1/e
    %s/^\(\S*\>\).*\sfunction.*/syntax keyword Functions \1/e
    %s/^\(\S*\>\).*\sstruct.*/syntax keyword Struct \1/e
    %s/^\(\S*\>\).*\smacro.*/syntax keyword Macro \1/e
    %s/^\(\S*\>\).*\svariable.*/syntax keyword Variable \1/e
    %s/^.*::\(\S*\>\).*\smember\sclass.*/syntax keyword Member \1/e
    %s/^\(\S*\>\).*\smember\s.*/syntax keyword Member \1/e
    %s/^\(\S*\>\).*\sunion.*/syntax keyword Union \1/e
    %s/^\(\S*\>\).*\stypedef.*/syntax keyword Typedef \1/e
    %s/^\(\S*\>\).*\senumerator.*/syntax keyword Enumerator \1/e
    %s/^\(\S*\>\).*\senum.*/syntax keyword Enum \1/e
    %s/^\(\S*\>\).*\sdefine.*/syntax keyword Define \1/e
    %s/^\(\S*\>\).*\slabel.*/syntax keyword Label \1/e
    %s/^\(\S*\>\).*\sclass.*/syntax keyword Class \1/e
    w! tags.vim
    bdelete! tags 
endfunction

"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function Kwbd(kwbdStage)
    if(a:kwbdStage == 1)
        if(!buflisted(winbufnr(0)))
            bd!
            return
        endif
        let g:kwbdBufNum = bufnr("%")
        let g:kwbdWinNum = winnr()
        windo call Kwbd(2)
        execute "normal " . g:kwbdWinNum . ""
        let g:buflistedLeft = 0
        let g:bufFinalJump = 0
        let l:nBufs = bufnr("$")
        let l:i = 1
        while(l:i <= l:nBufs)
            if(l:i != g:kwbdBufNum)
                if(buflisted(l:i))
                    let g:buflistedLeft = g:buflistedLeft + 1
                else
                    if(bufexists(l:i) && !strlen(bufname(l:i)) && !g:bufFinalJump)
                        let g:bufFinalJump = l:i
                    endif
                endif
            endif
            let l:i = l:i + 1
        endwhile
        if(!g:buflistedLeft)
            if(g:bufFinalJump)
                windo if(buflisted(winbufnr(0))) | execute "b! " . g:bufFinalJump | endif
            else
                enew
                let l:newBuf = bufnr("%")
                windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
            endif
            execute "normal " . g:kwbdWinNum . ""
        endif
        if(buflisted(g:kwbdBufNum) || g:kwbdBufNum == bufnr("%"))
            execute "bd! " . g:kwbdBufNum
        endif
        if(!g:buflistedLeft)
            set buflisted
            set bufhidden=delete
            set buftype=nofile
            setlocal noswapfile
            normal athis is the scratch buffer
        endif
    else
        if(bufnr("%") == g:kwbdBufNum)
            let prevbufvar = bufnr("#")
            if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
                b #
            else
                bn
            endif
        endif
    endif
endfunction 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    T E S T
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"set wildmenu
"set wcm=<Tab>

"function! MyBalloonExpr()
"       return system("mueller ". v:beval_text)
"endfunction

"set bexpr=MyBalloonExpr()
"set ballooneval
"set balloondelay=100
"set noshowmode
"amenu  Modeline.Insert\ a\ VIM\ modeline <Esc><Esc>ggOvim:ff=unix ts=4 ss=4<CR>vim60:fdm=marker<esc>gg
function OpenTags()
  let l:wd=getcwd()
  let l:client = matchstr(l:wd, '^.*\(KSW_\S*_\(\d\{4\}\|unknown\|sergeym\)\)')
  if l:client !=''
    "let l:path = l:client . "/*"
    "set path+=l:client
    let &path = &path . "," . l:client . "," . l:client . "\\**"
    let l:path = l:client . "/tags"
    let l:file = l:client . "/tags.vim"
    "execute ":set tags+=".l:path
    "execute ":so ".l:file
  "else
    "call LoadTags()
  endif
  call LoadTags()
endfunction

function LoadTagsJ()
   "silent call CreateCommonTags()
   if(filereadable("tags.vim"))
       silent so tags.vim
   else
       silent call CreateCtagFileJ()
   endif
endfunction

function CreateCtagFileJ()
    let l:wd=getcwd()
    if filewritable(l:wd) == 2
        silent ! ctags -R --language-force=java --fields=+iaSK --extra=+q *.java
        silent call ParsCtagFileJ(0)
        silent so tags.vim
    endif
endfunction

function ParsCtagFileJ(comm)
    if(a:comm == 0)
        sp tags
    endif
    %s/^!.*//e
    %s/^\(\S*\>\).*\spackage.*//e
    %s/^\(\S*\>\).*\smethod\tclass.*/syn keyword\tFunctions\t\1/e
    %s/^\(\S*\>\).*\svariable.*/syn keyword\tVariable\t\1/e
    %s/^.*::\(\S*\>\).*\smember\sclass.*/syn keyword\tMember\t\1/e
    %s/^\(\S*\>\).*\sfield\tclass\s.*/syn keyword\tMember\t\1/e
    %s/^\(\S*\>\).*\senum\ constant.*/syn keyword\tEnum\t\1/e
    %s/^\(\S*\>\).*\sclass.*/syn keyword\tClass\t\1/e
    g/^\s*$/d
    silent w! tags.vim
    silent bdelete! tags 
endfunction
