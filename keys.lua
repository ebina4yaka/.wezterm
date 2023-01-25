local wezterm = require('wezterm')
local act = wezterm.action

local utils = require('utils')

local keys = {
  { key = 'k', mods = 'ALT', action = act({ SpawnTab = 'CurrentPaneDomain' }) },
  { key = 'j', mods = 'ALT', action = act({ CloseCurrentTab = { confirm = true } }) },
  { key = 'h', mods = 'ALT', action = act({ ActivateTabRelative = -1 }) },
  { key = 'l', mods = 'ALT', action = act({ ActivateTabRelative = 1 }) },
  { key = 'h', mods = 'ALT|CTRL', action = act({ MoveTabRelative = -1 }) },
  { key = 'l', mods = 'ALT|CTRL', action = act({ MoveTabRelative = 1 }) },
  --{ key = "k", mods = "ALT|CTRL", action = act.ActivateCopyMode },
  {
    key = 'k',
    mods = 'ALT|CTRL',
    action = act.Multiple({ act.CopyMode('ClearSelectionMode'), act.ActivateCopyMode, act.ClearSelection }),
  },
  { key = 'j', mods = 'ALT|CTRL', action = act({ PasteFrom = 'PrimarySelection' }) },
  { key = '1', mods = 'ALT', action = act({ ActivateTab = 0 }) },
  { key = '2', mods = 'ALT', action = act({ ActivateTab = 1 }) },
  { key = '3', mods = 'ALT', action = act({ ActivateTab = 2 }) },
  { key = '4', mods = 'ALT', action = act({ ActivateTab = 3 }) },
  { key = '5', mods = 'ALT', action = act({ ActivateTab = 4 }) },
  { key = '6', mods = 'ALT', action = act({ ActivateTab = 5 }) },
  { key = '7', mods = 'ALT', action = act({ ActivateTab = 6 }) },
  { key = '8', mods = 'ALT', action = act({ ActivateTab = 7 }) },
  { key = '9', mods = 'ALT', action = act({ ActivateTab = 8 }) },
  { key = '[', mods = 'ALT', action = act({ SplitVertical = { domain = 'CurrentPaneDomain' } }) },
  { key = ']', mods = 'ALT', action = act({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
  { key = 'h', mods = 'ALT|SHIFT', action = act({ ActivatePaneDirection = 'Left' }) },
  { key = 'l', mods = 'ALT|SHIFT', action = act({ ActivatePaneDirection = 'Right' }) },
  { key = 'k', mods = 'ALT|SHIFT', action = act({ ActivatePaneDirection = 'Up' }) },
  { key = 'j', mods = 'ALT|SHIFT', action = act({ ActivatePaneDirection = 'Down' }) },
  { key = 'h', mods = 'ALT|SHIFT|CTRL', action = act({ AdjustPaneSize = { 'Left', 1 } }) },
  { key = 'l', mods = 'ALT|SHIFT|CTRL', action = act({ AdjustPaneSize = { 'Right', 1 } }) },
  { key = 'k', mods = 'ALT|SHIFT|CTRL', action = act({ AdjustPaneSize = { 'Up', 1 } }) },
  { key = 'j', mods = 'ALT|SHIFT|CTRL', action = act({ AdjustPaneSize = { 'Down', 1 } }) },
  { key = 'Enter', mods = 'ALT', action = 'QuickSelect' },
  { key = '/', mods = 'ALT', action = act.Search('CurrentSelectionOrEmptyString') },
}

if utils.is_windows then
  table.remove(keys, 1)
  table.insert(keys, { key = 'k', mods = 'ALT', action = act.ShowLauncher })
end

return keys
