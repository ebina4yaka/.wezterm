local wezterm = require('wezterm')

local M = {}

local target_triple = wezterm.target_triple

M.is_windows = target_triple == 'x86_64-pc-windows-msvc'
M.is_mac = target_triple == 'aarch64-apple-darwin'
M.is_linux = target_triple == 'x86_64-unknown-linux-gnu'

function M.merge_tables(t1, t2)
  for k, v in pairs(t2) do
    if (type(v) == 'table') and (type(t1[k] or false) == 'table') then
      M.merge_tables(t1[k], t2[k])
    else
      t1[k] = v
    end
  end
  return t1
end

return M
