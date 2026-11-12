local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.front_end = "Software"
config.font = wezterm.font_with_fallback {
  { family = 'JetBrains Mono' },
  { family = 'Noto Sans CJK KR' },
}
config.font_size = 16.0
config.color_scheme = 'Dracula'
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
