vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "expanse"

---@diagnostic disable: undefined-global

-- ── Palette ───────────────────────────────────────────────────────────────
-- Terminal colors: MCRN Rocinante command interface
vim.g.terminal_color_0  = "#080c12"
vim.g.terminal_color_1  = "#ff6b47"
vim.g.terminal_color_2  = "#5ec98e"
vim.g.terminal_color_3  = "#e8c97a"
vim.g.terminal_color_4  = "#1a3a4a"
vim.g.terminal_color_5  = "#c8a96e"
vim.g.terminal_color_6  = "#7ecfcf"
vim.g.terminal_color_7  = "#a0b8b8"
vim.g.terminal_color_8  = "#1a3a4a"
vim.g.terminal_color_9  = "#ff9a3c"
vim.g.terminal_color_10 = "#5aaa8a"
vim.g.terminal_color_11 = "#c8a96e"
vim.g.terminal_color_12 = "#2a6a7a"
vim.g.terminal_color_13 = "#ff9a3c"
vim.g.terminal_color_14 = "#7ecfcf"
vim.g.terminal_color_15 = "#e8f0f0"

-- Core palette
local bg        = "#080c12"  -- deep space black
local bg_alt    = "#060a10"  -- sidebar/panel background
local fg        = "#7ecfcf"  -- primary text: bioluminescent cyan readout
local fg_dim    = "#4a8a9a"  -- secondary/inactive text
local punct_fg  = "#4a8a9a"  -- punctuation blends into the background hum
local def_fg    = "#e8c97a"  -- amber: function/type definitions (human command input)
local const_fg  = "#c8a96e"  -- warm gold: constants, literals
local string_fg = "#5ec98e"  -- green: strings (nominal status)
local active    = "#e8c97a"  -- amber cursor
local darker_fg = "#2a6a7a"  -- muted panel accent
local keyword_fg = "#8ab8d0"  -- ice blue: keywords, control flow
local type_fg    = "#5ab0a0"  -- teal: types, structures
local builtin_fg = "#a0b8b8"  -- steel gray: builtins

local comment_fg = vim.g.expanse_dim_comments and "#2a6a7a" or "#3a7a8a"

local statusline = "#060a10"
local pmenu_bg   = "#0c1820"

local float_bg = vim.g.expanse_floatborder and bg or pmenu_bg
local floatborder = vim.g.expanse_floatborder
    and { bg = bg, fg = "#1a3a4a" }
    or { bg = float_bg, fg = float_bg }

local mistake = {
  fg = "#ff6b47",
  bg = "#1a0a08",
}

local ansi = {
  black          = "#080c12",
  red            = "#ff6b47",
  green          = "#5ec98e",
  yellow         = "#e8c97a",
  blue           = "#2a6a7a",
  magenta        = "#c8a96e",
  cyan           = "#7ecfcf",
  white          = "#a0b8b8",
  bright_red     = "#ff9a3c",
  bright_green   = "#5aaa8a",
  bright_yellow  = "#c8a96e",
  bright_blue    = "#2a6a7a",
  bright_cyan    = "#7ecfcf",
  bright_white   = "#e8f0f0",
}

local error = "#ff6b47"
local warn  = "#ff9a3c"
local hint  = "#4a8a9a"
local info  = "#5ec98e"

