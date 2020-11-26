# Dotfiles
My dotfiles for my \*NIX systems. It includes configurations for bspwm, sxhkd, polybar, dmenu, st, nvim, and zsh.

## Installation
Setup an alias so the git directory and the work tree ($HOME in this case) are separated.

```
alias dot_git='$(which git) --git-dir=$HOME/dotfiles.git --work-tree=$HOME'

echo "dotfiles.git" >> .gitignore

git clone --bare --recurse-submodules https://github.com/gsalinaslopez/dotfiles.git

dot_git config --local status.showUntrackedFiles no

dot_git checkout
```
*A huge thanks to https://news.ycombinator.com/item?id=11071754 and https://www.atlassian.com/git/tutorials/dotfiles for the amazing dotfiles repo solution and tutorial, respectively*
