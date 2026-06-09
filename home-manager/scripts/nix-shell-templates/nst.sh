#!/usr/bin/env bash
FILE=$(ls ~/.local/share/nix-shell-template | fzf) 
cp "$HOME/.local/share/nix-shell-template/$FILE" flake.nix
chmod +w flake.nix

echo "use flake" >> .envrc
direnv allow
