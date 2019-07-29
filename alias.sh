## Aliases

# Default
alias reload!="source ~/.zshrc && echo 'ZSH reloaded'"
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Others
alias vim="nvim"
alias nodeup="nvm install node --reinstall-packages-from=node"
alias cask="brew cask"
alias dinspect='docker inspect -f "{{.Name}} {{.Path}} {{.Args}}" $(docker ps -a -q)'
