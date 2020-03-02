#!/usr/bin/env bash

ln -sfn $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sfn $HOME/dotfiles/.alacritty.yml $HOME/.alacritty.yml
ln -sfn $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sfn $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sfn $HOME/dotfiles/.ctags $HOME/.ctags

# Initialize custom git hooks.
git config --global init.templatedir $HOME/dotfiles/git_template/hooks
