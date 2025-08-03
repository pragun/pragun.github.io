#!/bin/sh

# Hugo aliases
#
export PATH=$PATH:/usr/local/go/bin:/go/bin
alias hb='hugo --minify'
alias hs='hugo server --bind 0.0.0.0 --port 1313'

# Push to GitHub Pages (must have SSH + ghp-import set up)
alias hp="hugo --minify && ghp-import -n -p -f public"

# Show all aliases
alias ha='alias | grep "^alias h"'
