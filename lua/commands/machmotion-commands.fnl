(local vim _G.vim)
(local api vim.api)
(local utils vim.g.utils)

; Might be better if this were a buf-local user command, but it's *fine*
(when (utils.is_machmotion)
  (api.nvim_create_user_command
    :CraftiCppLspEnable
    (fn []
      (tset vim.g :allow_cpp_lsp true)
      (vim.cmd "LspStart clangd")
      (vim.notify "C++ Lsp enabled" vim.log.levels.INFO))
    {}))
