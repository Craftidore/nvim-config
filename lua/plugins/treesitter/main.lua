require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash","c","c_sharp","cmake","commonlisp","cpp","css","dockerfile","gitattributes","gitignore","go","haskell","html","java","javascript","json","latex","lua","make","markdown","php","python","scss","svelte","sxhkdrc","toml","typescript","vim","vue","yaml"},-- can also be set to "all"

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
}
