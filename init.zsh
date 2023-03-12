(( ${+commands[istioctl]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[istioctl]:-"$(${commands[asdf]} which istioctl 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_istioctl
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'istioctl'. Regenerated completions."
  fi
} ${0:h}
