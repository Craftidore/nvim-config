local RipSubstituteConf = {
  'chrisgrieser/nvim-rip-substitute',
  cmd = 'RipSubstitute',
  opts = {},
  keys = {
    {
      '<leader>us',
      function()
        require('rip-substitute').sub()
      end,
      mode = { 'n', 'x' },
      desc = ' rip substitute',
    },
  },
}

return RipSubstituteConf
