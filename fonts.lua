local wezterm = require('wezterm')

local font = wezterm.font

local DPI_CHANGE_NUM = 90
local DPI_CHANGE_FONT_SIZE = 14

local prev_dpi = 0

wezterm.on('window-focus-changed', function(window, pane)
  local dpi = window:get_dimensions().dpi

  if dpi == prev_dpi then
    return
  end

  local overrides = window:get_config_overrides() or {}
  overrides.font_size = dpi >= DPI_CHANGE_NUM and DPI_CHANGE_FONT_SIZE or nil

  window:set_config_overrides(overrides)

  prev_dpi = dpi
end)

return {
  font = font('CaskaydiaCove Nerd Font', {
    weight = 'Regular',
    stretch = 'Normal',
    style = 'Normal',
  }),
  font_size = 16,
}
