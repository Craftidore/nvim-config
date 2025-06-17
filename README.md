Issue with lazy or blink or something:

Had to go into `~/.local/share/nvim/lazy/blink.cmp/` and run `git checkout v1.3.1`
since lazy was installing the wrong version for whatever reason.
I may have fixed that now, I'm not sure.

When upgrading from the old config, you may need to delete the `~/.local/share/nvim/mason/` directory.

## MachMotion

I don't keep a separate config for doing work for my job.
Consequently, when doing [machmotion](<https://machmotion.com>) work, set the following environment var:

```bash
MACHMOTION='true'
```

An additional dependency of `svn` is necessary when doing work for MachMotion.
