#!/bin/bash -x

basedir=`dirname $0`/../..

mkdir -p $HOME/.config
cp -r .config/powerline $HOME/.config/

FILE_LIST=(.atom .eslintrc.json .emacs.d .pryrc .pylintrc .rspec .screenrc .tmux.conf .vimrc .vim .zshrc)

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
if [ ! -e $HOME/.config/nvim ]; then
  ln -s $HOME/.vim $HOME/.config/nvim
  ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
fi

: [Info] Set up dein.vim
sh -c "$(wget -O- https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
echo;

: [Info] Set up zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo;
