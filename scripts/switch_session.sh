#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

layout="$1"

cooler_fzf() {
  fzf --layout=reverse --prompt=" " --pointer=" " --header-first --header="Switch session" --color="bg:#1D1C19,bg+:#c4746e,fg+:#1D1C19,gutter:#1D1C19,header:#c4746e,prompt:#c4746e,query:#c5c9c5"
}

function main {
  local sessions
  local session
  local query
  local sess_arr
  local retval
  sessions=$(tmux list-sessions -F "#{session_name}" |
    cooler_fzf --exit-0 --print-query --layout="$layout")
  retval=$?

  IFS=$'\n' read -rd '' -a sess_arr <<<"$sessions"

  session=${sess_arr[1]}
  query=${sess_arr[0]}

  if [ $retval == 0 ]; then
    if [ "$session" == "" ]; then
      session="$query"
    fi
    tmux switch-client -t "$session"
  elif [ $retval == 1 ]; then
    tmux command-prompt -b -p "Press enter to create and go to [$query] session" \
      "run '$CURRENT_DIR/make_new_session.sh \"$query\" \"%1\"'"
  fi
}
main
