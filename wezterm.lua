local wezterm = require'wezterm'

return {
  -- default shell
  default_prog = { 'wsl', '-d', 'void', '--cd', '~' },

  -- key bindings
  keys = {
    { key = 'l', mods = 'ALT', action = 'ShowLauncher' },
  },

  -- launch menu
  launch_menu = {
    {
      label = 'Powershell',
      args = { 'pwsh', '-nologo' },
    },
  },

  -- font settings
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
  line_height = 1.34,
  font_size = 14,
  font = wezterm.font_with_fallback({
    'VictorMono NF', -- nerd font
    'NanumGothicCoding', -- korean font
    'Cambria Math', -- NOTE: some math symbols mess up neovim...
    'Segoe UI Emoji',
  }),
  adjust_window_size_when_changing_font_size = false,

  -- disable hyperlink
  hyperlink_rules = {{ regex = '', format = '', }},

  -- window
  window_decorations = "RESIZE",
  initial_cols = 120,
  initial_rows = 23,
  window_frame = {
    font_size = 10.0,
  },
  window_padding = {
    top = 4,
    bottom = 0,
    left = 12,
    right = 12,
  },

  -- tab bar settings
  use_fancy_tab_bar = false,

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
      [17] = '#ff5d62'
    },
  },
}
