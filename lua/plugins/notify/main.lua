require('packerList').add({'rcarriga/nvim-notify', config = function ()
    local notify = require "notify"
    vim.opt.termguicolors = true
    vim.notify = notify
end})

