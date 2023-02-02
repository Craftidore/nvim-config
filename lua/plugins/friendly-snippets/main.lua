require('packerList').add({'rafamadriz/friendly-snippets', 
    requires = {'L3MON4D3/LuaSnip'}, 
    config = function()
        require('luasnip').filetype_extend('html', {'html'});
        require('luasnip').filetype_extend('svelte', {'svelte'});
    end});
