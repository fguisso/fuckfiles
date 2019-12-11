# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:/usr/local/go/bin

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
alias zshconf='vim ~/.zshrc'
alias vimconf='vim ~/.vimrc'
alias ohmyzsh='cd ~/.oh-my-zsh'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias copy!='xclip -sel clip'
alias dinspect='docker inspect -f "{{.Name}} {{.Path}} {{.Args}}" $(docker ps -a -q)'
alias reload!='source ~/.zshrc'
alias lshort='git log --decorate --abbrev-commit --format=format:"%C(bold green)%ci%C(reset) %<(20,trunc)%C(dim white)%an%C(reset) %C(bold blue)%h%C(reset) %<(60,trunc)%C(white)%s%C(reset) %C(auto)%D%C(reset)"'

dosh () {
    sudo docker run --rm -it $1 /bin/bash
}

dsh () {
    sudo docker run --rm -it $1 /bin/sh
}

dcrdtestnet () {
	(
		cd ~/.dcrd
		dcrd --configfile=dcrd-testnet.conf --miningaddr=TsSRqo2KHkAU8ejJNQDjQwspL7czFs2ggr6 --txindex
	)
}

dcrwallettestnet () {
	(
		cd ~/.dcrwallet
		dcrwallet --configfile=dcrwallet-testnet.conf $@
	)
}

dcrlndtestnet () {
	(
		cd ~/.dcrlnd
		dcrlnd --configfile=dcrlnd-testnet.conf $@
	)
}

dcrctltestnet () {
	(
		cd ~/.dcrctl
		dcrctl --configfile=dcrctl-testnet.conf $@
	)
}

dcrdsimnet () {
	(
		cd ~/.dcrd
		dcrd --configfile=dcrd-simnet.conf --miningaddr=SsnFsbrQW4kWmHgaEWyXMoMdAXhW32jGjNF --txindex
	)
}

dcrwalletsimnet () {
	(
		cd ~/.dcrwallet
		dcrwallet --configfile=dcrwallet-simnet.conf $@
	)
}

dcrctlsimnet () {
	(
		cd ~/.dcrctl
		dcrctl --configfile=dcrctl-simnet.conf $@
	)
}

dcrlndsimnet () {
	(
		cd ~/.dcrlnd
		dcrlnd --configfile=dcrlnd-simnet.conf $@
	)
}
btcdtestnet () {
	(
		cd ~/.btcd
		btcd --configfile=btcd-testnet.conf --txindex
	)
}
btcctltestnet () {
	(
		cd ~/.btcctl
		btcctl --configfile=btcctl-testnet.conf $@
	)
}
lndtestnet () {
	(
		cd ~/.lnd
		lnd --configfile=lnd-testnet.conf $@
	)
}

sidneilnd () {
    lndtestnet --rpclisten=127.0.0.1:10012 --restlisten=127.0.0.1:8082 --listen=127.0.0.1:9787 $@
}

sidneibetalnd () {
    lndtestnet --datadir=~/.lnd/beta --rpclisten=127.0.0.1:10013 --restlisten=127.0.0.1:8084 --listen=127.0.0.1:9786 $@
}

sidneidcralpha () {
    dcrlndtestnet --datadir=~/.dcrlnd/alpha $@
}

sidneidcrbeta () {
    dcrlndtestnet --datadir=~/.dcrlnd/beta --rpclisten=127.0.0.1:10010 --restlisten=127.0.0.1:8081 --listen=127.0.0.1:9999 $@
}

sidneidcrgama () {
    dcrlndtestnet --datadir=~/.dcrlnd/gama --rpclisten=127.0.0.1:10011 --restlisten=127.0.0.1:8083 --listen=127.0.0.1:9988 $@
}

slnd () {
    lncli -n testnet --rpcserver=127.0.0.1:10012 $@
}

slbeta() {
    (
        cd ~/.lnd/beta/chain/bitcoin/testnet
        lncli -n testnet --rpcserver=127.0.0.1:10013 --macaroonpath=admin.macaroon $@
    )
}

sdalpha () {
    (
        cd ~/.dcrlnd/alpha/chain/decred/testnet
        dcrlncli -n testnet --macaroonpath=admin.macaroon $@
    )
}

sdbeta () {
    (
        cd ~/.dcrlnd/beta/chain/decred/testnet
        dcrlncli -n testnet --rpcserver=127.0.0.1:10010 --macaroonpath=admin.macaroon $@
    )
}

sdgama () {
    (
        cd ~/.dcrlnd/gama/chain/decred/testnet
        dcrlncli -n testnet --rpcserver=127.0.0.1:10011 --macaroonpath=admin.macaroon $@
    )
}

PATH="/home/guisso/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/guisso/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/guisso/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/guisso/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/guisso/perl5"; export PERL_MM_OPT;
