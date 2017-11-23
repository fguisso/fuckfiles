## CDP
alias run-api="cd ~/Documents/cdp/ar-api; sdk use java 7u141-zulu; sdk use grails 2.5.5; grails run-app -Dhttps.protocols=TLSv1.1"
alias run-ws="cd ~/Documents/cdp/api-ws; sdk use java 8u151-oracle; sdk use grails 3.2.8; grails run-app -Dhttps.protocols=TLSv1.1"
# alias run-mte="cd ~/Documents/cdp/front-mte; sdk use java 7u141-zulu; sdk use grails 2.5.5; grails run-app"
# alias run-bosch="cd ~/Documents/cdp/front-bosch; sdk use java 7u141-zulu; sdk use grails 2.5.5; grails run-app"
# alias run-skf="cd ~/Documents/cdp/front-skf; sdk use java 7u141-zulu; sdk use grails 2.5.5; grails run-app"
# alias run-marketplace="cd ~/Documents/cdp/front-marketplace-cdp; sdk use java 7u141-zulu; sdk use grails 2.5.5; grails run-app"
alias run-lp="cd ~/Documents/cdp/front-lp; sdk use java 7u141-zulu; sdk use grails 2.5.5; grails run-app"
alias run-adm="cd ~/Documents/cdp/ar-adm; sdk use java 7u141-zulu; sdk use grails 2.3.8; grails run-app"
# alias run-adm-partner="cd ~/Documents/cdp/ar-adm-partner; sdk use java 7u141-zulu; sdk use grails 2.3.8; grails run-app -Dhttps.protocols=TLSv1.1"
alias run-workers="cd ~/Documents/cdp/ar-workers; sdk use java 7u141-zulu; sdk use grails 2.3.8; grails run-app"
# alias run-es="~/development/env/elasticsearch-1.5.0/bin/elasticsearch -d"
# alias run-redis="~/development/env/redis-3.0.6/src/redis-server --port 6382 &"
# alias run-y="run-es run-redis mysql.server start; sudo nginx"
# alias run-fiddler="cd ~/development/fiddler-mac; /Library/Frameworks/Mono.framework/Versions/5.0.1/bin/mono Fiddler.exe"
# alias run-baw="cd ~/Documents/cdp/baw; grunt;"

## Aliases
alias cask="brew cask"
alias reload!="source ~/.zshrc && echo 'ZSH reloaded'"
alias czsh="nano ~/.zshrc"
alias projects="cd ~/Documents/Projects"
alias nodec="node && clear"
alias dotfiles="subl ~/dotfiles"
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
