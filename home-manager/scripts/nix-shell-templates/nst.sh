#!/usr/bin/env bash
cp $(ls -f --absolute | fzf) flake.nix
