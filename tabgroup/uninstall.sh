#!/bin/bash

set -e

INSTALL_LOCATION="$HOME/bin/tabgroup"
ZSH_COMPLETION_LOCATION="$HOME/.zsh/completions/_tabgroup"

echo "Removing $INSTALL_LOCATION"
rm $INSTALL_LOCATION

echo "Removing $ZSH_COMPLETION_LOCATION"
rm $ZSH_COMPLETION_LOCATION

echo "Uninstall complete"
