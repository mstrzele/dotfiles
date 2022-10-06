#!/bin/sh
find "$HOME" -maxdepth 1 -regex "^$HOME/[a-z].*" -exec \
    chflags hidden {} +
