local wezterm = require 'wezterm'

local config = {}
config.color_scheme = 'tokyonight_moon'
config.default_cursor_style = 'BlinkingUnderline'
config.cursor_thickness = 3
config.font = wezterm.font_with_fallback {
  { family = "JetBrains Mono", weight = "Light" },
  { family = "FiraCode Nerd Font Mono", weight = "Regular" },
}
config.use_ime = true
config.xim_im_name = "fcitx5"
config.font_size = 13
config.line_height = 1.2
config.use_cap_height_to_scale_fallback_fonts = true
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 0,
  right = 0,
  top = 6,
  bottom = 0,
}
config.window_frame = {
  font = wezterm.font({ family = "FiraCode Nerd Font Mono" }),
}

return config
