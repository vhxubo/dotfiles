if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nvim="lvim"
alias pn="pnpm"
alias pd="pnpm dev"
alias n="lvim ."
alias lgit="lazygit"
alias t="tmux"
alias tt="t attach -t"
alias ts="t new -s"
alias close="shutdown -h now"

set -gx EDITOR lvim

function fish_proxy
  set -xg ALL_PROXY http://localhost:7890
end

function noproxy
  set -e ALL_PROXY
end

zoxide init fish | source
starship init fish | source
