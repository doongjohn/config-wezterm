local wezterm = require 'wezterm'
local mux = wezterm.mux
local home = os.getenv('USERPROFILE')

for _, domain in ipairs(wezterm.default_wsl_domains()) do
  -- https://github.com/wez/wezterm/issues/2090
  domain.default_cwd = '~'
end

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  -- https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
  local title = tab_title(tab)
  if tab.is_active then
    return {
      { Text = '  ' .. title .. '  ' },
    }
  end
  return '  ' .. title .. '  '
end)

return {
  front_end = 'WebGpu',
  default_prog = { 'nu' },
  hyperlink_rules = {{ regex = '', format = '', }}, -- disable hyperlink

  launch_menu = {
    {
      label = 'Powershell',
      args = { 'pwsh.exe', '-nologo', '-wd', '~' },
      domain = { DomainName = 'local' },
    },
    {
      label = 'Visual Studio Developer cmd',
      args = { 'cmd.exe', '/k', 'C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\Build\\vcvars64.bat' },
      domain = { DomainName = 'local' },
    },
    {
      label = 'MSYS2',
      args = { home .. '/msys2/usr/bin/env.exe', 'MSYS=enable_pcon', 'MSYSTEM=MSYS', 'MSYS2_PATH_TYPE=inherit', '/bin/bash', '--login' },
      domain = { DomainName = 'local' },
    }
  },

  -- font settings
  line_height = 1.25,
  font_size = 14,
  font = wezterm.font_with_fallback({
    'Hack Nerd Font',
    'Sarasa Fixed K',
    'Segoe UI Emoji',
  }),
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
  adjust_window_size_when_changing_font_size = false,

  -- key bindings
  keys = {
    { key = ';', mods = 'ALT', action = 'ShowLauncher' },
    { key = '/', mods = 'CTRL', action = wezterm.action { SendString = '\x1b[47;5u' } },
    { key = '-', mods = 'ALT', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
    { key = '/', mods = 'ALT', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
  },

  -- window
  window_decorations = 'RESIZE',
  initial_cols = 90,
  initial_rows = 18,
  window_frame = {
    font_size = 10.0,
  },
  window_padding = {
    top = 4,
    bottom = 0,
    left = 10,
    right = 10,
  },

  -- command palette
  command_palette_bg_color = '#2A2A37',
  command_palette_fg_color = '#dcd7ba',

  -- tab bar
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = false,
  tab_max_width = 23,

  -- kanagawa color scheme
  colors = {
    tab_bar = {
      background = '#2A2A37',
      active_tab = {
        fg_color = '#dcd7ba',
        bg_color = '#1f1f28',
      },
      inactive_tab = {
        bg_color = '#2A2A37',
        fg_color = '#727169',
      },
      inactive_tab_hover = {
        bg_color = '#363646',
        fg_color = '#C8C093',
        italic = false,
      },
      new_tab = {
        bg_color = '#2A2A37',
        fg_color = '#C8C093',
      },
      new_tab_hover = {
        bg_color = '#363646',
        fg_color = '#C8C093',
        italic = false,
      },
    },

    -- kanagawa
    foreground = "#dcd7ba",
    background = "#1f1f28",

    cursor_bg = "#ccc598",
    cursor_fg = "#1f1f28",
    cursor_border = "#ccc598",

    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",

    scrollbar_thumb = "#16161d",
    split = "#16161d",

    ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
    brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#fcf5d4" },
    -- indexed = { [16] = "#2A2A37", [17] = "#16161D" },
  },
}
