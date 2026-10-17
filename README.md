# tern-plugins

Small plugins for the [Tern](https://docs.stencil.so/tern/) terminal.
Tested on Tern 0.8.x.

| Plugin | What it does |
| --- | --- |
| [tabbar-bottom](tabbar-bottom/) | Moves the tab bar to the bottom of the window in the tiles, studio and float layouts |
| [nvim-scrollback](nvim-scrollback/) | Opens a pane's scrollback in nvim in a split instead of the system editor |

## Install

Install a plugin straight from this repo:

```sh
tern plugin install github.com/mreishus/tern-plugins/tabbar-bottom
tern plugin install github.com/mreishus/tern-plugins/nvim-scrollback
```

To update one, run the same command with `--force`. To remove one, run
`tern plugin remove tabbar-bottom`.

To hack on them, clone the repo and link a plugin from where it is, so
your edits reload as you save:

```sh
git clone https://github.com/mreishus/tern-plugins
tern plugin link tern-plugins/tabbar-bottom
```

## License

MIT
