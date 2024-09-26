#!/bin/sh

package=$1

# Need to know where brew is storing its downloads
brew_cache_dir=$(brew --cache)

# Need to know the version of macOS
os_version=$(sw_vers -productVersion)

# Extract the major version number
major_version=$(echo $os_version | cut -d. -f1)

case $major_version in
    14) marketing_name="sonoma" ;;
    13) marketing_name="ventura" ;;
    12) marketing_name="monterey" ;;
    11) marketing_name="bigsur" ;;
    *) marketing_name="unknown";;
esac

arch=$(arch)

case $arch in
  i386) os_arch="intel";;
  arm64) os_arch="arm";;
  *) os_arch="unknown";;
esac

cat > "$package.config" <<EOF
opam-version: "2.0"
variables {
  homebrew-cache-dir: "$brew_cache_dir"
  homebrew-macos-name: "$marketing_name"
  homebrew-macos-version: "$os_version"
  homebrew-macos-arch: "$os_arch"
}
EOF

