#!/usr/bin/env bash

if nvim --headless -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in opening nvim"; false; fi
if nvim --headless +PackerCompile -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in PackerCompile"; false; fi
if nvim --headless +checkhealth -c ':qall' 2>&1 | grep -q 'Error'; then echo "Error in checkhealth"; false; fi
