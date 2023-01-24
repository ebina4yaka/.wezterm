local wezterm = require 'wezterm'


local font = wezterm.font

return {
  font = font(
    "CaskaydiaCove Nerd Font",
    {
      weight = "Regular",
      stretch = "Normal",
      style = "Normal"
    }
  ),
  font_size = 15,
}
