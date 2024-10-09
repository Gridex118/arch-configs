# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd histignorespace
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rosegrid/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

# theme
source ~/.zsh/themes/p10k/powerlevel10k.zsh-theme

# plugins
source ~/.zsh/lib/zsh-autosuggestions.zsh

# aliases
source ~/.zsh/.zalias

# keybindings
source ~/.zsh/.zkeys
