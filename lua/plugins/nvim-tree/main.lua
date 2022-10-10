-- empty setup using defaults
if not vim.g["started_by_firenvim"] then
    require("nvim-tree").setup()
end

-- or setup with some options
--require("nvim-tree").setup({
--  sort_by = "case_sensitive",
--  view = {
--    adaptive_size = true,
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
--})
-- For more info on config, :help nvim-tree-setup
