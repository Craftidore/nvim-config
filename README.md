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

> [!IMPORTANT] LLMs
> 
> While I don't approve of LLM usage when coding, it is required for my job. My
> company is flexible enough to permit me to use my own tools, and with that I
> have chosen to use neovim using this config. Consequently, llm tools and
> plugins will be enabled when the MACHMOTION env var is set.

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

- Textwidth defaults to 100, 'cause 80s too restrictive
- `<leader>t` binds kinda annoying currently; look for better methods of doing
  such common actions.
- [/] SDate and LDate insertion functions (can iabbrev trigger lua func?)
    - Seems to be working? Check this again to make sure.
- [ ] Rewrite the next-to-word regex (well, lua pattern) for autopairs. It's triggering in situations I don't want it to too much.
- Surround with mini surround?
- See if I can get my MachMotion theme (currently kanagawa) to color the
    mini.status bar orange
    - They do have highlight groups; see `help mini.tabline`
- Try to better understand what the lsp config is doing
    - I'd like to rewrite it to be a bit cleaner
    - And much of it is not 100% understood since it came from kickstart.nvim
- Svelte setup needs to work better...
- [ ] Disable blink `()` for lisps. See `:help *blink-cmp-config-completion*` ->
  `/AUTO BRACKETS<CR>`
- [ ] Investigate https://github.com/saghen/blink.compat + https://github.com/PaterJason/cmp-conjure for conjure-related completion.
- [ ] Investigate highlighting for render markdown
- [x] nvim-ghengis, since I have which-key now
- [x] Increase Fold Level by 1
- [x] Figure out why emoji blink.cmp integration isn't working
    - It was a misplaced curly brace in blink cmp config, causing most of the
      config to be skipped.
