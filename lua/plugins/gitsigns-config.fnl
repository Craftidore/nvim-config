(local utils vim.g.utils)
(local gitsigns-config
       {1 :lewis6991/gitsigns.nvim
        :enabled (not (utils.is_machmotion))
        :event :VeryLazy
        :opts {:signs {:add {:text "+"}
                       :change {:text "~"}
                       :topdelete {:text "‾"}}}})
                       :delete {:text "_"}
                       :changedelete {:text "~"}
gitsigns-config	

