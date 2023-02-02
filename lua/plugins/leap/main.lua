require('packerList').add({"ggandor/leap.nvim", config = function ()
    local leap = require "leap"

    leap.set_default_keymaps()
    leap.init_highlight(true)
end})

