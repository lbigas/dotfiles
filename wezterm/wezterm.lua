local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'rose-pine'
config.font = wezterm.font('JetBrains Mono NL')
config.font_size = 11.0
config.hide_tab_bar_if_only_one_tab = true

return config
