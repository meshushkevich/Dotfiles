ZSH_THEME="robbyrussel"

plugins=(git)


alias fuck="sudo"
alias untar="tar -xf"
alias bye="sudo shutdown -h now"
alias loop="reboot"
alias grep="grep --color=auto"
alias trash="sudo pacman -Rns $(pacman -Qdtq)"
alias fixsudo="faillock --reset"

clear && fastfetch
