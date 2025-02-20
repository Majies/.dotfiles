# .dotfiles

## Pre-reqs

- homebrew
- git (obvs)
- gnu stow

## Installation 

- Run `brew bundle --file=~/.dotfiles/brews/Brewfile`
- Symlink configs with `gnu stow $file`
- install tmux plugin manager

## Scripts

- (pre-commit): generates a new Brewfile contains latest formulae, casks and mas in gits `pre-commit` hook

- after setting up symlinks, need to install tmux plugin manager
