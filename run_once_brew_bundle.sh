#!/bin/sh
# Brewfile hash: {{ include "dot_Brewfile" | sha256sum }}

brew bundle --global --cleanup
"$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc
az extension add --upgrade --name azure-devops --yes
