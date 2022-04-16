#!/usr/bin/env bash
# Bash 'Strict Mode'
# http://redsymbol.net/articles/unofficial-bash-strict-mode
# https://github.com/xwmx/bash-boilerplate#bash-strict-mode
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

op confirm --all || eval "$(op signin my.1password.com maciej.strzelecki@gmail.com)"

pushd "$(mktemp -d)" > /dev/null 2>&1 
while read -r key && [ -n "$key" ]
do
  touch "$key"
  chmod 0600 "$key"
  # shellcheck disable=SC2094
  op get document "$key" >> "$key" 
  gpg --import "$key"
  rm -f "$key"
done < <(op list documents | jq -rS '.[] | select(.overview.tags[0] == "GPG") | .overview.title')
popd > /dev/null 2>&1 
