-- gruvbox-dim palette
local M = {}

M.colors = {
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
  gray = "#928374",
}

M.get_base_colors = function(bg, contrast)
  local config = require("gruvbox-dim").config
  local p = M.colors

  for k, v in pairs(config.palette_overrides) do
    p[k] = v
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark2,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light2,
      fg1 = p.light3,
      fg2 = p.light4,
      fg3 = p.light4,
      fg4 = p.light4,
      red = p.neutral_red,
      green = p.neutral_green,
      yellow = p.neutral_yellow,
      blue = p.neutral_blue,
      purple = p.neutral_purple,
      aqua = p.neutral_aqua,
      orange = p.neutral_orange,
      neutral_red = p.faded_red,
      neutral_green = p.faded_green,
      neutral_yellow = p.faded_yellow,
      neutral_blue = p.faded_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark2,
      fg1 = p.dark3,
      fg2 = p.dark4,
      fg3 = p.dark4,
      fg4 = p.dark4,
      red = p.neutral_red,
      green = p.neutral_green,
      yellow = p.neutral_yellow,
      blue = p.neutral_blue,
      purple = p.neutral_purple,
      aqua = p.neutral_aqua,
      orange = p.neutral_orange,
      neutral_red = p.bright_red,
      neutral_green = p.bright_green,
      neutral_yellow = p.bright_yellow,
      neutral_blue = p.bright_blue,
      neutral_purple = p.bright_purple,
      neutral_aqua = p.bright_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
