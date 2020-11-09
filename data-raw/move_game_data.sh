#!/bin/bash

find "/Users/aftoncoombs/Library/Application Support/Steam/steamapps/common/Stardew Valley/Contents/Resources/Content/" -type f -name "*.xnb" -exec cp {} "/Users/aftoncoombs/Projects/xnbcli-macos/packed/" \;

cd /Users/aftoncoombs/Projects/xnbcli-macos

open unpack.command