#!/bin/bash

if [ $# -gt 0 ]; then
  streamripper "$@"
else
  # otherwise, default to no args (=> help output)
  streamripper
fi
