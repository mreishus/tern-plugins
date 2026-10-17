# tabbar-bottom

Moves Tern's tab bar to the bottom of the window in the **tiles**,
**studio** and **float** layouts. It sits just above the status line
when the status line is shown, and otherwise at the very bottom.

A strip at the top is kept clear for the macOS traffic lights, and the
rest of that strip drags the window.

Only horizontal tabs are affected. With vertical tabs, or in other
layouts, the plugin does nothing.

## Install

```sh
tern plugin install github.com/mreishus/tern-plugins/tabbar-bottom
```

## Caveat

This plugin restyles Tern's own window chrome (`#tabbar`, `#panel`,
`.tn-stage`, `#tn-band` and the `--tn-bar` variable). These are
internals, not a documented plugin API, so a Tern update may break the
layout. If that happens, `tern plugin remove tabbar-bottom` puts
everything back.
