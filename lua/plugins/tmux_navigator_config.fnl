; NOTE: I was running into issues with nvim inside
;       of a podman/distrobox container screwing things up
{ 1 :christoomey/vim-tmux-navigator
  :enabled false
  :cmd { :TmuxNavigateLeft
         :TmuxNavigateDown
         :TmuxNavigateUp
         :TmuxNavigateRight
         :TmuxNavigatePrevious
         :TmuxNavigatorProcessList}
  :keys [[:<c-w><c-h>  :<cmd>TmuxNavigateLeft<cr>]
         [:<c-w><c-j>  :<cmd>TmuxNavigateDown<cr>]
         [:<c-w><c-k>  :<cmd>TmuxNavigateUp<cr>]
         [:<c-w><c-l>  :<cmd>TmuxNavigateRight<cr>]
         [:<c-w><c-\> :<cmd>TmuxNavigatePrevious<cr>]]}

