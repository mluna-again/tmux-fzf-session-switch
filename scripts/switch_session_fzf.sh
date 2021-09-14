#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function main {
  local sessions
  local session
  local query
  local sess_arr
  local retval
  sessions=$(tmux list-sessions -F "#{session_name}" | \
    fzf --select-1 --exit-0 --print-query)

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
    tmux command -p "Enter '$query'"\
      "run '$CURRENT_DIR/make_new_session.sh \"$query\" \"%1\"'"
  fi
}
main
