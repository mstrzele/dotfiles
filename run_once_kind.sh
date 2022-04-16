#!/usr/bin/env bash
# Bash 'Strict Mode'
# http://redsymbol.net/articles/unofficial-bash-strict-mode
# https://github.com/xwmx/bash-boilerplate#bash-strict-mode
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

IMAGE='kindest/node:v1.20.15'
docker pull "$IMAGE"
kind delete cluster && kind create cluster --image "$IMAGE" --wait 60s
