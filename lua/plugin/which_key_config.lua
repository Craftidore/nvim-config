local WhichKey = {
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'helix', -- display in bottom-right corner
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.o.timeoutlen
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    plugins = { -- default unless marked by empty comment
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 10, --
      },
      presets = {
        operators = false, --
        motions = false, --
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]pider Motions' },
      { '<leader>t', group = 'Telescope' },
      { '<leader>b', group = '[B]uffer' },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>l', group = '[L]SP' },
      { '<leader>lt', group = '[L]SP-Telescope' },
      { '<leader>o', group = '[O]pen' },
      { '<leader>u', group = 'Run [U]tility' },
    },
    win = {
      wo = {
        winblend = vim.g.winblend,
      },
    },
  },
}

return WhichKey
