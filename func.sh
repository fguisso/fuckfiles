## Functions

# Decred worksflow
function dcrdtestnet () {
    (cd ~/Library/Application\ Support/Dcrd; dcrd --configfile=dcrd-testnet.conf --miningaddr=TsSRqo2KHkAU8ejJNQDjQwspL7czFs2ggr6 --txindex)
}
function dcrctltestnet () {
    (cd ~/Library/Application\ Support/Dcrctl; dcrctl --configfile=dcrctl-testnet.conf $@)
}
function dcrwallettestnet () {
    (cd ~/Library/Application\ Support/Dcrwallet; dcrwallet --configfile=dcrwallet-testnet.conf $@)
}
function dcrdsimnet () {
    (cd ~/Library/Application\ Support/Dcrd; dcrd --configfile=dcrd-simnet.conf --miningaddr=SsnFsbrQW4kWmHgaEWyXMoMdAXhW32jGjNF --txindex)
}
function dcrctlsimnet () {
    (cd ~/Library/Application\ Support/Dcrctl; dcrctl --configfile=dcrctl-simnet.conf $@)
}
function dcrwalletsimnet () {
    (cd ~/Library/Application\ Support/Dcrwallet; dcrwallet --configfile=dcrwallet-simnet.conf $@)
}
