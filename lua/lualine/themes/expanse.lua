-- Lualine theme: Expanse — MCRN Rocinante Command Interface

local bg     = "#060a10"  -- panel background
local fg     = "#7ecfcf"  -- primary cyan
local fg_dim = "#4a8a9a"  -- secondary / inactive

local colors = {
  bg       = bg,
  fg       = fg,
  fg_dim   = fg_dim,
  amber    = "#e8c97a",  -- cursor/command input
  gold     = "#c8a96e",  -- warm gold / visual
  cyan     = "#7ecfcf",  -- normal mode
  green    = "#5ec98e",  -- ok/nominal
  red      = "#ff6b47",  -- error/alert
  orange   = "#ff9a3c",  -- replace / warning
  blue     = "#2a6a7a",  -- inactive accent
}

return {
  normal = {
    a = { fg = bg,         bg = colors.cyan,   gui = "bold" },
    b = { fg = fg,         bg = bg },
    c = { fg = fg_dim,     bg = bg },
  },
  insert = {
    a = { fg = bg,         bg = colors.amber,  gui = "bold" },
    b = { fg = fg,         bg = bg },
    c = { fg = fg_dim,     bg = bg },
  },
  visual = {
    a = { fg = bg,         bg = colors.gold,   gui = "bold" },
    b = { fg = fg,         bg = bg },
    c = { fg = fg_dim,     bg = bg },
  },
  replace = {
    a = { fg = bg,         bg = colors.orange, gui = "bold" },
    b = { fg = fg,         bg = bg },
    c = { fg = fg_dim,     bg = bg },
  },
  command = {
    a = { fg = bg,         bg = colors.green,  gui = "bold" },
    b = { fg = fg,         bg = bg },
    c = { fg = fg_dim,     bg = bg },
  },
  inactive = {
    a = { fg = colors.blue, bg = bg,           gui = "bold" },
    b = { fg = colors.blue, bg = bg },
    c = { fg = colors.blue, bg = bg },
  },
}
