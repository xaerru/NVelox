#!/usr/bin/env bash

if nvim --headless +checkhealth -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in checkhealth"; exit 101; fi
