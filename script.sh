#!/bin/sh

package=$1

brew_cache_dir=$(brew --cache)

cat > "$package.config" <<EOF
opam-version: "2.0"
variables {
  homebrew-cache-dir: "$brew_cache_dir"
}
EOF

