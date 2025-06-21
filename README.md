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
- Uncategorized: (worth remapping elsewhere)
    - `<leader>w/e/b`: spider-motion
    - `ZF`: Write buffer
    - `jj`/`jk`: Esc alternate option
    - `X`: Delete char from end of line
    - `s`/`S`: leap.nvim

## MachMotion

I don't keep a separate config for doing work for my job.
Consequently, when doing [machmotion](<https://machmotion.com>) work, set the following environment var:

```bash
MACHMOTION='true'
```

An additional dependency of `svn` is necessary when doing work for MachMotion.

## TODO

- Investigate abbreviation
- Surround with mini surround?
- Investigate sessions (mksession works, but mini.sessions may be better qol wise)
- ~~See if noice lets me do the vim buffer editing~~
    - It does not; I think I'll experiment with `<C-f>` -> `<C-f>a` for now
- quick textwidth (80) enable/disable (`gq` to format with textwidth)
- Keymaps
    - Open Lazy
    - Open Mason
    - Open TS List of things
- Fennel Switch
    - Investigate switch to fennel?
    - (Because lisp is fun, not because this needs it)
    - https://miguelcrespo.co/posts/configuring-neovim-with-fennel
    - https://github.com/udayvir-singh/tangerine.nvim
    - miguelcrespo/scratch-buffer.nvim
    - Olical/conjure
- Separate out util namespaces into separate files
- See if I can get my MachMotion theme (currently night-owl) to color the mini.status bar orange

