#!/usr/bin/env bash
set -e

ADDONS_DIR="addons"
SESSION_FILE="$HOME/.homelab/active-session.yaml"

install_addon() {
    local addon=$1
    local file="$ADDONS_DIR/$addon.yaml"

    if [ ! -f "$file" ]; then
      echo "Addon '$addon' not found in $ADDONS_DIR/"
      exit 1
    fi

    echo "Installing addon '$addon'..."
    kubectl apply -f "$file"
    echo "Addon '$addon' installed."
}

remove_addon() {
    local addon=$1
    local file="$ADDONS_DIR/$addon.yaml"

    if [ ! -f "$file" ]; then
      echo "Addon '$addon' not found"
      exit 1
    fi

    echo "Removing addon '$addon'..."
    kubectl delete -f "$file" --ignore-not-found
    echo "Addon '$addon' removed" 
}

list_addons() {
    echo "Available addons:"
    ls "$ADDONS_DIR" | sed 's/\.yaml//g'
}

case "$1" in
  install)
    install_addon "$2"
    ;;
  remove)
    remove_addon "$2"
    ;;
  list)
    list_addons
    ;;
  *)
    echo "Usage: addons {install|remove|list} [name]"
    ;;
esac