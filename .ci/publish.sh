#!/bin/bash

# decrypt ssh key
openssl aes-256-cbc -K $encrypted_dba755bd9789_key -iv $encrypted_dba755bd9789_iv -in .ci/travis_key.enc -out .ci/travis_key -d
