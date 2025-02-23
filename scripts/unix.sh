#!/usr/bin/env bash

source ./scripts/util.sh

printHeading "Unix utilities"

printStep "coreutils" "brew install coreutils"
printStep "watch" "brew install watch"
printStep "wget" "brew install wget"
printStep "jq" "brew install jq"
printStep "yq" "brew install yq"
printStep "kubectl" "brew install kubectl"
printDivider
printf "\nVerify kubectl installation\n"
kubectl version --client
printStep "fzf" "brew install fzf"
printStep "bat" "brew install bat"

cat << EOT >> ~/.zshrc
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias cat='bat'
#FZF stuff
 source <(fzf --zsh)
 bindkey "ç" fzf-cd-widget
 export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --inline-info --border"
 export FZF_CTRL_T_OPTS="
   --walker-skip .git,node_modules,target
   --preview 'bat -n --color=always {}'
   --bind 'ctrl-/:change-preview-window(down|hidden|)'"

 export FZF_CTRL_R_OPTS="
   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
   --color header:italic
   --header 'Press CTRL-Y to copy command into clipboard'"
 
 export FZF_ALT_C_OPTS="
   --walker-skip .git,node_modules,target
   --preview 'tree -C {}'"
 
 _fzf_comprun() {
   local command=$1
   shift
 
   case "$command" in
      cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
      export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
      ssh)          fzf --preview 'dig {}'                   "$@" ;;
      *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}
EOT