local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.front_end = "Software"
config.font = wezterm.font_with_fallback {
  { family = 'JetBrains Mono' },
  { family = 'Noto Sans CJK KR' },
  { family = 'Symbols Nerd Font Mono' },
}
config.font_size = 16.0
config.colors = {
  foreground = '#ffffff',
  background = '#000000',
  cursor_bg = '#ffffff',
  cursor_fg = '#242424',
  cursor_border = '#ffffff',
  selection_fg = '#ffffff',
  selection_bg = '#3584e4',
  scrollbar_thumb = '#5e5c64',
  split = '#5e5c64',
  ansi = {
    '#241f31', '#c01c28', '#2ec27e', '#f5c211',
    '#1e78e4', '#9841bb', '#0ab9dc', '#c0bfbc',
  },
  brights = {
    '#5e5c64', '#ed333b', '#57e389', '#f8e45c',
    '#51a1ff', '#c061cb', '#4fd2fd', '#f6f5f4',
  },
}
config.window_background_opacity = 1.0
config.adjust_window_size_when_changing_font_size = false

config.keys = {
  { key = 'o', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'e', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab { DomainId = 0 } },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { domain = 'CurrentPaneDomain', confirm = true } },
  { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
}

return config
