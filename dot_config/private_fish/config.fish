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
alias gg="ghq get"
alias rr="ranger"
alias czi="chezmoi"
alias autoremove="sudo pacman -Qtdq | sudo pacman -Rns -"

set -gx EDITOR nvim
set fzf_fd_opts --hidden --exclude=.git

function fish_proxy
    set -xg ALL_PROXY http://localhost:20171
end

function noproxy
    set -e ALL_PROXY
end

function jc
    xclip -o | jless
end

function jcp
    xclip -o | sed -e 's/\\\"/"/g' | sed -e 's/"{/"/g' | jless
end

zoxide init fish | source
starship init fish | source
