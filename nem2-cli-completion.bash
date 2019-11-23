### begin nem2-cli-completion.bash ###
#
# nem2-cli completion script for bash
#
# Installation: cat nem2-cli-completion.bash >> ~/.bashrc
# Or, maybe: mv nem2-cli-completion.bash /etc/bash_completion.d/nem2-cli
#
__nem2-cli-completion() {
  local opts curr prev

  curr="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  [ $COMP_CWORD -eq 3 ] && return

  case "$prev" in
    account)
      opts="aggregatebonded generate incoming info outgoing transactions unconfirmed"
      ;;
    block)
      opts="header receipts transactions"
      ;;
    chain)
      opts="height score"
      ;;
    diagnostic)
      opts="serverinfo storage"
      ;;
    metadata)
      opts="account mosaic namespace"
      ;;
    monitor)
      opts="aggregatebonded block confirmed cosignature status unconfirmed"
      ;;
    mosaic)
      opts="info"
      ;;
    namespace)
      opts="alias info owned"
      ;;
    profile)
      opts="create list setdefault"
      ;;
    restriction)
      opts="account mosaicaddress mosaicglobal"
      ;;
    transaction)
      opts="accountlink accountmosaicrestriction accountoperationrestriction addressalias cosign info mosaic mosaicalias mosaicsupplychange namespace secretlock secretproof status transfer"
      ;;
    *)
      opts="account block chain diagnostic metadata monitor mosaic namespace profile restriction transaction"
      ;;
  esac

  COMPREPLY=( $(compgen -W "$opts" -- "$curr") )

  return 0
}

complete -o default -F __nem2-cli-completion nem2-cli
### end nem2-cli-completion.bash ###