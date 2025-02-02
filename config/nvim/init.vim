call plug#begin('~/.vim/plugged')

" Eklentiler buraya eklenecek
Plug 'preservim/nerdtree'          " Dosya gezgini
Plug 'junegunn/fzf.vim'            " FZF arama
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Otomatik tamamlama

call plug#end()

call plug#begin('~/.vim/plugged')

" coc.nvim eklentisi
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

