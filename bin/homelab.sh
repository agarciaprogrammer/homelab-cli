#!/usr/bin/env bash
set -e

case "$1" in
    create)
      bash modules/kind.sh create
      ;; 
    
    destroy)
      bash modules/kind.sh destroy
      ;;
    *)
      echo "Usage: homelab {create|destroy}"
      ;;
esac