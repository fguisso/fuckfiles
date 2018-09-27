## Aliases
alias cask="brew cask"
alias reload!="source ~/.zshrc && echo 'ZSH reloaded'"
alias zshconfig="vim ~/.zshrc"
alias projects="cd ~/Documents/Projects"
alias nodec="node && clear"
alias dotfiles="vim ~/dotfiles"
alias nodeup="nvm install node --reinstall-packages-from=node"
alias pig="ping google.com"

## Git
alias gf="git-flow"
alias gff="git flow feature"

## Functions
function mkd {
	mkdir $1
	cd $1
}
