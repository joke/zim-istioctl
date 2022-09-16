(( ${+commands[istioctl]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[istioctl]:-"$(${commands[asdf]} which istioctl 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_istioctl
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile
} ${0:h}
