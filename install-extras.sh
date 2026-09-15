#!/usr/bin/env bash
# Explicitly install the desktop settings that Omarchy themes cannot apply.
set -euo pipefail

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
config_dir=${XDG_CONFIG_HOME:-$HOME/.config}
state_dir=${XDG_STATE_HOME:-$HOME/.local/state}
look="$config_dir/hypr/looknfeel.lua"
prompt="$config_dir/starship.toml"
command -v hyprctl >/dev/null
[[ -f "$look" ]] || { echo "Expected Omarchy Lua configuration at $look" >&2; exit 1; }

mkdir -p "$state_dir/evangelion-extras"
backup=$(mktemp -d "$state_dir/evangelion-extras/backup.XXXXXXXX")
cp -p -- "$look" "$backup/looknfeel.lua"
if [[ -e "$prompt" ]]; then
  cp -p -- "$prompt" "$backup/starship.toml"
else
  touch "$backup/starship-was-absent"
fi
echo "Original settings backed up to: $backup"

if ! grep -q '^-- BEGIN EVANGELION EXTRAS$' "$look"; then
  cat >> "$look" <<'LUA'

-- BEGIN EVANGELION EXTRAS
-- These appearance settings persist when switching themes.
hl.config({
  general = { gaps_in = 5, gaps_out = 12, border_size = 2 },
  decoration = {
    rounding = 2,
    shadow = { enabled = true, range = 18, render_power = 3, color = "rgba(08060dcc)" },
  },
})
-- END EVANGELION EXTRAS
LUA
fi
cp -- "$source_dir/extras/starship.toml" "$prompt"
hyprctl reload
errors=$(hyprctl configerrors)
if [[ -n "$errors" && "$errors" != "ok" ]]; then
  printf 'Hyprland reported configuration errors:\n%s\nBackup: %s\n' "$errors" "$backup" >&2
  exit 1
fi
echo "Evangelion window styling and EVA·01 prompt installed. Open a new terminal to see the prompt."
