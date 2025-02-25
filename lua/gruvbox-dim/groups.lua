local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("gruvbox-dim").config
  local colors = require("gruvbox-dim.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    GruvboxDimFg0 = { fg = colors.fg0 },
    GruvboxDimFg1 = { fg = colors.fg1 },
    GruvboxDimFg2 = { fg = colors.fg2 },
    GruvboxDimFg3 = { fg = colors.fg3 },
    GruvboxDimFg4 = { fg = colors.fg4 },
    GruvboxDimGray = { fg = colors.gray },
    GruvboxDimBg0 = { fg = colors.bg0 },
    GruvboxDimBg1 = { fg = colors.bg1 },
    GruvboxDimBg2 = { fg = colors.bg2 },
    GruvboxDimBg3 = { fg = colors.bg3 },
    GruvboxDimBg4 = { fg = colors.bg4 },
    GruvboxDimRed = { fg = colors.red },
    GruvboxDimRedBold = { fg = colors.red, bold = config.bold },
    GruvboxDimGreen = { fg = colors.green },
    GruvboxDimGreenBold = { fg = colors.green, bold = config.bold },
    GruvboxDimYellow = { fg = colors.yellow },
    GruvboxDimYellowBold = { fg = colors.yellow, bold = config.bold },
    GruvboxDimBlue = { fg = colors.blue },
    GruvboxDimBlueBold = { fg = colors.blue, bold = config.bold },
    GruvboxDimPurple = { fg = colors.purple },
    GruvboxDimPurpleBold = { fg = colors.purple, bold = config.bold },
    GruvboxDimAqua = { fg = colors.aqua },
    GruvboxDimAquaBold = { fg = colors.aqua, bold = config.bold },
    GruvboxDimOrange = { fg = colors.orange },
    GruvboxDimOrangeBold = { fg = colors.orange, bold = config.bold },
    GruvboxDimRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxDimRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    GruvboxDimGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    GruvboxDimYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    GruvboxDimBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    GruvboxDimPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    GruvboxDimAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    GruvboxDimOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "GruvboxDimBg2" },
    SpecialKey = { link = "GruvboxDimFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "GruvboxDimBlueBold" },
    Title = { link = "GruvboxDimGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "GruvboxDimYellowBold" },
    ModeMsg = { link = "GruvboxDimYellowBold" },
    Question = { link = "GruvboxDimOrangeBold" },
    WarningMsg = { link = "GruvboxDimRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "GruvboxDimOrange" },
    Comment = { fg = colors.gray, italic = config.italic },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "GruvboxDimRed" },
    Conditional = { link = "GruvboxDimRed" },
    Repeat = { link = "GruvboxDimRed" },
    Label = { link = "GruvboxDimRed" },
    Exception = { link = "GruvboxDimRed" },
    Operator = { fg = colors.orange, italic = config.italic },
    Keyword = { link = "GruvboxDimRed" },
    Identifier = { link = "GruvboxDimBlue" },
    Function = { link = "GruvboxDimGreenBold" },
    PreProc = { link = "GruvboxDimAqua" },
    Include = { link = "GruvboxDimAqua" },
    Define = { link = "GruvboxDimAqua" },
    Macro = { link = "GruvboxDimAqua" },
    PreCondit = { link = "GruvboxDimAqua" },
    Constant = { link = "GruvboxDimPurple" },
    Character = { link = "GruvboxDimPurple" },
    String = { fg = colors.green, italic = config.italic },
    Boolean = { link = "GruvboxDimPurple" },
    Number = { link = "GruvboxDimPurple" },
    Float = { link = "GruvboxDimPurple" },
    Type = { link = "GruvboxDimYellow" },
    StorageClass = { link = "GruvboxDimOrange" },
    Structure = { link = "GruvboxDimAqua" },
    Typedef = { link = "GruvboxDimYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "GruvboxDimBlueUnderline" },
    SpellBad = { link = "GruvboxDimRedUnderline" },
    SpellLocal = { link = "GruvboxDimAquaUnderline" },
    SpellRare = { link = "GruvboxDimPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "GruvboxDimRed" },
    DiagnosticSignError = { link = "GruvboxDimRedSign" },
    DiagnosticUnderlineError = { link = "GruvboxDimRedUnderline" },
    DiagnosticWarn = { link = "GruvboxDimYellow" },
    DiagnosticSignWarn = { link = "GruvboxDimYellowSign" },
    DiagnosticUnderlineWarn = { link = "GruvboxDimYellowUnderline" },
    DiagnosticInfo = { link = "GruvboxDimBlue" },
    DiagnosticSignInfo = { link = "GruvboxDimBlueSign" },
    DiagnosticUnderlineInfo = { link = "GruvboxDimBlueUnderline" },
    DiagnosticHint = { link = "GruvboxDimAqua" },
    DiagnosticSignHint = { link = "GruvboxDimAquaSign" },
    DiagnosticUnderlineHint = { link = "GruvboxDimAquaUnderline" },
    DiagnosticFloatingError = { link = "GruvboxDimRed" },
    DiagnosticFloatingWarn = { link = "GruvboxDimOrange" },
    DiagnosticFloatingInfo = { link = "GruvboxDimBlue" },
    DiagnosticFloatingHint = { link = "GruvboxDimAqua" },
    DiagnosticVirtualTextError = { link = "GruvboxDimRed" },
    DiagnosticVirtualTextWarn = { link = "GruvboxDimYellow" },
    DiagnosticVirtualTextInfo = { link = "GruvboxDimBlue" },
    DiagnosticVirtualTextHint = { link = "GruvboxDimAqua" },
    LspReferenceRead = { link = "GruvboxDimYellowBold" },
    LspReferenceText = { link = "GruvboxDimYellowBold" },
    LspReferenceWrite = { link = "GruvboxDimOrangeBold" },
    LspCodeLens = { link = "GruvboxDimGray" },
    -- nvim-treesitter (0.8 compat)
    -- Adapted from https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f#commitcomment-87014462
    ["@annotation"] = { link = "Operator" },
    ["@comment"] = { link = "Comment" },
    ["@none"] = { bg = "NONE", fg = "NONE" },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Delimiter" },
    ["@string"] = { link = "String" },
    ["@string.regex"] = { link = "String" },
    ["@string.escape"] = { link = "SpecialChar" },
    ["@string.special"] = { link = "SpecialChar" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.macro"] = { link = "Macro" },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },
    ["@constructor"] = { link = "Special" },
    ["@parameter"] = { link = "Identifier" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@conditional"] = { link = "Conditional" },
    ["@repeat"] = { link = "Repeat" },
    ["@debug"] = { link = "Debug" },
    ["@label"] = { link = "Label" },
    ["@include"] = { link = "Include" },
    ["@exception"] = { link = "Exception" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.qualifier"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@attribute"] = { link = "PreProc" },
    ["@field"] = { link = "Identifier" },
    ["@property"] = { link = "Identifier" },
    ["@variable"] = { link = "GruvboxDimFg1" },
    ["@variable.builtin"] = { link = "Special" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@namespace"] = { link = "GruvboxDimFg1" },
    ["@symbol"] = { link = "Identifier" },
    ["@text"] = { link = "GruvboxDimFg1" },
    ["@text.title"] = { link = "Title" },
    ["@text.literal"] = { link = "String" },
    ["@text.uri"] = { link = "Underlined" },
    ["@text.math"] = { link = "Special" },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.reference"] = { link = "Constant" },
    ["@text.todo"] = { link = "Todo" },
    ["@text.todo.unchecked"] = { link = "Todo" },
    ["@text.todo.checked"] = { link = "Done" },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.warning"] = { link = "WarningMsg" },
    ["@text.danger"] = { link = "ErrorMsg" },
    ["@text.diff.add"] = { link = "diffAdded" },
    ["@text.diff.delete"] = { link = "diffRemoved" },
    ["@tag"] = { link = "Tag" },
    ["@tag.attribute"] = { link = "Identifier" },
    ["@tag.delimiter"] = { link = "Delimiter" },

    -- nvim-treesitter (0.8 overrides)
    ["@text.strong"] = { bold = config.bold },
    ["@text.strike"] = { strikethrough = config.strikethrough },
    ["@text.emphasis"] = { italic = config.italic },
    ["@text.underline"] = { underline = config.underline },
    ["@keyword.operator"] = { link = "GruvboxDimRed" },
    -- gitcommit
    gitcommitSelectedFile = { link = "GruvboxDimGreen" },
    gitcommitDiscardedFile = { link = "GruvboxDimRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "GruvboxDimGreenSign" },
    GitSignsChange = { link = "GruvboxDimAquaSign" },
    GitSignsDelete = { link = "GruvboxDimRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "GruvboxDimRedSign" },
    -- vim-startify
    StartifyBracket = { link = "GruvboxDimFg3" },
    StartifyFile = { link = "GruvboxDimFg1" },
    StartifyNumber = { link = "GruvboxDimBlue" },
    StartifyPath = { link = "GruvboxDimGray" },
    StartifySlash = { link = "GruvboxDimGray" },
    StartifySection = { link = "GruvboxDimYellow" },
    StartifySpecial = { link = "GruvboxDimBg2" },
    StartifyHeader = { link = "GruvboxDimOrange" },
    StartifyFooter = { link = "GruvboxDimBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "GruvboxDimAqua" },
    DirvishArg = { link = "GruvboxDimYellow" },
    -- netrw
    netrwDir = { link = "GruvboxDimAqua" },
    netrwClassify = { link = "GruvboxDimAqua" },
    netrwLink = { link = "GruvboxDimGray" },
    netrwSymLink = { link = "GruvboxDimFg1" },
    netrwExe = { link = "GruvboxDimYellow" },
    netrwComment = { link = "GruvboxDimGray" },
    netrwList = { link = "GruvboxDimBlue" },
    netrwHelpCmd = { link = "GruvboxDimAqua" },
    netrwCmdSep = { link = "GruvboxDimFg3" },
    netrwVersion = { link = "GruvboxDimGreen" },
    -- nerdtree
    NERDTreeDir = { link = "GruvboxDimAqua" },
    NERDTreeDirSlash = { link = "GruvboxDimAqua" },
    NERDTreeOpenable = { link = "GruvboxDimOrange" },
    NERDTreeClosable = { link = "GruvboxDimOrange" },
    NERDTreeFile = { link = "GruvboxDimFg1" },
    NERDTreeExecFile = { link = "GruvboxDimYellow" },
    NERDTreeUp = { link = "GruvboxDimGray" },
    NERDTreeCWD = { link = "GruvboxDimGreen" },
    NERDTreeHelp = { link = "GruvboxDimFg1" },
    NERDTreeToggleOn = { link = "GruvboxDimGreen" },
    NERDTreeToggleOff = { link = "GruvboxDimRed" },
    -- coc.nvim
    CocErrorSign = { link = "GruvboxDimRedSign" },
    CocWarningSign = { link = "GruvboxDimOrangeSign" },
    CocInfoSign = { link = "GruvboxDimBlueSign" },
    CocHintSign = { link = "GruvboxDimAquaSign" },
    CocErrorFloat = { link = "GruvboxDimRed" },
    CocWarningFloat = { link = "GruvboxDimOrange" },
    CocInfoFloat = { link = "GruvboxDimBlue" },
    CocHintFloat = { link = "GruvboxDimAqua" },
    CocDiagnosticsError = { link = "GruvboxDimRed" },
    CocDiagnosticsWarning = { link = "GruvboxDimOrange" },
    CocDiagnosticsInfo = { link = "GruvboxDimBlue" },
    CocDiagnosticsHint = { link = "GruvboxDimAqua" },
    CocSelectedText = { link = "GruvboxDimRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "GruvboxDimGray" },
    CocErrorHighlight = { link = "GruvboxDimRedUnderline" },
    CocWarningHighlight = { link = "GruvboxDimOrangeUnderline" },
    CocInfoHighlight = { link = "GruvboxDimBlueUnderline" },
    CocHintHighlight = { link = "GruvboxDimAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "GruvboxDimFg1" },
    TelescopeSelection = { link = "GruvboxDimOrangeBold" },
    TelescopeSelectionCaret = { link = "GruvboxDimRed" },
    TelescopeMultiSelection = { link = "GruvboxDimGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "GruvboxDimBlue" },
    TelescopePromptPrefix = { link = "GruvboxDimRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "GruvboxDimFg0" },
    CmpItemAbbrDeprecated = { link = "GruvboxDimFg1" },
    CmpItemAbbrMatch = { link = "GruvboxDimBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "GruvboxDimBlueUnderline" },
    CmpItemMenu = { link = "GruvboxDimGray" },
    CmpItemKindText = { link = "GruvboxDimOrange" },
    CmpItemKindMethod = { link = "GruvboxDimBlue" },
    CmpItemKindFunction = { link = "GruvboxDimBlue" },
    CmpItemKindConstructor = { link = "GruvboxDimYellow" },
    CmpItemKindField = { link = "GruvboxDimBlue" },
    CmpItemKindClass = { link = "GruvboxDimYellow" },
    CmpItemKindInterface = { link = "GruvboxDimYellow" },
    CmpItemKindModule = { link = "GruvboxDimBlue" },
    CmpItemKindProperty = { link = "GruvboxDimBlue" },
    CmpItemKindValue = { link = "GruvboxDimOrange" },
    CmpItemKindEnum = { link = "GruvboxDimYellow" },
    CmpItemKindKeyword = { link = "GruvboxDimPurple" },
    CmpItemKindSnippet = { link = "GruvboxDimGreen" },
    CmpItemKindFile = { link = "GruvboxDimBlue" },
    CmpItemKindEnumMember = { link = "GruvboxDimAqua" },
    CmpItemKindConstant = { link = "GruvboxDimOrange" },
    CmpItemKindStruct = { link = "GruvboxDimYellow" },
    CmpItemKindTypeParameter = { link = "GruvboxDimYellow" },
    diffAdded = { link = "GruvboxDimGreen" },
    diffRemoved = { link = "GruvboxDimRed" },
    diffChanged = { link = "GruvboxDimAqua" },
    diffFile = { link = "GruvboxDimOrange" },
    diffNewFile = { link = "GruvboxDimYellow" },
    diffLine = { link = "GruvboxDimBlue" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "GruvboxDimBlue" },
    NavicIconsModule = { link = "GruvboxDimOrange" },
    NavicIconsNamespace = { link = "GruvboxDimBlue" },
    NavicIconsPackage = { link = "GruvboxDimAqua" },
    NavicIconsClass = { link = "GruvboxDimYellow" },
    NavicIconsMethod = { link = "GruvboxDimBlue" },
    NavicIconsProperty = { link = "GruvboxDimAqua" },
    NavicIconsField = { link = "GruvboxDimPurple" },
    NavicIconsConstructor = { link = "GruvboxDimBlue" },
    NavicIconsEnum = { link = "GruvboxDimPurple" },
    NavicIconsInterface = { link = "GruvboxDimGreen" },
    NavicIconsFunction = { link = "GruvboxDimBlue" },
    NavicIconsVariable = { link = "GruvboxDimPurple" },
    NavicIconsConstant = { link = "GruvboxDimOrange" },
    NavicIconsString = { link = "GruvboxDimGreen" },
    NavicIconsNumber = { link = "GruvboxDimOrange" },
    NavicIconsBoolean = { link = "GruvboxDimOrange" },
    NavicIconsArray = { link = "GruvboxDimOrange" },
    NavicIconsObject = { link = "GruvboxDimOrange" },
    NavicIconsKey = { link = "GruvboxDimAqua" },
    NavicIconsNull = { link = "GruvboxDimOrange" },
    NavicIconsEnumMember = { link = "GruvboxDimYellow" },
    NavicIconsStruct = { link = "GruvboxDimPurple" },
    NavicIconsEvent = { link = "GruvboxDimYellow" },
    NavicIconsOperator = { link = "GruvboxDimRed" },
    NavicIconsTypeParameter = { link = "GruvboxDimRed" },
    NavicText = { link = "GruvboxDimWhite" },
    NavicSeparator = { link = "GruvboxDimWhite" },
    -- html
    htmlTag = { link = "GruvboxDimAquaBold" },
    htmlEndTag = { link = "GruvboxDimAquaBold" },
    htmlTagName = { link = "GruvboxDimBlue" },
    htmlArg = { link = "GruvboxDimOrange" },
    htmlTagN = { link = "GruvboxDimFg1" },
    htmlSpecialTagName = { link = "GruvboxDimBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "GruvboxDimRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = config.italic },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = config.italic,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = config.italic,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.italic },
    -- xml
    xmlTag = { link = "GruvboxDimAquaBold" },
    xmlEndTag = { link = "GruvboxDimAquaBold" },
    xmlTagName = { link = "GruvboxDimBlue" },
    xmlEqual = { link = "GruvboxDimBlue" },
    docbkKeyword = { link = "GruvboxDimAquaBold" },
    xmlDocTypeDecl = { link = "GruvboxDimGray" },
    xmlDocTypeKeyword = { link = "GruvboxDimPurple" },
    xmlCdataStart = { link = "GruvboxDimGray" },
    xmlCdataCdata = { link = "GruvboxDimPurple" },
    dtdFunction = { link = "GruvboxDimGray" },
    dtdTagName = { link = "GruvboxDimPurple" },
    xmlAttrib = { link = "GruvboxDimOrange" },
    xmlProcessingDelim = { link = "GruvboxDimGray" },
    dtdParamEntityPunct = { link = "GruvboxDimGray" },
    dtdParamEntityDPunct = { link = "GruvboxDimGray" },
    xmlAttribPunct = { link = "GruvboxDimGray" },
    xmlEntity = { link = "GruvboxDimRed" },
    xmlEntityPunct = { link = "GruvboxDimRed" },
    -- clojure
    clojureKeyword = { link = "GruvboxDimBlue" },
    clojureCond = { link = "GruvboxDimOrange" },
    clojureSpecial = { link = "GruvboxDimOrange" },
    clojureDefine = { link = "GruvboxDimOrange" },
    clojureFunc = { link = "GruvboxDimYellow" },
    clojureRepeat = { link = "GruvboxDimYellow" },
    clojureCharacter = { link = "GruvboxDimAqua" },
    clojureStringEscape = { link = "GruvboxDimAqua" },
    clojureException = { link = "GruvboxDimRed" },
    clojureRegexp = { link = "GruvboxDimAqua" },
    clojureRegexpEscape = { link = "GruvboxDimAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "GruvboxDimFg3" },
    clojureAnonArg = { link = "GruvboxDimYellow" },
    clojureVariable = { link = "GruvboxDimBlue" },
    clojureMacro = { link = "GruvboxDimOrange" },
    clojureMeta = { link = "GruvboxDimYellow" },
    clojureDeref = { link = "GruvboxDimYellow" },
    clojureQuote = { link = "GruvboxDimYellow" },
    clojureUnquote = { link = "GruvboxDimYellow" },
    -- C
    cOperator = { link = "GruvboxDimPurple" },
    cppOperator = { link = "GruvboxDimPurple" },
    cStructure = { link = "GruvboxDimOrange" },
    -- python
    pythonBuiltin = { link = "GruvboxDimOrange" },
    pythonBuiltinObj = { link = "GruvboxDimOrange" },
    pythonBuiltinFunc = { link = "GruvboxDimOrange" },
    pythonFunction = { link = "GruvboxDimAqua" },
    pythonDecorator = { link = "GruvboxDimRed" },
    pythonInclude = { link = "GruvboxDimBlue" },
    pythonImport = { link = "GruvboxDimBlue" },
    pythonRun = { link = "GruvboxDimBlue" },
    pythonCoding = { link = "GruvboxDimBlue" },
    pythonOperator = { link = "GruvboxDimRed" },
    pythonException = { link = "GruvboxDimRed" },
    pythonExceptions = { link = "GruvboxDimPurple" },
    pythonBoolean = { link = "GruvboxDimPurple" },
    pythonDot = { link = "GruvboxDimFg3" },
    pythonConditional = { link = "GruvboxDimRed" },
    pythonRepeat = { link = "GruvboxDimRed" },
    pythonDottedName = { link = "GruvboxDimGreenBold" },
    -- CSS
    cssBraces = { link = "GruvboxDimBlue" },
    cssFunctionName = { link = "GruvboxDimYellow" },
    cssIdentifier = { link = "GruvboxDimOrange" },
    cssClassName = { link = "GruvboxDimGreen" },
    cssColor = { link = "GruvboxDimBlue" },
    cssSelectorOp = { link = "GruvboxDimBlue" },
    cssSelectorOp2 = { link = "GruvboxDimBlue" },
    cssImportant = { link = "GruvboxDimGreen" },
    cssVendor = { link = "GruvboxDimFg1" },
    cssTextProp = { link = "GruvboxDimAqua" },
    cssAnimationProp = { link = "GruvboxDimAqua" },
    cssUIProp = { link = "GruvboxDimYellow" },
    cssTransformProp = { link = "GruvboxDimAqua" },
    cssTransitionProp = { link = "GruvboxDimAqua" },
    cssPrintProp = { link = "GruvboxDimAqua" },
    cssPositioningProp = { link = "GruvboxDimYellow" },
    cssBoxProp = { link = "GruvboxDimAqua" },
    cssFontDescriptorProp = { link = "GruvboxDimAqua" },
    cssFlexibleBoxProp = { link = "GruvboxDimAqua" },
    cssBorderOutlineProp = { link = "GruvboxDimAqua" },
    cssBackgroundProp = { link = "GruvboxDimAqua" },
    cssMarginProp = { link = "GruvboxDimAqua" },
    cssListProp = { link = "GruvboxDimAqua" },
    cssTableProp = { link = "GruvboxDimAqua" },
    cssFontProp = { link = "GruvboxDimAqua" },
    cssPaddingProp = { link = "GruvboxDimAqua" },
    cssDimensionProp = { link = "GruvboxDimAqua" },
    cssRenderProp = { link = "GruvboxDimAqua" },
    cssColorProp = { link = "GruvboxDimAqua" },
    cssGeneratedContentProp = { link = "GruvboxDimAqua" },
    -- javascript
    javaScriptBraces = { link = "GruvboxDimFg1" },
    javaScriptFunction = { link = "GruvboxDimAqua" },
    javaScriptIdentifier = { link = "GruvboxDimRed" },
    javaScriptMember = { link = "GruvboxDimBlue" },
    javaScriptNumber = { link = "GruvboxDimPurple" },
    javaScriptNull = { link = "GruvboxDimPurple" },
    javaScriptParens = { link = "GruvboxDimFg3" },
    -- typescript
    typescriptReserved = { link = "GruvboxDimAqua" },
    typescriptLabel = { link = "GruvboxDimAqua" },
    typescriptFuncKeyword = { link = "GruvboxDimAqua" },
    typescriptIdentifier = { link = "GruvboxDimOrange" },
    typescriptBraces = { link = "GruvboxDimFg1" },
    typescriptEndColons = { link = "GruvboxDimFg1" },
    typescriptDOMObjects = { link = "GruvboxDimFg1" },
    typescriptAjaxMethods = { link = "GruvboxDimFg1" },
    typescriptLogicSymbols = { link = "GruvboxDimFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "GruvboxDimFg1" },
    typescriptParens = { link = "GruvboxDimFg3" },
    typescriptOpSymbols = { link = "GruvboxDimFg3" },
    typescriptHtmlElemProperties = { link = "GruvboxDimFg1" },
    typescriptNull = { link = "GruvboxDimPurple" },
    typescriptInterpolationDelimiter = { link = "GruvboxDimAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "GruvboxDimAqua" },
    purescriptModuleName = { link = "GruvboxDimFg1" },
    purescriptWhere = { link = "GruvboxDimAqua" },
    purescriptDelimiter = { link = "GruvboxDimFg4" },
    purescriptType = { link = "GruvboxDimFg1" },
    purescriptImportKeyword = { link = "GruvboxDimAqua" },
    purescriptHidingKeyword = { link = "GruvboxDimAqua" },
    purescriptAsKeyword = { link = "GruvboxDimAqua" },
    purescriptStructure = { link = "GruvboxDimAqua" },
    purescriptOperator = { link = "GruvboxDimBlue" },
    purescriptTypeVar = { link = "GruvboxDimFg1" },
    purescriptConstructor = { link = "GruvboxDimFg1" },
    purescriptFunction = { link = "GruvboxDimFg1" },
    purescriptConditional = { link = "GruvboxDimOrange" },
    purescriptBacktick = { link = "GruvboxDimOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "GruvboxDimFg3" },
    coffeeSpecialOp = { link = "GruvboxDimFg3" },
    coffeeCurly = { link = "GruvboxDimOrange" },
    coffeeParen = { link = "GruvboxDimFg3" },
    coffeeBracket = { link = "GruvboxDimOrange" },
    -- ruby
    rubyStringDelimiter = { link = "GruvboxDimGreen" },
    rubyInterpolationDelimiter = { link = "GruvboxDimAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "GruvboxDimRed" },
    objcDirective = { link = "GruvboxDimBlue" },
    -- go
    goDirective = { link = "GruvboxDimAqua" },
    goConstants = { link = "GruvboxDimPurple" },
    goDeclaration = { link = "GruvboxDimRed" },
    goDeclType = { link = "GruvboxDimBlue" },
    goBuiltins = { link = "GruvboxDimOrange" },
    -- lua
    luaIn = { link = "GruvboxDimRed" },
    luaFunction = { link = "GruvboxDimAqua" },
    luaTable = { link = "GruvboxDimOrange" },
    -- moonscript
    moonSpecialOp = { link = "GruvboxDimFg3" },
    moonExtendedOp = { link = "GruvboxDimFg3" },
    moonFunction = { link = "GruvboxDimFg3" },
    moonObject = { link = "GruvboxDimYellow" },
    -- java
    javaAnnotation = { link = "GruvboxDimBlue" },
    javaDocTags = { link = "GruvboxDimAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "GruvboxDimFg3" },
    javaParen1 = { link = "GruvboxDimFg3" },
    javaParen2 = { link = "GruvboxDimFg3" },
    javaParen3 = { link = "GruvboxDimFg3" },
    javaParen4 = { link = "GruvboxDimFg3" },
    javaParen5 = { link = "GruvboxDimFg3" },
    javaOperator = { link = "GruvboxDimOrange" },
    javaVarArg = { link = "GruvboxDimGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "GruvboxDimGreen" },
    elixirInterpolationDelimiter = { link = "GruvboxDimAqua" },
    elixirModuleDeclaration = { link = "GruvboxDimYellow" },
    -- scala
    scalaNameDefinition = { link = "GruvboxDimFg1" },
    scalaCaseFollowing = { link = "GruvboxDimFg1" },
    scalaCapitalWord = { link = "GruvboxDimFg1" },
    scalaTypeExtension = { link = "GruvboxDimFg1" },
    scalaKeyword = { link = "GruvboxDimRed" },
    scalaKeywordModifier = { link = "GruvboxDimRed" },
    scalaSpecial = { link = "GruvboxDimAqua" },
    scalaOperator = { link = "GruvboxDimFg1" },
    scalaTypeDeclaration = { link = "GruvboxDimYellow" },
    scalaTypeTypePostDeclaration = { link = "GruvboxDimYellow" },
    scalaInstanceDeclaration = { link = "GruvboxDimFg1" },
    scalaInterpolation = { link = "GruvboxDimAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = config.italic },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = config.italic },
    markdownH1 = { link = "GruvboxDimGreenBold" },
    markdownH2 = { link = "GruvboxDimGreenBold" },
    markdownH3 = { link = "GruvboxDimYellowBold" },
    markdownH4 = { link = "GruvboxDimYellowBold" },
    markdownH5 = { link = "GruvboxDimYellow" },
    markdownH6 = { link = "GruvboxDimYellow" },
    markdownCode = { link = "GruvboxDimAqua" },
    markdownCodeBlock = { link = "GruvboxDimAqua" },
    markdownCodeDelimiter = { link = "GruvboxDimAqua" },
    markdownBlockquote = { link = "GruvboxDimGray" },
    markdownListMarker = { link = "GruvboxDimGray" },
    markdownOrderedListMarker = { link = "GruvboxDimGray" },
    markdownRule = { link = "GruvboxDimGray" },
    markdownHeadingRule = { link = "GruvboxDimGray" },
    markdownUrlDelimiter = { link = "GruvboxDimFg3" },
    markdownLinkDelimiter = { link = "GruvboxDimFg3" },
    markdownLinkTextDelimiter = { link = "GruvboxDimFg3" },
    markdownHeadingDelimiter = { link = "GruvboxDimOrange" },
    markdownUrl = { link = "GruvboxDimPurple" },
    markdownUrlTitleDelimiter = { link = "GruvboxDimGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "GruvboxDimBlue" },
    haskellIdentifier = { link = "GruvboxDimAqua" },
    haskellSeparator = { link = "GruvboxDimFg4" },
    haskellDelimiter = { link = "GruvboxDimOrange" },
    haskellOperators = { link = "GruvboxDimPurple" },
    haskellBacktick = { link = "GruvboxDimOrange" },
    haskellStatement = { link = "GruvboxDimPurple" },
    haskellConditional = { link = "GruvboxDimPurple" },
    haskellLet = { link = "GruvboxDimRed" },
    haskellDefault = { link = "GruvboxDimRed" },
    haskellWhere = { link = "GruvboxDimRed" },
    haskellBottom = { link = "GruvboxDimRedBold" },
    haskellImportKeywords = { link = "GruvboxDimPurpleBold" },
    haskellDeclKeyword = { link = "GruvboxDimOrange" },
    haskellDecl = { link = "GruvboxDimOrange" },
    haskellDeriving = { link = "GruvboxDimPurple" },
    haskellAssocType = { link = "GruvboxDimAqua" },
    haskellNumber = { link = "GruvboxDimAqua" },
    haskellPragma = { link = "GruvboxDimRedBold" },
    haskellTH = { link = "GruvboxDimAquaBold" },
    haskellForeignKeywords = { link = "GruvboxDimGreen" },
    haskellKeyword = { link = "GruvboxDimRed" },
    haskellFloat = { link = "GruvboxDimAqua" },
    haskellInfix = { link = "GruvboxDimPurple" },
    haskellQuote = { link = "GruvboxDimGreenBold" },
    haskellShebang = { link = "GruvboxDimYellowBold" },
    haskellLiquid = { link = "GruvboxDimPurpleBold" },
    haskellQuasiQuoted = { link = "GruvboxDimBlueBold" },
    haskellRecursiveDo = { link = "GruvboxDimPurple" },
    haskellQuotedType = { link = "GruvboxDimRed" },
    haskellPreProc = { link = "GruvboxDimFg4" },
    haskellTypeRoles = { link = "GruvboxDimRedBold" },
    haskellTypeForall = { link = "GruvboxDimRed" },
    haskellPatternKeyword = { link = "GruvboxDimBlue" },
    -- json
    jsonKeyword = { link = "GruvboxDimGreen" },
    jsonQuote = { link = "GruvboxDimGreen" },
    jsonBraces = { link = "GruvboxDimFg1" },
    jsonString = { link = "GruvboxDimFg1" },
    -- mail
    mailQuoted1 = { link = "GruvboxDimAqua" },
    mailQuoted2 = { link = "GruvboxDimPurple" },
    mailQuoted3 = { link = "GruvboxDimYellow" },
    mailQuoted4 = { link = "GruvboxDimGreen" },
    mailQuoted5 = { link = "GruvboxDimRed" },
    mailQuoted6 = { link = "GruvboxDimOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "GruvboxDimFg1" },
    csEndColon = { link = "GruvboxDimFg1" },
    csLogicSymbols = { link = "GruvboxDimFg1" },
    csParens = { link = "GruvboxDimFg3" },
    csOpSymbols = { link = "GruvboxDimFg3" },
    csInterpolationDelimiter = { link = "GruvboxDimFg3" },
    csInterpolationAlignDel = { link = "GruvboxDimAquaBold" },
    csInterpolationFormat = { link = "GruvboxDimAqua" },
    csInterpolationFormatDel = { link = "GruvboxDimAquaBold" },
    -- rust btw
    rustSigil = { link = "GruvboxDimOrange" },
    rustEscape = { link = "GruvboxDimAqua" },
    rustStringContinuation = { link = "GruvboxDimAqua" },
    rustEnum = { link = "GruvboxDimAqua" },
    rustStructure = { link = "GruvboxDimAqua" },
    rustModPathSep = { link = "GruvboxDimFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "GruvboxDimAqua" },
    -- ocaml
    ocamlOperator = { link = "GruvboxDimFg1" },
    ocamlKeyChar = { link = "GruvboxDimOrange" },
    ocamlArrow = { link = "GruvboxDimOrange" },
    ocamlInfixOpKeyword = { link = "GruvboxDimRed" },
    ocamlConstructor = { link = "GruvboxDimOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "GruvboxDimFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "GruvboxDimFg1" },
    LspSagaAutoPreview = { link = "GruvboxDimOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "GruvboxDimAqua" },
    LspSagaDefPreviewBorder = { link = "GruvboxDimBlue" },
    LspSagaHoverBorder = { link = "GruvboxDimOrange" },
    LspSagaRenameBorder = { link = "GruvboxDimBlue" },
    LspSagaDiagnosticSource = { link = "GruvboxDimOrange" },
    LspSagaDiagnosticBorder = { link = "GruvboxDimPurple" },
    LspSagaDiagnosticHeader = { link = "GruvboxDimGreen" },
    LspSagaSignatureHelpBorder = { link = "GruvboxDimGreen" },
    SagaShadow = { link = "GruvboxDimBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "GruvboxDimOrange" },
    DashboardHeader = { link = "GruvboxDimAqua" },
    DashboardCenter = { link = "GruvboxDimYellow" },
    DashboardFooter = { fg = colors.purple, italic = config.italic },
    -- mason
    MasonHighlight = { link = "GruvboxDimAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "GruvboxDimFg1" },
    CarbonExe = { link = "GruvboxDimYellow" },
    CarbonSymlink = { link = "GruvboxDimAqua" },
    CarbonBrokenSymlink = { link = "GruvboxDimRed" },
    CarbonIndicator = { link = "GruvboxDimGray" },
    CarbonDanger = { link = "GruvboxDimRed" },
    CarbonPending = { link = "GruvboxDimYellow" },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] and not vim.tbl_isempty(hl) then
      groups[group].link = nil
    end
    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
