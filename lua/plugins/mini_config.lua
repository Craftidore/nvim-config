local MiniConfig = {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    -- require('mini.ai').setup({ n_lines = 500 })

    -- Simple and easy statusline.
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = vim.g.have_nerd_font })

    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    local starter = require('mini.starter')
    starter.setup({

      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning('center', 'center'),
      },
      -- 'Z' absent so ZZ functions porperly
      query_updaters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY0123456789_-.',
      silent = true,
    })
    local tabline = require('mini.tabline')
    tabline.setup({
      show_icons = true,
      function(buf_id, label)
        local suffix = vim.bo[buf_id].modified and '* ' or ''
        return MiniTabline.default_format(buf_id, label) .. suffix
      end,
      tabpage_section = 'left',
    }) -- Perfect status line for my needs
    -- require('mini.files').setup() -- I like Oil better
    require('mini.notify').setup({
      lsp_progress = {
        enable = false, -- I like fidget better...
      },
      window = {
        winblend = vim.g.winblend,
      },
    })
    vim.notify = require('mini.notify').make_notify()
  end,
}

return MiniConfig
