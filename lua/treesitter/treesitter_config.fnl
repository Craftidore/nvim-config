(local utils _G.vim.g.utils)
(local treesitter-config
  { ; Other plugins
    ; - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    ; - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    ; - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

    1 :nvim-treesitter/nvim-treesitter
    :keys [{1 :<leader>ot 2 :<CMD>TSContext<CR> :mode :n :desc "Open [t]reesitter Info"}]
    :lazy false
    :branch :main
    :build ":TSUpdate"
    :opts
    { ; install_dir = vim.fn.stdpath('data') .. '/site/',
    }     
    :config 
    (fn [lazy_opts]
      ((. (require :nvim-treesitter) :setup) lazy_opts.opts)
      (utils.defer.run :nvim-treesitter))})

(utils.defer.add_deferred 
  (fn []
    (local auto-install [
      :bash
      :c
      :cpp
      :diff
      :lua
      :luadoc
      :markdown
      :markdown_inline
      :query
      :vim
      :vimdoc
      :xml
      :json
      :javascript
      :svelte])
    (: ((. (require :nvim-treesitter) :install) auto-install) :wait 300000)); max. 5 minutes
  :nvim-treesitter) 

treesitter-config
