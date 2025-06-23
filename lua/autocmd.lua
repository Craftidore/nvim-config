local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local grps = {
  general = 'crafti.general',
  colorscheme = 'crafti.colorscheme',
}

-- NOTE: General

augroup(grps.general, { clear = true })

-- NOTE: Colorscheme

augroup(grps.colorscheme, { clear = true })

autocmd({ 'ColorschemePre' }, {
  group = grps.colorscheme,
  callback = function(_)
    vim.cmd([[highlight clear]])
  end,
})

autocmd({ 'Colorscheme' }, {
  group = grps.colorscheme,
  callback = function()
    -- TODO: Set custom highlights

    -- NOTE: buffer_manager.nvim
    -- `pastel color lightblue | pastel format hex`
    vim.api.nvim_set_hl(0, 'BufferManagerModified', { fg = '#add8e6' })
  end,
})
