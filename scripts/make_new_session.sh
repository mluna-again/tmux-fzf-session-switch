#!/usr/bin/env bash

SESSION_NAME=$1

function main {
    local session
    session="$SESSION_NAME"

    tmux new-session -d -s $session
    tmux switch-client -t $session
}
main
