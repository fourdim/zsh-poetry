# Return immediately if poetry is not found
if (( ! $+commands[poetry] )); then
  return
fi


# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `poetry`. Otherwise, compinit will have already done that.
if [[ ! -f "${ZINIT[COMPLETIONS_DIR]:-$ZSH_CACHE_DIR/completions}/_poetry" ]]; then
  typeset -g -A _comps
  autoload -Uz _poetry
  _comps[poetry]=_poetry
fi

poetry completions zsh >| "${ZINIT[COMPLETIONS_DIR]:-$ZSH_CACHE_DIR/completions}/_poetry" &|
