#!/usr/bin/env bash

: "${KB_PREVIEW="Alt+p"}"
: "${KB_DELETE="Alt+d"}"
: "${KB_CLEAR="Alt+c"}"

menu() {
    actions=(
        -kb-custom-1 "$KB_PREVIEW"
        -kb-custom-2 "$KB_DELETE"
        -kb-custom-3 "$KB_CLEAR"
    )
    msg="<b>$KB_PREVIEW</b>: preview | <b>$KB_DELETE</b>: remove | <b>$KB_CLEAR</b>: clear"
    
    rofi -dmenu -p 󰆏 \
        -display-columns 2 \
        -mesg "$msg" \
        "${actions[@]}"

}

show_clipboard() {
    if item=$(
        cliphist-rofi-img \
        | menu
    ); then
        echo "$item" \
            | cliphist decode \
            | wl-copy
    else
        exit_code=$?
        handle_exit "$exit_code" "$item"
    fi
}

preview() {
    echo "$item" \
        | cliphist decode \
        | satty --filename - --actions-on-escape exit

    show_clipboard
}

delete() {
    echo "$item" \
        | cliphist delete

    show_clipboard
}

clear_history() {
    cliphist wipe
}

handle_exit() {
    case "$1" in
        10) preview "$2";;
        11) delete;;
        12) clear_history;;
        *) exit "$1";;
    esac
}

show_clipboard
