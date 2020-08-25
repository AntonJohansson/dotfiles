set -x XDG_CONFIG_HOME /home/aj/.config
set -x  EDITOR nvim
set -x  VISUAL nvim
set -x  LC_ALL sv_SE.UTF-8
set -x  LANG sv_SE.UTF-8
set -x LD_LIBRARY_PATH /home/aj/.local/lib
set -x PATH $PATH:/home/aj/.local/bin
alias conf="/usr/bin/git --git-dir=$HOME/git/dotfiles/ --work-tree=$HOME"
