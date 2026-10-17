# nvim-scrollback

Replaces Tern's **Open scrollback in editor** command, which normally
opens the scrollback in the system editor (TextEdit on macOS), with nvim
in a split next to the pane.

- It loads the pane's full scrollback, read with
  `tern capture <pane> --scrollback`, since the plugin API only returns
  the last 2000 lines.
- The cursor starts at the end, where the newest output is.
- The buffer isn't marked modified, so `:q` just closes it, and the
  split closes with nvim.

For panes that aren't terminals, Tern's built-in behavior is left alone.

## Requirements

`nvim` must be on the `PATH` of the shell Tern starts in new panes.

## Install

```sh
tern plugin install github.com/mreishus/tern-plugins/nvim-scrollback
```

## Options

The split opens to the right. To change that, edit `SPLIT` at the top of
`window.luau` (`"right"`, `"down"`, `"left"` or `"up"`).
