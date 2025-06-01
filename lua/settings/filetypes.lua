local opt = vim.opt
local api = vim.api

local create_aucmd = api.nvim_create_autocmd

function SetTab()
    local tab_options = { "tabstop", "softtabstop", "shiftwidth" }
    local tab_width = 8
    for i = 1, #tab_options do
        opt[tab_options[i]] = tab_width
    end
    opt.expandtab = false
end

-- create_aucmd({"BufNewFile","BufReadPre"}, {pattern = {vim.fn.expand("~") .. "/mach/*"},
--     callback = SetTab, once = true})

