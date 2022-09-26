local fn = vim.fn
local opt = vim.opt
local api = vim.api

opt.updatetime = 300

opt.signcolumn = "yes"

-- Auto-complete
function _G.check_back_space()
	local col = fn.col('.') - 1
	return col == 0 or fn.getline('.'):sub(col, col):match('%s')
end

local opts = {silent = true, noremap = true, expr = true}

-- Tab must not be used by any other plugin! (can be confirmed by `:verbose imap <tab>`)
-- There's always a complete item selected by default, you may want to enable no select by `"suggest.noselect": true`
api.nvim_set_keymap("i", "<TAB>", 'coc#pum#visible() ?  (coc#pum#next(1)): v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
api.nvim_set_keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
api.nvim_set_keymap("i", "<CR>", 'coc#pum#visible() ? coc#_select_confirm() : "<CR>"', opts)

local keyset = vim.keymap.set
-- <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- <c-space> triggers completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- use `[g` and `]g` to navigate diagnostics
-- use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keyset("n", "[g", "<Plug>(coc-diagnostic-prev", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next", { silent = true })

-- GoTo code navigation
--[=====[
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})
--]=====]

-- Use K to show documentation in preview window.
--[=====[
function _G.show_docs()
    local cw = fn.expand('<cword>')
    if fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        api.nvim_command('h ' .. cw)
    elseif api.nvim_eval('coc#rpc#ready()') then
        fn.CocActionAsync('doHover')
    else
        api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
--]=====]

-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

