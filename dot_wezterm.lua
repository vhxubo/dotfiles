local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = {}

-- 启动预加载标签
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:spawn_tab{
        cwd = "D:\\work"
    }
end)
config.leader = {
    key = "k",
    mods = "CTRL",
    timeout_milliseconds = 1500
}
config.keys = {{
    key = "_",
    mods = "LEADER|SHIFT",
    action = wezterm.action {
        SplitVertical = {
            domain = "CurrentPaneDomain"
        }
    }
}, {
    key = "v",
    mods = "LEADER|SHIFT",
    action = wezterm.action {
        SplitVertical = {
            domain = "CurrentPaneDomain"
        }
    }
}, {
    key = "|",
    mods = "LEADER|SHIFT",
    action = wezterm.action {
        SplitHorizontal = {
            domain = "CurrentPaneDomain"
        }
    }
}, {
    key = "h",
    mods = "LEADER|SHIFT",
    action = wezterm.action {
        SplitHorizontal = {
            domain = "CurrentPaneDomain"
        }
    }
}, {
    key = "w",
    mods = "LEADER",
    action = wezterm.action {
        CloseCurrentPane = {
            confirm = true
        }
    }
}, {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState
}}
config.color_scheme = 'tokyonight_moon'
config.default_cursor_style = 'BlinkingUnderline'
config.cursor_thickness = 2
config.font = wezterm.font_with_fallback {{
    family = "Maple Mono NF CN",
    weight = "Medium"
}, {
    family = "JetBrains Mono",
    weight = "Medium"
}, {
    family = "FiraCode Nerd Font Mono",
    weight = "Medium"
}}

config.font_size = 14
config.line_height = 1
config.use_cap_height_to_scale_fallback_fonts = false
config.adjust_window_size_when_changing_font_size = false
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.window_padding = {
    left = 0,
    right = 0,
    top = 6,
    bottom = 0
}

local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(launch_menu, {
        label = 'PowerShell',
        args = {'powershell.exe', '-NoLogo'}
    })
end

config.default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-NoLogo'}
config.default_cwd = "D:\\"
-- config.dpi = 300

config.window_background_opacity = 0.9
-- config.hide_tab_bar_if_only_one_tab = true
-- 禁用系统主题标签样式
config.use_fancy_tab_bar = false
-- 标签栏位置
-- config.tab_bar_at_bottom = true
config.launch_menu = launch_menu
config.window_decorations = "RESIZE"
return config
