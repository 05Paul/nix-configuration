#!/usr/bin/env bash
while getopts "o:" name; do
    case "${name}" in
        o)
            out="${OPTARG}";;
        *)
            ;;
    esac
done

hyprshot -m active -m output --freeze --raw | satty --filename - --output-filename "$out"