-- ── Highlight definitions ─────────────────────────────────────────────────
local theme = {
  -- Editor chrome
  Normal          = { bg = bg,       fg = fg },
  NormalFloat     = { bg = float_bg },
  FloatBorder     = floatborder,
  ColorColumn     = { bg = "#0d1a22" },
  Conceal         = { fg = fg_dim },
  Cursor          = { bg = active,   fg = bg },
  CursorColumn    = { bg = "#0d1a22" },
  CursorLine      = { bg = "#0d1a22" },
  Directory       = { fg = ansi.cyan },
  EndOfBuffer     = { fg = "#1a3a4a" },
  TermCursorNC    = { fg = bg, bg = fg },
  ErrorMsg        = { fg = error,    bg = mistake.bg },
  VertSplit       = { fg = "#1a3a4a" },
  WinSeparator    = { fg = "#1a3a4a" },
  Folded          = { bg = "#0d1a22", fg = fg_dim },
  FoldColumn      = { bg = bg,        fg = "#2a6a7a" },
  SignColumn      = {},
  IncSearch       = { bg = active,   fg = bg },
  LineNr          = { fg = "#2a6a7a" },
  CursorLineNr    = { fg = ansi.yellow, bold = true },
  MatchParen      = { underline = true, sp = active },
  MoreMsg         = { fg = ansi.green, bold = true },
  NonText         = { fg = "#1a3a4a" },
  Pmenu           = { bg = pmenu_bg },
  PmenuSel        = { bg = "#1a3a4a" },
  PmenuSbar       = { bg = "#0d1520" },
  PmenuThumb      = { bg = "#2a6a7a" },
  Question        = { fg = ansi.green },
  QuickFixLine    = { bg = "#0d1a22" },
  Search          = { bg = "#1a3a4a" },
  SpecialKey      = { fg = ansi.cyan },
  SpellBad        = { undercurl = true, sp = ansi.red },
  SpellCap        = { undercurl = true, sp = def_fg },
  SpellLocal      = { undercurl = true, sp = ansi.cyan },
  SpellRare       = { undercurl = true, sp = ansi.magenta },
  StatusLine      = { bg = statusline, fg = fg },
  StatusLineNC    = { bg = statusline, fg = fg_dim },
  TabLine         = { bg = statusline, fg = fg_dim },
  TabLineFill     = { bg = statusline },
  TabLineSel      = { bg = statusline, fg = ansi.yellow },
  Title           = { fg = def_fg },
  Visual          = { bg = "#1a3a4a" },
  VisualNOS       = { bg = "#1a3a4a" },
  WarningMsg      = { fg = warn },
  WildMenu        = { bg = "#1a3a4a" },
  WinBar          = { bg = bg, fg = fg,     bold = true },
  WinBarNC        = { bg = bg, fg = fg_dim },

  -- Syntax: four classes, minimal highlighting (Expanse philosophy)
  Comment         = { fg = comment_fg },
  Constant        = { fg = const_fg },
  String          = { fg = string_fg },
  Character       = { fg = const_fg },
  Number          = { fg = const_fg },
  Boolean         = { fg = const_fg },
  Float           = { fg = const_fg },
  Operator        = { fg = punct_fg },

  Identifier      = { fg = fg },
  Function        = { fg = def_fg },
  Statement       = { fg = keyword_fg },
  Conditional     = { fg = keyword_fg },
  Repeat          = { fg = keyword_fg },
  Label           = { fg = def_fg },
  Keyword         = { fg = keyword_fg },
  Exception       = { fg = keyword_fg },
  PreProc         = { fg = keyword_fg },
  Include         = { fg = keyword_fg },
  Define          = { fg = keyword_fg },
  Macro           = { fg = keyword_fg },
  PreCondit       = { fg = keyword_fg },
  Type            = { fg = type_fg },
  StorageClass    = { fg = type_fg },
  Structure       = { fg = type_fg },
  Typedef         = { fg = type_fg },
  Special         = { fg = ansi.yellow },
  SpecialComment  = { bg = "#0d1a22", fg = ansi.cyan },
  debugPc         = { bg = "#0d1f2e" },
  debugBreakpoint = { bg = "#2a0a08" },
  helpHyperTextJump = { fg = ansi.magenta },
  helpSectionDelim  = { fg = ansi.magenta },
  helpExample       = { fg = ansi.cyan },
  helpCommand       = { fg = ansi.cyan },
  helpHeadline      = { fg = def_fg },
  helpHeader        = { fg = ansi.magenta },
  Underlined      = { underline = true },
  Italic          = { italic = true },
  Error           = { bg = mistake.bg, fg = mistake.fg },
  Todo            = { bg = "#1a2a10", fg = ansi.green },

  -- Diff
  DiffAdd         = { bg = "#0a2018", fg = "#5ec98e" },
  DiffDelete      = { bg = "#2a0a08", fg = "#ff6b47" },
  DiffText        = { bg = "#2a1a00", fg = "#e8c97a" },
  DiffChange      = { bg = "#1a1400", fg = "#c8a96e" },

  -- LSP
  LspReferenceText  = { bg = "#1a3a4a" },
  LspReferenceRead  = { bg = "#1a3a4a" },
  LspReferenceWrite = { bg = "#1a3a4a", underline = true, sp = active },
  LspCodeLens           = { fg = "#2a6a7a" },
  LspCodeLensSeparator  = { fg = "#2a6a7a" },

  -- Diagnostics
  DiagnosticError               = { fg = error },
  DiagnosticWarn                = { fg = warn },
  DiagnosticHint                = { fg = hint },
  DiagnosticInfo                = { fg = info },
  DiagnosticVirtualTextError    = { bg = "#1a0a08", fg = "#ff8060" },
  DiagnosticVirtualTextWarn     = { bg = "#1a1000", fg = "#ffb060" },
  DiagnosticVirtualTextHint     = { bg = "#081018", fg = "#5a9aaa" },
  DiagnosticVirtualTextInfo     = { bg = "#081408", fg = "#5ab88a" },
  DiagnosticUnderlineError      = { undercurl = true, sp = error },
  DiagnosticUnderlineWarn       = { undercurl = true, sp = warn },
  DiagnosticUnderlineHint       = { undercurl = true, sp = hint },
  DiagnosticUnderlineInfo       = { undercurl = true, sp = info },

  -- TreeSitter (legacy TS* groups)
  TSAttribute         = {},
  TSConstructor       = { fg = type_fg },
  TSConditional       = { fg = keyword_fg },
  TSConstBuiltin      = { fg = const_fg },
  TSConstMacro        = { fg = const_fg },
  TSError             = { bg = mistake.bg, fg = mistake.fg },
  TSException         = { fg = keyword_fg },
  TSField             = { fg = fg },
  TSFunction          = { fg = def_fg },
  TSFuncBuiltin       = { fg = builtin_fg },
  TSFuncMacro         = { fg = def_fg },
  TSKeyword           = { fg = keyword_fg },
  TSKeywordFunction   = { fg = keyword_fg },
  TSLabel             = { fg = def_fg },
  TSMethod            = { fg = def_fg },
  TSNamespace         = { fg = type_fg },
  TSNone              = { fg = const_fg },
  TSParameter         = { fg = fg },
  TSParameterReference = { fg = fg },
  TSProperty          = { fg = fg },
  TSPunctDelimiter    = { fg = punct_fg },
  TSPunctBracket      = { fg = ansi.white },
  TSPunctSpecial      = { fg = punct_fg },
  TSRepeat            = { fg = keyword_fg },
  TSString            = { fg = string_fg },
  TSStringRegex       = { bg = "#0d1a22", fg = const_fg },
  TSStringEscape      = { bg = "#0d1a22", fg = const_fg },
  TSSymbol            = {},
  TSType              = { fg = type_fg },
  TSTypeBuiltin       = { fg = type_fg },
  TSVariable          = { fg = fg },
  TSVariableBuiltin   = { fg = builtin_fg },
  TSTag               = { fg = keyword_fg },
  TSTagDelimiter      = { fg = punct_fg },
  TSText              = { fg = fg },

  -- TreeSitter (modern @* capture groups)
  ["@attribute"]           = {},
  ["@constructor"]         = { fg = type_fg },
  ["@conditional"]         = { fg = keyword_fg },
  ["@constant.builtin"]    = { fg = const_fg },
  ["@constant.macro"]      = { fg = const_fg },
  ["@error"]               = { bg = mistake.bg, fg = mistake.fg },
  ["@exception"]           = { fg = keyword_fg },
  ["@field"]               = { fg = fg },
  ["@function"]            = { fg = def_fg },
  ["@function.builtin"]    = { fg = builtin_fg },
  ["@function.macro"]      = { fg = def_fg },
  ["@keyword"]             = { fg = keyword_fg },
  ["@keyword.function"]    = { fg = keyword_fg },
  ["@keyword.operator"]    = { fg = keyword_fg },
  ["@label"]               = { fg = def_fg },
  ["@method"]              = { fg = def_fg },
  ["@module"]              = { fg = type_fg },
  ["@namespace"]           = { fg = type_fg },
  ["@none"]                = { fg = const_fg },
  ["@parameter"]           = { fg = fg },
  ["@parameter.reference"] = { fg = fg },
  ["@property"]            = { fg = fg },
  ["@punctuation.delimiter"] = { fg = punct_fg },
  ["@punctuation.bracket"]   = { fg = ansi.white },
  ["@punctuation.special"]   = { fg = punct_fg },
  ["@repeat"]              = { fg = keyword_fg },
  ["@string"]              = { fg = string_fg },
  ["@string.regex"]        = { bg = "#0d1a22", fg = const_fg },
  ["@string.escape"]       = { bg = "#0d1a22", fg = const_fg },
  ["@symbol"]              = {},
  ["@type"]                = { fg = type_fg },
  ["@type.builtin"]        = { fg = type_fg },
  ["@variable"]            = { fg = fg },
  ["@variable.builtin"]    = { fg = builtin_fg },
  ["@tag"]                 = { fg = keyword_fg },
  ["@tag.delimiter"]       = { fg = punct_fg },
  ["@text"]                = { fg = fg },
  ["@text.note"]           = { bg = "#0d1a22", fg = ansi.cyan },
  ["@text.warning"]        = { bg = "#1a1a00", fg = warn },

  -- Expanse custom semantic groups
  ["@ExpanseBase"]       = { fg = fg },
  ["@ExpanseConstant"]   = { fg = const_fg },
  ["@ExpanseDefinition"] = { fg = def_fg },
  ["@ExpanseKeyword"]    = { fg = keyword_fg },
  ["@ExpanseType"]       = { fg = type_fg },
  ["@ExpanseBuiltin"]    = { fg = builtin_fg },
  ["@ExpansePunct"]      = { fg = punct_fg },
  ["@ExpanseString"]     = { fg = string_fg },
  ["@ExpanseComment"]    = { fg = comment_fg },

  -- LSP semantic tokens
  ["@lsp.mod.declaration"]               = {},
  ["@lsp.type.class"]                    = { fg = type_fg },
  ["@lsp.type.enum"]                     = { fg = type_fg },
  ["@lsp.type.enumMember"]               = { fg = const_fg },
  ["@lsp.type.function"]                 = { fg = def_fg },
  ["@lsp.type.keyword"]                  = { fg = keyword_fg },
  ["@lsp.type.method"]                   = { fg = def_fg },
  ["@lsp.type.namespace"]                = { fg = type_fg },
  ["@lsp.type.property"]                 = { fg = fg },
  ["@lsp.type.selfKeyword"]              = { fg = builtin_fg },
  ["@lsp.type.struct"]                   = { fg = type_fg },
  ["@lsp.type.type"]                     = { fg = type_fg },
  ["@lsp.type.variable"]                 = { fg = fg },
  ["@lsp.typemod.class.declaration"]     = { fg = type_fg, bold = true },
  ["@lsp.typemod.class.definition"]      = { fg = type_fg, bold = true },
  ["@lsp.typemod.enum.declaration"]      = { fg = type_fg, bold = true },
  ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = builtin_fg },
  ["@lsp.typemod.function.declaration"]  = { fg = def_fg, bold = true },
  ["@lsp.typemod.function.definition"]   = { fg = def_fg, bold = true },
  ["@lsp.typemod.macro.declaration"]     = { fg = def_fg, bold = true },
  ["@lsp.typemod.method.declaration"]    = { fg = def_fg, bold = true },
  ["@lsp.typemod.selfKeyword"]           = { fg = builtin_fg },
  ["@lsp.typemod.struct.declaration"]    = { fg = type_fg, bold = true },
  ["@lsp.typemod.type.declaration"]      = { fg = type_fg, bold = true },

  -- Gitsigns
  GitSignsAdd    = { fg = ansi.green },
  GitSignsChange = { fg = warn },
  GitSignsDelete = { fg = ansi.red },

  -- Telescope
  TelescopeBorder         = { fg = "#1a3a4a" },
  TelescopeMatching       = { fg = ansi.yellow },
  TelescopeMultiSelection = { fg = const_fg },
  TelescopePromptPrefix   = { fg = ansi.cyan },
  TelescopeSelectionCaret = { fg = mistake.fg },
  TelescopeTitle          = { fg = def_fg },
  TelescopeResultsTitle   = { fg = ansi.yellow },

  -- fzf-lua
  FzfLuaBorder = { fg = "#1a3a4a" },

  -- Neogit
  NeogitPopupActionDisabled  = { fg = fg_dim },
  NeogitPopupActionKey       = { fg = const_fg },
  NeogitPopupOptionDisabled  = { fg = fg_dim },
  NeogitPopupOptionKey       = { fg = ansi.cyan },
  NeogitPopupSwitchDisabled  = { fg = fg_dim },
  NeogitPopupSwitchEnabled   = { fg = ansi.green },
  NeogitPopupSwitchKey       = { fg = const_fg },

  -- Fugitive/diff aliases
  diffAdded   = { link = "DiffAdd" },
  diffRemoved = { link = "DiffDelete" },

  -- Statusline semantic groups
  StatuslineAdd     = { fg = ansi.green,    bg = statusline },
  StatuslineErr     = { fg = error,         bg = statusline },
  StatuslineHint    = { fg = hint,          bg = statusline },
  StatuslineInfo    = { fg = info,          bg = statusline },
  StatuslineWarn    = { fg = warn,          bg = statusline },
  StatuslineCyan    = { fg = ansi.cyan,     bg = statusline },
  StatuslineYellow  = { fg = ansi.yellow,   bg = statusline },
  StatuslineGreen   = { fg = ansi.green,    bg = statusline },
  StatuslineGold    = { fg = ansi.magenta,  bg = statusline },

  -- Expanse named palette groups (for statuslines / external plugins)
  ExpanseBg         = { fg = bg },
  ExpanseFg         = { fg = fg },
  ExpanseCyan       = { fg = ansi.cyan },
  ExpanseAmber      = { fg = ansi.yellow },
  ExpanseGold       = { fg = ansi.magenta },
  ExpanseGreen      = { fg = ansi.green },
  ExpanseRed        = { fg = ansi.red },
  ExpanseOrange     = { fg = ansi.bright_red },
  ExpanseBlue       = { fg = ansi.blue },
  ExpanseWhite      = { fg = ansi.white },
  ExpanseIceBlue    = { fg = keyword_fg },
  ExpanseTeal       = { fg = type_fg },
  ExpanseSteel      = { fg = builtin_fg },
  ExpanseDim        = { fg = fg_dim },

  -- ALE
  ALEWarningSign = { fg = warn },

  -- Hop / leap
  HopNextKey    = { fg = ansi.yellow },
  HopNextKey1   = { fg = ansi.cyan },
  HopNextKey2   = { fg = "#1a7a7a" },
  HopUnmatched  = { fg = "#1a3a4a" },

  -- nvim-dap
  NvimDapVirtualText = { bg = "#0d1a22", fg = ansi.cyan },

  -- Noice
  NoiceCmdlineIcon                   = { link = "ExpanseGreen" },
  NoiceCmdlinePopupBorder            = { link = "ExpanseGreen" },
  NoiceConfirmBorder                 = { link = "ExpanseGreen" },
  NoiceCmdlinePopupBorderCmdline     = { link = "ExpanseGreen" },
  NoiceCmdlineIconCmdline            = { link = "ExpanseGreen" },
  NoiceCmdlinePopupBorderFilter      = { link = "ExpanseGreen" },
  NoiceCmdlineIconFilter             = { link = "ExpanseGreen" },
  NoiceCmdlinePopupBorderLua         = { link = "ExpanseGreen" },
  NoiceCmdlineIconLua                = { link = "ExpanseGreen" },
  NoiceCmdlinePopupBorderSearch      = { link = "ExpanseAmber" },
  NoiceCmdlineIconSearch             = { link = "ExpanseAmber" },

  -- Rainbow delimiters
  RainbowDelimiterYellow  = { fg = ansi.yellow },
  RainbowDelimiterGold    = { fg = ansi.magenta },
  RainbowDelimiterBlue    = { fg = ansi.blue },
  RainbowDelimiterGreen   = { fg = ansi.green },
  RainbowDelimiterCyan    = { fg = ansi.cyan },
  RainbowDelimiterRed     = { fg = ansi.red },
  RainbowDelimiterOrange  = { fg = ansi.bright_red },

  -- Indent-blankline
  IblIndent     = { fg = "#0d1a22" },
  IblScope      = { fg = "#1a3a4a" },

  -- nvim-cmp
  CmpItemMenuDefault   = { fg = const_fg },
  CmpItemKindDefault   = { fg = fg_dim },

  -- Health
  healthSuccess = { fg = ansi.green, bg = bg },

  -- Matchup
  MatchupVirtualText = { fg = ansi.yellow },
}

for group, hl in pairs(theme) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
