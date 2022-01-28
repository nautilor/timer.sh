#!/bin/bash

function refresh() {
    # move cursor to 0,0
    printf '\e[H0,1'
    # clear the screen
    printf '\e[2J'
    # set max scroll to 7 lines
    printf '\e[1;8r'
    # hide the cursor
    printf '\e[?25l'
}

# used to make the timer start from 00:00:00
start=$(date +%s)
refresh
# do not mess up the text if the window get resized
trap 'refresh' WINCH
# run forever
while true; do
    # print the time without appending a new line every time
    figlet -w $(tput cols) -c "$(date -u --date @$(( $(date +%s) - $start )) +%H:%M:%S)"
    sleep 1
done
