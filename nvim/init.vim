" =========== plugged  ===========
    call plug#begin('~/.config/nvim/plugged')
    " Plug 'fatih/vim-go'
    Plug 'kien/ctrlp.vim'
    " Plug 'chr4/nginx.vim'
    Plug 'junegunn/fzf'
    Plug 'preservim/nerdtree'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    "" On-demand loading
    " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    "" Plugin outside ~/.vim/plugged with post-update hook
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    call plug#end()
" =========== plugged ===========


" =========== ctrlp setup ===========
    " ignored files
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|target)$',
      \ 'file': '\v\.(exe|so|dll|pyc)$'
      \ }
    
    " use rg instead
    if executable('rg')
      set grepprg=rg\ --color=never
      let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
      let g:ctrlp_use_caching = 0
    else
      let g:ctrlp_clear_cache_on_exit = 0
    endif
" =========== ctrlp setup ===========


" " =========== coc setup ===========
"     " Use <c-space> to trigger completion.
"     if has('nvim')
"       inoremap <silent><expr> <c-space> coc#refresh()
"     else
"       inoremap <silent><expr> <c-@> coc#refresh()
"     endif
"     
"     " Make <CR> auto-select the first completion item and notify coc.nvim to
"     " format on enter, <cr> could be remapped by other vim plugin
"     inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                                   \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"     
"     " Use `[g` and `]g` to navigate diagnostics
"     " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"     nmap <silent> [g <Plug>(coc-diagnostic-prev)
"     nmap <silent> ]g <Plug>(coc-diagnostic-next)
"     
"     " GoTo code navigation.
"     nmap <silent> gd <Plug>(coc-definition)
"     nmap <silent> gy <Plug>(coc-type-definition)
"     nmap <silent> gi <Plug>(coc-implementation)
"     nmap <silent> gr <Plug>(coc-references)
"     
"     
"     " Use K to show documentation in preview window.
"     nnoremap <silent> K :call <SID>show_documentation()<CR>
"     
"     function! s:show_documentation()
"       if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"       elseif (coc#rpc#ready())
"         call CocActionAsync('doHover')
"       else
"         execute '!' . &keywordprg . " " . expand('<cword>')
"       endif
"     endfunction
"     
"     " Highlight the symbol and its references when holding the cursor.
"     autocmd CursorHold * silent call CocActionAsync('highlight')
"     
"     " Symbol renaming.
"     nmap <leader>rn <Plug>(coc-rename)
"     
"     " Formatting selected code.
"     xmap <leader>f  <Plug>(coc-format-selected)
"     nmap <leader>f  <Plug>(coc-format-selected)
"     
"     augroup mygroup
"       autocmd!
"       " Setup formatexpr specified filetype(s).
"       autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"       " Update signature help on jump placeholder.
"       autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"     augroup end
"     
"     " Applying codeAction to the selected region.
"     " Example: `<leader>aap` for current paragraph
"     xmap <leader>a  <Plug>(coc-codeaction-selected)
"     nmap <leader>a  <Plug>(coc-codeaction-selected)
"     
"     " Remap keys for applying codeAction to the current buffer.
"     nmap <leader>ac  <Plug>(coc-codeaction)
"     " Apply AutoFix to problem on the current line.
"     nmap <leader>qf  <Plug>(coc-fix-current)
"     
"     " Map function and class text objects
"     " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"     xmap if <Plug>(coc-funcobj-i)
"     omap if <Plug>(coc-funcobj-i)
"     xmap af <Plug>(coc-funcobj-a)
"     omap af <Plug>(coc-funcobj-a)
"     xmap ic <Plug>(coc-classobj-i)
"     omap ic <Plug>(coc-classobj-i)
"     xmap ac <Plug>(coc-classobj-a)
"     omap ac <Plug>(coc-classobj-a)
"     
"     " Remap <C-f> and <C-b> for scroll float windows/popups.
"     if has('nvim-0.4.0') || has('patch-8.2.0750')
"       nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"       nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"       inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"       inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"       vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"       vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"     endif
"     
"     " Use CTRL-S for selections ranges.
"     " Requires 'textDocument/selectionRange' support of language server.
"     nmap <silent> <C-s> <Plug>(coc-range-select)
"     xmap <silent> <C-s> <Plug>(coc-range-select)
"     
"     " Add `:Format` command to format current buffer.
"     command! -nargs=0 Format :call CocAction('format')
"     
"     " Add `:Fold` command to fold current buffer.
"     command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"     
"     " Add `:OR` command for organize imports of the current buffer.
"     command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"     
"     " Add (Neo)Vim's native statusline support.
"     " NOTE: Please see `:h coc-status` for integrations with external plugins that
"     " provide custom statusline: lightline.vim, vim-airline.
"     set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"     
"     " Mappings for CoCList
"     " Show all diagnostics.
"     nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"     " Manage extensions.
"     nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"     " Show commands.
"     nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"     " Find symbol of current document.
"     nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"     " Search workspace symbols.
"     nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"     " Do default action for next item.
"     nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"     " Do default action for previous item.
"     nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"     " Resume latest coc list.
"     nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" " =========== coc setup ===========


" =========== nerdtree setup ===========
    " start unless a file or session is specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
    " Start NERDTree when Vim starts with a directory argument
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif
" =========== nerdtree setup ===========


" =========== editor global config ===========
    set maxmempattern=3000
    set encoding=utf8
    set ffs=unix,mac,dos " default standard to unix file type
    
    syntax on
    set ruler " always show current position
    set hlsearch " highlight search results
    set number
    set smartcase " auto set case insensitive when searching upper case terms
    
    " tab settings, default to 2
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set ai " auto indent
    
    autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
    " autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
    " backspace
    set backspace=indent,eol,start
    
    "" default term color is 8
    " set t_Co=256
    " set t_ut=
    " colorscheme blackbeauty
    " colorscheme Monokai
    colorscheme darkblue
" =========== editor global config ===========


" =========== autocmds ===========
    autocmd BufRead,BufNewFile *.go set shiftwidth=4 sts=0 noexpandtab
    autocmd BufRead,BufNewFile *.c,*.h set shiftwidth=8 sts=8 noexpandtab
    autocmd BufRead,BufNewFile *.hpp,*.cc,*.cpp set shiftwidth=4 sts=4 et
    autocmd BufRead,BufNewFile *.py,*.sh,*.php set shiftwidth=4 sts=4 et
    autocmd BufRead,BufNewFile *.js set shiftwidth=2 sts=2 et
    autocmd BufRead,BufNewFile *.js imap log<TAB> console.log(
    " autocmd BufRead,BufNewFile   *.c,*.h,*.java set noic cin noexpandtab
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    au FileType gitcommit setlocal tw=72
" =========== autocmds ===========
