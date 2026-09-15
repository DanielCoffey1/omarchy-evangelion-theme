-- Evangelion / Unit-01
local active = { colors = { "rgba(a38be8ff)", "rgba(a6ed47ff)" }, angle = 45 }
hl.config({
  general = { gaps_in = 5, gaps_out = 12, border_size = 2,
    col = { active_border = active, inactive_border = "rgba(45335fcc)" } },
  decoration = { rounding = 2, shadow = { enabled = true, range = 18, render_power = 3, color = "rgba(08060dcc)" } },
  group = { col = { border_active = active, border_inactive = "rgba(45335fcc)" } },
})
