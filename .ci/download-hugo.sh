#!/bin/bash
version="0.47"
dest=$(dirname "${BASH_SOURCE[0]}")
url="https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_${version}_Linux-64bit.tar.gz"
wget $url -O - | tar xzf - -C $dest hugo 

