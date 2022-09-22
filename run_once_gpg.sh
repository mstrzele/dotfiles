#!/usr/bin/env bash
# Bash 'Strict Mode'
# http://redsymbol.net/articles/unofficial-bash-strict-mode
# https://github.com/xwmx/bash-boilerplate#bash-strict-mode
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

eval "$(op signin)"

pushd "$(mktemp -d)" > /dev/null 2>&1 
while read -r key && [ -n "$key" ]
do
  op document get "$key" --output "$key" 
  chmod 0600 "$key"
  gpg --import "$key"
  rm -f "$key"
done < <(op document list --format json | jq -rS '.[] | select(.tags[0] == "GPG") | .title')
popd > /dev/null 2>&1 
