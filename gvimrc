" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
" https://superuser.com/questions/322947/gvim-shift-insert-dump-s-insert-instead-of-the-clipboard-text 
imap  <silent>  <S-Insert>  "+p
imap <silent>  <S-Insert>  <Esc>"+pa
" http://vim.wikia.com/wiki/Maximize_or_set_initial_window_size
set lines=999 columns=999
