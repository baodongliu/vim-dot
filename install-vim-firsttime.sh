#!/bin/bash

mkdir ~/.vim
cd ~/.vim
git init
git remote add origin git@github.com:baodongliu/vim-dot.git

# add pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# add vim other modules
vim_modules="SirVer/ultisnips
junegunn/vim-easy-align
tpope/vim-sensible
ervandew/supertab
vim-airline/vim-airline
tpope/vim-fugitive
jpalardy/vim-slime
vim-syntastic/syntastic
altercation/vim-colors-solarized
sheerun/vim-polyglot
Valloric/YouCompleteMe"

for vim_module in $vim_modules
do
    # echo "$vim_module"
    dir=`echo $vim_module | cut -d/ -f2`
    dir="bundle/$dir"
    # echo "git submodule add git@github.com:$vim_module $dir"
    git submodule add git@github.com:$vim_module $dir
    
done

git add .
git commit -m "Use pathogen and git submodules to keep track of vim plugins"
git push origin master
