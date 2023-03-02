# gruvbox-dim

This is a dim version of [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) designed for use with [folke/styler.nvim](https://github.com/folke/styler.nvim) to unfocus other open windows.

gruvbox.nvim does have a ```dim-inactive``` option, but this lowers contrast by brightening the background, rather than dimming the text.
Many people seem happy with this approach, but I've always found it very distracting.
This effect is more subtle (probably too subtle using ```vim.o.background = 'light'```).

## Installation

Install with your preferred package manager:

```lua
-- Packer
use({
  'dairnarth/gruvbox-dim.nvim',
  config = function() require('gruvbox-dim').setup() end,
})
```

## Usage

With [styler.nvim](https://github.com/folke/styler.nvim) and [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) installed, these autocommands will 'focus' the current window by dimming all inactive windows:

```lua
vim.cmd.colorscheme('gruvbox')

vim.api.nvim_create_augroup('focus', {clear = true})
vim.api.nvim_create_autocmd({'WinEnter', 'FocusGained'}, {
  callback = function()
    require('styler').clear(0)
  end,
  group = 'focus'
})
vim.api.nvim_create_autocmd({'WinLeave', 'FocusLost'}, {
  callback = function()
    require('styler').set_theme(0, {
      colorscheme = 'gruvbox-dim',
      background = 'dark'
    })
  end,
  group = 'focus'
})
```

Or if you'd simply prefer a lower contrast gruvbox:

```lua
vim.cmd.colorscheme('gruvbox-dim')
```

# Configuration

Additional settings for gruvbox-dim are:

```lua
-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox-dim").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
```

## Overriding

### Pallette

You can specify your own palette colors. For example:

```lua
require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#990000",
    }
})
vim.cmd("colorscheme gruvbox")
```

More colors in the [palette.lua](lua/gruvbox/palette.lua) file

### Highlight groups

If you don't enjoy the current color for a specific highlight group, now you can just override it in the setup. For
example:

```lua
require("gruvbox").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd("colorscheme gruvbox")
```

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in `:h synIDattr`
