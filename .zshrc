# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_THEME="powerlevel10k/powerlevel10k"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

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

# GPG
export GPG_TTY=$(tty)

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:/usr/local/go/bin

# TinyGo
export PATH=$PATH:/usr/local/tinygo/bin

# DOTNET - Required
export PATH="$PATH:/home/YOUR_USER_NAME/.dotnet/tools"
# # DOTNET - Optional
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ASPNETCORE_ENVIRONMENT=Development

# Node/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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
alias goliso='golangci-lint run --disable-all --deadline=10m --skip-files="mobile\\/.*generated\\.go" --enable=gofmt --enable=vet --enable=gosimple --enable=unconvert --enable=ineffassign --enable=unused'
alias setenv='export $(grep -v '^#' .env | xargs)'

dosh () {
    docker run --rm -it $1 /bin/bash
}

dsh () {
    docker run --rm -it $1 /bin/sh
}

ssed () {
    fname=$1

    sed -i "s/btcec\.NewPrivateKey(btcec\.S256())/secp256k1\.GeneratePrivateKey()/g" $fname
    sed -i "s/github.com\/btcsuite\/btcd\/btcec/github.com\/decred\/dcrd\/dcrec\/secp256k1\/v2/g" $fname
    sed -i "s/btcec/secp256k1/g" $fname
    sed -i "s/SatPerKWeight/AtomPerKByte/g" $fname
    sed -i "s/github.com\/lightningnetwork\/lnd/github.com\/decred\/dcrlnd/g" $fname
    sed -i "s/*bbolt/*bolt/g" $fname
    sed -i "s/SatoshiPerBitcoin/AtomsPerCoin/g" $fname
    sed -i "s/github.com\/btcsuite\/btclog/github.com\/decred\/slog/g" $fname
    sed -i "s/btclog/slog/g" $fname
    sed -i "s/package lnd/package dcrlnd/g" $fname
    sed -i "s/bbolt\./bolt\./g" $fname
    sed -i "s/FeeForWeight/FeeForSize/g" $fname
    sed -i "s/github.com\/btcsuite\/btcutil/github.com\/decred\/dcrd\/dcrutil\/v2/g" $fname
    sed -i "s/github.com\/btcsuite\/btcd\/txscript/github.com\/decred\/dcrd\/txscript\/v2/g" $fname
    sed -i "s/github.com\/btcsuite\/btcd\/chaincfg\/chainhash/github.com\/decred\/dcrd\/chaincfg\/chainhash/g" $fname
    sed -i "s/github.com\/btcsuite\/btcd\/chaincfg/github.com\/decred\/dcrd\/chaincfg\/v2/g" $fname
    sed -i "s/btcutil/dcrutil/g" $fname
    sed -i "s/amtSat/amtAtoms/g" $fname
    sed -i "s/commitWeight/commitSize/g" $fname
    sed -i "s/feePerKw/feePerKB/g" $fname
    sed -i "s/FeePerKw/FeePerKB/g" $fname
    sed -i "s/AmtMsat/AmtMAtoms/g" $fname
    sed -i "s/AmtMsat/AmtMAtoms/g" $fname
    sed -i "s/TotalAmtMsat/TotalAmtMAtoms/g" $fname
    sed -i "s/RelayFeePerKW/RelayFeePerKB/g" $fname
    sed -i "s/TotalMsat/TotalMAtoms/g" $fname
    sed -i "s/amtMsat/amtMAtoms/g" $fname
    sed -i "s/AmtPaidSat/AmtPaidAtoms/g" $fname
    sed -i "s/FeeBaseMsat/FeeBaseMAtoms/g" $fname
    sed -i "s/MaxPaymentMSat/MaxPaymentMAtoms/g" $fname
    sed -i "s/MilliSatoshi/MilliAtom/g" $fname
    sed -i "s/SatPerKVByte/AtomPerKByte/g" $fname
    sed -i "s/ToSatoshis/ToAtoms/g" $fname
    sed -i "s/NewMSatFromSatoshis/NewMAtomsFromAtoms/g" $fname
    sed -i "s/\"github.com\/coreos\/bbolt\"/bolt \"go\.etcd\.io\/bbolt\"/g" $fname
    sed -i "s/github.com\/lightningnetwork\/lightning-onion/github.com\/decred\/lightning-onion\/v3/g" $fname
    sed -i "s/github.com\/btcsuite\/btcd/github.com\/decred\/dcrd/g" $fname
}

ased () {
    modified=`git ls-files -m | uniq`
    cached=`git diff --name-only --cached`

    for f in $modified; do
        echo "Processing modified $f"
        ssed $f
    done

    for f in $cached; do
        echo "Processing staged $f"
        ssed $f
    done
}

gott () {
    set -o pipefail
    go test -tags="gofuzz remotewallet dev walletrpc debug routerrpc invoicesrpc autopilotrpc watchtowerrpc wtclientrpc signrpc" $* | tee unit.txt
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
