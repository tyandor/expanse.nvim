# expanse.nvim
### MCRN Rocinante Command Interface — *inspired by The Expanse*

A dark Neovim colorscheme with the aesthetic of a Martian Congressional Republic Navy warship bridge: deep space blacks, bioluminescent cyan readouts, amber command input, and Mars-orange alerts. Each syntax role gets its own color while maintaining the cold, industrial feel of a ship command interface.

## Palette

| Role | Color | Hex |
|------|-------|-----|
| Background | deep space black | `#080c12` |
| Foreground / variables | bioluminescent cyan | `#7ecfcf` |
| Functions / definitions | amber command | `#e8c97a` |
| Keywords / control flow | ice blue | `#8ab8d0` |
| Types / structures | teal | `#5ab0a0` |
| Constants / literals | warm gold | `#c8a96e` |
| Strings | nominal green | `#5ec98e` |
| Builtins | steel gray | `#a0b8b8` |
| Punctuation / operators | dim cyan | `#4a8a9a` |
| Errors | Mars orange-red | `#ff6b47` |
| Warnings | transponder orange | `#ff9a3c` |

## Installation

### lazy.nvim

```lua
{
  "tyandor/expanse.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("expanse")
  end,
}
```

### packer.nvim

```lua
use {
  "tyandor/expanse.nvim",
  config = function()
    vim.cmd.colorscheme("expanse")
  end,
}
```

### Manual

Clone the repo and add it to your `runtimepath`:

```lua
vim.opt.rtp:prepend("/path/to/expanse.nvim")
vim.cmd.colorscheme("expanse")
```

## Configuration

Set these globals **before** loading the colorscheme:

```lua
-- Further dim comments (default: false)
vim.g.expanse_dim_comments = true

-- Show a visible float border (default: false — invisible, blends with bg)
vim.g.expanse_floatborder = true
```

## Lualine

The theme includes a lualine integration. Add `theme = "expanse"` to your lualine setup:

```lua
require("lualine").setup({
  options = { theme = "expanse" },
})
```

Mode colors at a glance:

| Mode    | Section A color |
|---------|----------------|
| Normal  | cyan `#7ecfcf` |
| Insert  | amber `#e8c97a` |
| Visual  | gold `#c8a96e` |
| Replace | orange `#ff9a3c` |
| Command | green `#5ec98e` |

## Plugin support

- **Telescope** — custom border, matching, and prompt colors
- **fzf-lua** — matching border style
- **Gitsigns** — add/change/delete in palette colors
- **Neogit** — popup key and switch highlights
- **Noice** — cmdline border and icon groups
- **nvim-cmp** — menu and kind highlights
- **nvim-dap** — virtual text
- **indent-blankline** (v3) — `IblIndent` / `IblScope`
- **Rainbow delimiters** — full palette rotation
- **Hop / Leap** — next-key highlighting
- **ALE** — warning sign color
- **Treesitter** — both legacy `TS*` and modern `@*` capture groups
- **LSP semantic tokens** — `@lsp.type.*` / `@lsp.typemod.*`

## Font recommendations

- **Share Tech Mono** — matches the source material exactly
- **JetBrains Mono** — excellent legibility fallback
- **Iosevka** (narrow) — ideal for dense readout layouts
- **Departure Mono** — bitmap-inspired, more character

## AstroNvim

See [`astrocommunity/`](./astrocommunity/) for the files to submit to [AstroNvim/astrocommunity](https://github.com/AstroNvim/astrocommunity).

## Preview

![Expanse Theme Preview](preview.png)

## License

MIT
