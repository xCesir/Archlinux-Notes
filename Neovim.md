# neovim

```
sudo pacman -S neovim neovim-lspconfig neovim-qt 
```
````
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
````
````
mkdir .config/nvim
````
````
nvim ~/.config/nvim/init.vim
````
````
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'

call plug#end()
````
Open Neovim
run `:PlugInstall`
