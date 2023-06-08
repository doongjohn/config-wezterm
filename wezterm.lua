local wezterm = require'wezterm'

-- https://github.com/wez/wezterm/issues/2090
local wsl_domains = wezterm.default_wsl_domains()
for _, domain in ipairs(wsl_domains) do
  domain.default_cwd = '~'
end

return {
  wsl_domains = wsl_domains,
  -- default_domain = 'WSL:openSUSE-Tumbleweed',
  default_prog = { 'pwsh.exe', '-nologo', '-wd', '~' },

  -- allow_win32_input_mode = false,

  -- key bindings
  keys = {
    { key = 'l', mods = 'ALT',
      action = 'ShowLauncher' },

    { key = '-', mods = 'ALT',
      action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },

    { key = '/', mods = 'ALT',
      action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
  },

  -- launch menu
  launch_menu = {
    {
      label = 'Powershell',
      args = { 'pwsh.exe', '-nologo', '-wd', '~' },
      domain = { DomainName = 'local' },
    },
  },

  -- font settings
  line_height = 1.5,
  font_size = 13.2,
  font = wezterm.font_with_fallback({
    'Hack Nerd Font',
    'NanumGothicCoding',
    'Segoe UI Emoji',
  }),
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
  adjust_window_size_when_changing_font_size = false,

  -- disable hyperlink
  hyperlink_rules = {{ regex = '', format = '', }},

  -- window
  window_decorations = "RESIZE",
  initial_cols = 120,
  initial_rows = 23,
  -- initial_cols = 80,
  -- initial_rows = 24,
  window_frame = {
    font_size = 10.0,
  },
  window_padding = {
    top = 4,
    bottom = 0,
    left = 10,
    right = 10,
  },

  -- tab bar settings
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 23,
  -- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  --   return {
  --     { Text = " " .. tab.tab_index .. ": " .. wezterm.truncate_left(tab.active_pane.title, max_width + 2) },
  --   }
  -- end),

  -- kanagawa color scheme
  colors = {
    tab_bar = {
      background = '#1f1f28',
      active_tab = {
        fg_color = '#DCD7BA',
        bg_color = '#1F1F28',
      },
      inactive_tab = {
        bg_color = '#2A2A37',
        fg_color = '#C8C093',
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
    foreground = '#dcd7ba',
    background = '#1f1f28',
    cursor_bg = '#c8c093',
    cursor_border = '#c8c093',
    selection_fg = '#c8c093',
    selection_bg = '#2d4f67',
    scrollbar_thumb = '#16161d',
    split = '#16161d',
    ansi = {
      '#090618',
      '#c34043',
      '#76946a',
      '#c0a36e',
      '#7e9cd8',
      '#957fb8',
      '#6a9589',
      '#c8c093'
    },
    brights = {
      '#727169',
      '#e82424',
      '#98bb6c',
      '#e6c384',
      '#7fb4ca',
      '#938aa9',
      '#7aa89f',
      '#dcd7ba'
    },
    indexed = {
      [16] = '#ffa066',
      [17] = '#223249'
      -- [17] = '#ff5d62'
    },
  },
}
