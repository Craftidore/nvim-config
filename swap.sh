#!/bin/bash
if [[ -e init.lua.new ]]
then
        mv init.vim init.vim.bak
        mv init.lua.new init.lua
elif [[ -e init.vim.bak ]]
then
        mv init.lua init.lua.new
        mv init.vim.bak init.vim
fi
