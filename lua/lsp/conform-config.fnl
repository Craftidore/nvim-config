(local vim _G.vim)
{ ; Autoformat
  1 :stevearc/conform.nvim
  :event [:BufWritePre]
  :cmd [:ConformInfo]
  :keys [{ 1 :<leader>lF
           2 (fn [] ((. (require :conform) :format) { :async true :lsp_format :fallback }))
           :mode :n
           :desc "LSP: [F]ormat buffer"}]
  :opts 
  { :notify_on_error false
    :format_on_save 
    (fn [bufnr]
      ; Disable "format_on_save lsp_fallback" for languages that don't
      ; have a well standardized coding style. You can add additional
      ; languages here or re-enable it for the disabled ones.
      (local disable_filetypes { :c true :cpp true })
      (if (not (. disable_filetypes (. vim.bo bufnr :filetype)))
        { :timeout_ms 500 :lsp_format :fallback }
        nil))
    :formatters_by_ft {
      :lua [:stylua]
      :cpp [:clangd]
      ; python = { "isort", "black" },
      ; Conform can also run multiple formatters sequentially
      ;
      ; You can use 'stop_after_first' to run the first available formatter from the list
      ; javascript = { "prettierd", "prettier", stop_after_first = true },
    }}}

