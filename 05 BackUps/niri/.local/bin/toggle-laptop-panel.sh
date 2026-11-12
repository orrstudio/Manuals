#!/usr/bin/env bash

if niri msg outputs | grep -A1 '(eDP-1)' | grep -q 'Disabled'; then
    niri msg output eDP-1 on
else
    niri msg output eDP-1 off
fi
