#!/bin/bash
# Wrapper script to call nix with the correct flags to use flakes.
# Won't be needed in the future when the flakes features leaves experimental status.

nix-shell \
-I nixpkgs=channel:nixos-20.03 \
-p nixFlakes \
--run "nix --experimental-features 'nix-command flakes' build"