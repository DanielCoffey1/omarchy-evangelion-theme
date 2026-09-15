# Evangelion — Unit-01

Original 2880×1800 vector wallpaper, deep purple surfaces, acid-green accents,
orange alerts, purple icons, angular gradient borders, and a 30px status bar.
Omarchy generates matching palettes for its supported terminals, launcher,
notifications, lock screen, editors, browser, and system tools from colors.toml.
Applications may need reopening to pick up their generated theme.

![Evangelion Unit-01 wallpaper](backgrounds/01-unit-01.png)

## Installation

```sh
omarchy theme install https://github.com/DanielCoffey1/omarchy-evangelion-theme
```

The installer applies Evangelion automatically.

### Complete appearance

To also reproduce the original window spacing, sharp corners, shadows, and
EVA·01 terminal prompt, review and run the included setup script:

```sh
less ~/.config/omarchy/themes/evangelion/install-extras.sh
bash ~/.config/omarchy/themes/evangelion/install-extras.sh
```

This appends the window styling to `~/.config/hypr/looknfeel.lua` and replaces
`~/.config/starship.toml` with the included prompt. It backs up both files in
`~/.local/state/evangelion-extras/backup.*` and prints the exact backup directory.
These extra settings persist when switching themes. Open a new terminal after
setup. The prompt requires Starship, as provided by Omarchy.

To undo the extras, copy `looknfeel.lua` and `starship.toml` from the printed
backup directory to their original locations, then run `hyprctl reload`. If the
backup contains `starship-was-absent`, remove the installed `starship.toml` instead.

Wallpaper source: `wallpaper.svg`; rendered desktop asset: `backgrounds/01-unit-01.png`.

## Compatibility

Omarchy generates application themes and Hyprland border colors from
`colors.toml`. Omarchy deliberately skips Lua and terminal configuration files
supplied by theme repositories. The explicit extras setup above installs the
remaining appearance settings into your user configuration. The normal theme
installation supplies the colors, gradient borders, icons, bar styling, and
wallpaper; run both steps for the complete appearance on a compatible Omarchy
desktop. Fonts, display scaling, and application versions can affect rendering.
