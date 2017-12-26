#!/bin/sh -x

basedir=`dirname $0`/../..

mkdir -p $HOME/.config
cp -r .config/powerline $HOME/.config/

FILE_LIST=(.eslintrc.json .emacs.d .pryrc .pylintrc .rspec .screenrc .tmux.conf .vimrc .vim .zshrc)

: [Info] Set synblic link
for file in ${FILE_LIST[@]}; do
  if [ -f ~/$file -o -d ~/$file ]; then
    rm -rf ~/$file
  fi
  ln -s $HOME/dotfiles/$file ~/
done
echo;

: [Info] Initialize git submodle
cd $HOME/dotfiles
git submodule update --init
echo;

: [Info] Set up Neovim
mkdir -p $HOME/.config
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

: [Info] Set up dein.vim
tmp=$(mktemp)
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $tmp
sh $tmp $HOME/.cache/dein
echo;
