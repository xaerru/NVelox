#!/usr/bin/env bash

if nvim --headless -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in opening nvim"; exit 101; fi
if nvim --headless +PackerCompile -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in PackerCompile"; exit 101; fi
if nvim --headless +checkhealth -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in checkhealth"; exit 101; fi
