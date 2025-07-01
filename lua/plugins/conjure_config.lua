local utils = vim.g.utils
local ConjureConfig = {
  'Olical/conjure',
  init = function()
    local g = vim.g
    g['conjure#mapping#log_split'] = 'els'
    g['conjure#mapping#log_vsplit'] = 'elv'
    g['conjure#mapping#log_tab'] = 'elt'
    g['conjure#mapping#log_buf'] = 'elt'
    g['conjure#mapping#log_tab'] = 'elt'
    g['conjure#mapping#log_toggle'] = 'elg'
    g['conjure#mapping#log_reset_soft'] = 'elr'
    g['conjure#mapping#log_reset_hard'] = 'elR'
    g['conjure#mapping#log_jump_to_latest'] = 'ell'
    g['conjure#mapping#log_close_visible'] = 'elq'
  end,
}

utils.defer.add_deferred(function()
  if utils.plugins.has_plugin('conjure.main') then
    utils.keymaps.wk_add({
      { '<leader>e', group = '[E]val with Conjure' },
    })
  end
end, 'which-key')

return ConjureConfig
