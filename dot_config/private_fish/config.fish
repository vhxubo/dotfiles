if status is-interactive
    # Commands to run in interactive sessions can go here
end

# alias nvim="lvim"
alias pn="pnpm"
alias pd="pnpm dev"
alias n="nvim ."
alias lgit="lazygit"
alias t="tmux"
alias ta="t attach"
alias ts="t new -s"
alias tt="t attach -t"

set -gx EDITOR nvim
set fzf_fd_opts --hidden --exclude=.git

function fish_proxy
    set -xg ALL_PROXY http://localhost:7890
end

function noproxy
    set -e ALL_PROXY
end

zoxide init fish | source
starship init fish | source
