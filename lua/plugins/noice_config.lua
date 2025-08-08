-- [nfnl] lua/plugins/noice_config.fnl
local noice_config = {"folke/noice.nvim", event = "VeryLazy", opts = {lsp = {override = {["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true, ["cmp.entry.get_documentation"] = true}}, presets = {bottom_search = true, command_palette = true, long_message_to_split = true, inc_rename = false, lsp_doc_border = false}}, dependencies = {"MunifTanjim/nui.nvim"}, enabled = false}
return noice_config
