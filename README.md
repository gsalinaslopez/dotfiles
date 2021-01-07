### Dotfiles
This repo contains configuration files for both my \*NIX systems. Arch Linux on a laptop and FreeBSD on a desktop that should have a close resemblance between each other with only minor tweaks. Checkout the different branches!

## Tools/Applications
+ **WM**: [bspwm](https://github.com/baskerville/bspwm)
+ **Status Bar**: [Polybar](https://github.com/polybar/polybar)
+ **Application Launcher** [dmenu](https://tools.suckless.org/dmenu/)
+ **Text Editor**: [Neovim](https://github.com/neovim/neovim/)
+ **Font**: [Gohufont](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Gohu) (with nerd font patch)
+ **Misc Icon Font** [Siji](https://github.com/stark/siji)
+ **Terminal**: [st](https://st.suckless.org/)
+ **Shell**: [zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) configuration framework and [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt theme

## Installation
Setup an alias so the git directory and the work tree ($HOME in this case) are separated.

```
alias dot_git='$(which git) --git-dir=$HOME/dotfiles.git --work-tree=$HOME'

echo "dotfiles.git" >> .gitignore

git clone --bare --recurse-submodules https://github.com/gsalinaslopez/dotfiles.git

dot_git config --local status.showUntrackedFiles no

dot_git checkout
```

## Screenshots
*A huge thanks to https://news.ycombinator.com/item?id=11071754 and https://www.atlassian.com/git/tutorials/dotfiles for the amazing dotfiles repo solution and tutorial, respectively*
