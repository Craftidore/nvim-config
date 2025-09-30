{1 :MeanderingProgrammer/render-markdown.nvim
 :dependencies [:nvim-treesitter/nvim-treesitter :nvim-tree/nvim-web-devicons]
 ; if you prefer nvim-web-devicons
 :opts {:completions {:blink {:enabled true}}
        :checkbox {:custom {:todo {}
                            :dropped {:raw "[-]"
                                      :rendered "‒ "
                                      :highlight :RenderMarkdownChecked
                                      :scope_highlight nil}
                            :date {:raw "[D]"
                                   :rendered "📆"
                                   :highlight :RenderMarkdownChecked
                                   :scope_highlight nil}
                            :forward {:raw "[>]"
                                      :rendered "🛫"
                                      :highlight :RenderMarkdownChecked
                                      :scope_highlight nil}
                            :question {:raw "[?]"
                                       :rendered "❓"
                                       :highlight :RenderMarkdownChecked
                                       :scope_highlight nil}
                            :half-done {:raw "[/]"
                                        :rendered "◩ "
                                        :highlight :RenderMarkdownChecked
                                        :scope_highlight nil}}}}}
