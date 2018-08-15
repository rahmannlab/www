#!/bin/bash

# decrypt ssh key (the encrypted_... variables have been set in Travis)
openssl aes-256-cbc -K $encrypted_dba755bd9789_key -iv $encrypted_dba755bd9789_iv \
  -in .ci/travis_key.enc -out .ci/travis_key -d
# the public part of the key has been added as deploy key in
# https://github.com/rahmannlab/rahmannlab.github.io/settings/keys
