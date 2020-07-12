#!/bin/zsh
link_to_homedir() {
  command echo "start to linking dotfiles..."

  for filename in `ls -a $HOME/dotfiles`; do
    if [ $filename != "." ] && [ $filename != ".." ] && [ $filename != ".bin" ] && [ $filename != ".git" ]; then
      if [ -e $HOME/$filename ]; then
        command rm -rf $HOME/$filename
      fi
      command ln -snf $HOME/dotfiles/$filename $HOME
    fi
  done
}

link_to_homedir
command echo "linking completed!!"
