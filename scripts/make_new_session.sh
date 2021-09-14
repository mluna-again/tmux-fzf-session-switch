#!/usr/bin/env bash

SESSION_NAME=$1
ANSWER=$2

function main {
  local session
  local answer
  session=$SESSION_NAME
  answer=$ANSWER

  tmux new-session -d -s "$session"
  tmux switch-client -t "$session"
}
main
