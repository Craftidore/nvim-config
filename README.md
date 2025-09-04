Issue with lazy or blink or something:

Had to go into `~/.local/share/nvim/lazy/blink.cmp/` and run `git checkout v1.3.1`
since lazy was installing the wrong version for whatever reason.
I may have fixed that now, I'm not sure.

When upgrading from the old config, you may need to delete the `~/.local/share/nvim/mason/` directory.

## Keybind Namespaces

- `<leader>s`: spider motions
- `<leader>b`: buffer commands
- `<leader>t`: Telescope
- `<leader>l`: LSP
- `<leader>h`: Harpoon
- `<leader>lt`: LSP-Telescope
- `<leader>o`: Open XXX
- `<leader>u`: Run XXX/Util
- `<leader>y/c/d/p/Y/C/D/P`: system copy, cut and paste
- `<C-w>`: window/split/tab commands
- Uncategorized, but don't currently plan to remap:
    - `ZF`: Write buffer
    - `jj`/`jk`: Esc alternate option
    - `X`: Delete char from end of line
    - `s`/`S`: leap.nvim
    - `<M-CR>`: Break line, deleting character beneath cursor (for spliting
      lines on space)
- Uncategorized and need to remap:
    - Nothing right now

## MachMotion

I don't keep a separate config for doing work for my job.
Consequently, when doing [machmotion](<https://machmotion.com>) work, set the following environment var:

```bash
MACHMOTION='true'
```

An additional dependency of `svn` is necessary when doing work for MachMotion.

## Structure Notes

- General keymaps go in lua/keymaps/
- Plugin specific keymaps go in the plugin config file itself
    - Preferably as the `keys` param of lazy spec
    - Barring that, using `utils.keymaps.noremap` inside `config`
- Post-plugin-load behavior should be listed in the plugin's lazy config as a function deferred on the plugin name
    - `util.defer.run('plugin-name')` is called in the config function for plugins that need it
    - This is done so post-plugin actions are stored with the config, even though its more verbose
- LSP-related plugins are complex and such and go in the `lua/lsp` folder instead of the `lua/plugins` folder
- `plugin/` is used to auto-load `lua/{commands,keymaps,options}/*.lua`

## TODO

- [x] Investigate sessions (mksession works, but mini.sessions may be better qol
    wise)
    - Planning not to use this for now. mksession works.
- [x] quick textwidth (80) enable/disable (`gq` to format with textwidth)
- [x] Separate out util namespaces into separate files
- [x] Require-all-in-directory util function, to populate table
    - For use with util namespaces
- [x] Check to see if lazy can load from a folder, and if so, how. Update: Use
    import key of lazy config table
    - Ok, so, it's `spec = { { import = 'path' }, { import = 'other-path' } }`
- [x] Move files that should always be loaded into `~/config/nvim/plugin` rather
- [x] MachMotion nvim instance was having issues installing parsers from treesitter & would hang.
    - Copying parsers manually from my primary install fixed it, but dunno why it was an issue in the first place.
    - Dunno if it was a service outage or a genuine issue with that distrobox
    - Issue was that treesitter-cli wasn't installed. Has been added to dependencies.txt
- [x] Fennel Switch
    - Investigate switch to fennel?
    - (Because lisp is fun, not because this needs it)
    - https://miguelcrespo.co/posts/configuring-neovim-with-fennel
    - udayvir-singh/tangerine.nvim
    - miguelcrespo/scratch-buffer.nvim
    - Olical/conjure
    - Update: Decided to go with Olical/nfnl
- [x] ~~Investigate abbreviation~~
    - Abbreviations are neat, will probably use snippets except for one-off things
- [x] ~~See if Noice lets me do the vim buffer editing~~
    - It does not; I think I'll experiment with `<C-f>` -> `<C-f>a` for now
- Surround with mini surround?
- Investigate [local] AI integration for work
    - Even if its just to prove to my boss that it won't make me meaningfully
        faster
- See if I can get my MachMotion theme (currently kanagawa) to color the
    mini.status bar orange
    - They do have highlight groups; see `help mini.tabline`
- Try to better understand what the lsp config is doing
    - I'd like to rewrite it to be a bit cleaner
    - And much of it is not 100% understood since it came from kickstart.nvim
- [x] Investigate https://github.com/julienvincent/nvim-paredit
- [ ] Rewrite the next-to-word regex (well, lua pattern) for autopairs. It's triggering in situations I don't want it to too much.
- [x] LSP Enable b and g flags for MachMotion + Cmd which sets them + launches lsp
- [x] Auto-enable text-width for markdown and tex
- [/] SDate and LDate insertion functions (can iabbrev trigger lua func?)
- [x] Check where `nvim_feedkeys` is getting used where `nvim_paste` or
  `nvim_buf_set_text` would be preferred.
- [ ] Disable blink `()` for lisps. See `:help *blink-cmp-config-appearance*` ->
  `/AUTO BRACKETS<CR>`
- [ ] Investigate https://github.com/saghen/blink.compat + https://github.com/PaterJason/cmp-conjure for conjure-related completion.
- [ ] Investigate whatever the markdown renderer is to see if I can get better
  checkbox icon support in a fork of it.
- [ ] nvim-ghengis, since I have which-key now
- [ ] Increase Fold Level by 1
