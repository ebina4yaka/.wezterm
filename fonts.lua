local wezterm = require('wezterm')

local font = wezterm.font

local dpi_change_num = 96
local dpi_change_font_size = 13

local prev_dpi = 0

wezterm.on('window-focus-changed', function(window, pane)
  local dpi = window:get_dimensions().dpi

  if dpi == prev_dpi then
    return
  end

  local overrides = window:get_config_overrides() or {}

  overrides.font_size = dpi >= dpi_change_num and dpi_change_font_size or nil
  window:set_config_overrides(overrides)

  prev_dpi = dpi
end)

return {
  font = font('0xProto', {
    weight = 'Medium',
  }),
  font_size = 16,
}
