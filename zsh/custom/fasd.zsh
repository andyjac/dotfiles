#!/usr/bin/env zsh

if $(command -v fasd > /dev/null 2>&1); then
  eval "$(fasd --init auto)"
fi
