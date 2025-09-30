#!/bin/bash
set -eo pipefail

if [ "$#" -ne 1 ]; then
  echo "usage: $0 <path to directory>"
  echo "please enter a filepath"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "directory does not exist"
  echo "creating directory..."
  mkdir -p "$1"
fi

echo "changing directory permissions..."

chmod 700 "$1"

echo "directory now has the expected permissions"
