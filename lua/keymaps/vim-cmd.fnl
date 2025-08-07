(local utils _G.vim.g.utils)
(local Keymaps utils.keymaps)
(local g _G.vim.g)
(Keymaps.noremap
  :c :<C-f>
  (.. :<C-f><C-w>
      (if (not= g.cmdline_auto_height nil)
        (tostring g.cmdline_auto_height) "3")
      :_a)
  "Open cmdline-window")	
