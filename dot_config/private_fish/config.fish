if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nvim="lvim"
alias pm="pnpm"

function fish_proxy
  set -xg ALL_PROXY http://localhost:7890
end

function noproxy
  set -e ALL_PROXY
end

function jp
  if test -n "$argv[2]"
    echo $argv[1] | jq "$argv[2] | fromjson"
  else
    echo $argv[1] | jq "."
  end
end

zoxide init fish | source
starship init fish | source
