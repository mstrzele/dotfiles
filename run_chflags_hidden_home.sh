#!/bin/sh
find "$HOME" -maxdepth 1 -regex "^$HOME/[a-z].*" -print -exec chflags hidden {} +
