#!/bin/bash

dest=$(dirname "${BASH_SOURCE[0]}")
url="https://github.com/gohugoio/hugo/releases/download/v0.46/hugo_0.46_Linux-64bit.tar.gz"
wget $url -O - | tar xzf - -C $dest hugo 

