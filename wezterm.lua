local utils = require 'utils'
local keys = require 'keys'
local fonts = require 'fonts'

local default_prog = { 'zsh', '-l' }
local launch_menu = {}

if utils.is_windows then
  default_prog = { 'pwsh.exe', '-NoLogo' }
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'pwsh.exe', '-NoLogo' },
  })
  table.insert(launch_menu, {
    label = 'Ubuntu (WSL2)',
    args = { 'wsl.exe', '~', '-d', 'Ubuntu' }
  })
  table.insert(launch_menu, {
    label = 'Kali Linux (WSL2)',
    args = { 'wsl.exe', '~', '-d', 'kali-linux' }
  })
end

local config = {
  use_ime = true,
  default_prog = default_prog,
  adjust_window_size_when_changing_font_size = true,
  launch_menu = launch_menu,
  keys = keys
}

local appearance_config = {
  hide_tab_bar_if_only_one_tab = true,
  font = fonts.font,
  font_size = fonts.font_size,
  text_background_opacity = 0.9,
  window_background_opacity = 0.85,
  color_scheme = 'Overnight Slumber',
}

return utils.merge_tables(config, appearance_config)
