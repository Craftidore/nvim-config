local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = 'colorscheme'

augroup(group, { clear = true })

-- NOTE: This used to fix an issue with colors carrying over between colorschemes,
--       but that's not happening now, so its disabled.

autocmd({ 'ColorschemePre' }, {
  group = group,
  callback = function(ev)
    if vim.g.colors_name == 'sonokai' or string.find(ev.match, 'kanagawa') then
      vim.cmd([[highlight clear]])
    end
  end,
})

autocmd({ 'Colorscheme' }, {
  group = group,
  callback = function(ev)
    if ev.match == 'minicyan' or ev.match == 'minischeme' then
      -- This is inconsistent and it bugs me
      local cline_hl = vim.api.nvim_get_hl(0, { name = 'CursorLine', create = false })
      vim.api.nvim_set_hl(0, 'CursorLineSign', { ctermbg = cline_hl.ctermbg, bg = cline_hl.bg })
    end
  end,
})

autocmd({ 'Colorscheme' }, {
  group = group,
  callback = function()
    -- TODO: Set custom highlights

    -- NOTE: buffer_manager.nvim
    -- `pastel color lightblue | pastel format hex`
    vim.api.nvim_set_hl(0, 'BufferManagerModified', { fg = '#add8e6' })
  end,
})
