local palette = require("zorn.palette")

local M = {}

function M.load(variant)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true

	local p
	if variant == "blue" then
		p = palette.blue
		vim.g.colors_name = "zorn-blue"
		vim.o.background = "dark"
	elseif variant == "plum" then
		p = palette.red
		vim.g.colors_name = "zorn-red"
		vim.o.background = "dark"
	elseif variant == "light" then
		p = palette.light
		vim.g.colors_name = "zorn-light"
		vim.o.background = "light"
	else
		p = palette.dark
		vim.g.colors_name = "zorn-dark"
		vim.o.background = "dark"
	end

	local hi = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- Editor chrome
	hi("Normal", { fg = p.parchment, bg = p.black })
	hi("NormalFloat", { fg = p.parchment, bg = p.shadow })
	hi("NormalNC", { fg = p.parchment, bg = p.black })
	hi("LineNr", { fg = p.slate })
	hi("CursorLineNr", { fg = p.ochre })
	hi("CursorLine", { bg = p.shadow })
	hi("CursorColumn", { bg = p.shadow })
	hi("ColorColumn", { bg = p.shadow })
	hi("SignColumn", { fg = p.slate, bg = p.black })
	hi("VertSplit", { fg = p.slate, bg = p.black })
	hi("WinSeparator", { fg = p.slate })
	hi("EndOfBuffer", { fg = p.shadow })
	hi("Folded", { fg = p.cool_gray, bg = p.shadow })
	hi("FoldColumn", { fg = p.slate, bg = p.black })
	hi("Visual", { bg = p.halfmix })
	hi("VisualNOS", { bg = p.halfmix })
	hi("Search", { fg = p.black, bg = p.ochre })
	hi("IncSearch", { fg = p.cream, bg = p.vermil })
	hi("CurSearch", { fg = p.cream, bg = p.vermil })
	hi("MatchParen", { fg = p.gold, underline = true })

	-- Status & tab line
	hi("StatusLine", { fg = p.parchment, bg = p.halfmix })
	hi("StatusLineNC", { fg = p.cool_gray, bg = p.shadow })
	hi("TabLine", { fg = p.cool_gray, bg = p.shadow })
	hi("TabLineSel", { fg = p.cream, bg = p.halfmix })
	hi("TabLineFill", { bg = p.shadow })
	hi("WinBar", { fg = p.parchment, bg = p.halfmix })
	hi("WinBarNC", { fg = p.cool_gray, bg = p.shadow })

	-- Popup menu
	hi("Pmenu", { fg = p.parchment, bg = p.shadow })
	hi("PmenuSel", { fg = p.black, bg = p.ochre })
	hi("PmenuSbar", { bg = p.halfmix })
	hi("PmenuThumb", { bg = p.blue_gray })
	hi("WildMenu", { fg = p.black, bg = p.ochre })

	-- Quickfix
	hi("qfFileName", { fg = p.ochre })
	hi("qfLineNr", { fg = p.blue_gray })
	hi("qfError", { fg = p.vermil })
	hi("qfSeparator", { fg = p.cool_gray })
	hi("QuickFixLine", { fg = p.cream, bg = p.halfmix })

	-- Messages
	hi("ModeMsg", { fg = p.ochre })
	hi("MoreMsg", { fg = p.ochre })
	hi("WarningMsg", { fg = p.gold })
	hi("ErrorMsg", { fg = p.vermil })
	hi("Question", { fg = p.gold })

	-- Spelling
	hi("SpellBad", { undercurl = true, sp = p.vermil })
	hi("SpellWarn", { undercurl = true, sp = p.ochre })
	hi("SpellCap", { undercurl = true, sp = p.blush })
	hi("SpellLocal", { undercurl = true, sp = p.earth })

	-- Classic syntax
	hi("Comment", { fg = p.quartermix, italic = true })
	hi("String", { fg = p.earth })
	hi("Character", { fg = p.earth })
	hi("Number", { fg = p.blush })
	hi("Float", { fg = p.blush })
	hi("Boolean", { fg = p.blush })
	hi("Constant", { fg = p.blush })
	hi("Keyword", { fg = p.rust })
	hi("Conditional", { fg = p.rust })
	hi("Repeat", { fg = p.rust })
	hi("Exception", { fg = p.vermil })
	hi("Statement", { fg = p.rust })
	hi("Label", { fg = p.gold })
	hi("Operator", { fg = p.rose_mist })
	hi("Function", { fg = p.ochre })
	hi("Identifier", { fg = p.parchment })
	hi("Type", { fg = p.earth })
	hi("TypeDef", { fg = p.earth })
	hi("StorageClass", { fg = p.rust })
	hi("Structure", { fg = p.earth })
	hi("Special", { fg = p.blush })
	hi("SpecialChar", { fg = p.blush })
	hi("SpecialComment", { fg = p.quartermix, italic = true })
	hi("Tag", { fg = p.rust })
	hi("Delimiter", { fg = p.cool_gray })
	hi("PreProc", { fg = p.maroon })
	hi("Include", { fg = p.maroon })
	hi("Define", { fg = p.maroon })
	hi("Macro", { fg = p.maroon })
	hi("PreCondit", { fg = p.maroon })
	hi("Todo", { fg = p.black, bg = p.ochre })
	hi("Error", { fg = p.vermil })
	hi("Underlined", { underline = true })
	hi("Ignore", { fg = p.blue_gray })

	-- Treesitter
	hi("@comment", { fg = p.quartermix, italic = true })
	hi("@comment.todo", { fg = p.black, bg = p.ochre })
	hi("@string", { fg = p.earth })
	hi("@string.escape", { fg = p.blush })
	hi("@string.special", { fg = p.blush })
	hi("@character", { fg = p.earth })
	hi("@number", { fg = p.blush })
	hi("@float", { fg = p.blush })
	hi("@boolean", { fg = p.blush })
	hi("@keyword", { fg = p.rust })
	hi("@keyword.return", { fg = p.vermil })
	hi("@keyword.operator", { fg = p.rust })
	hi("@keyword.function", { fg = p.rust })
	hi("@keyword.import", { fg = p.maroon })
	hi("@conditional", { fg = p.rust })
	hi("@repeat", { fg = p.rust })
	hi("@exception", { fg = p.vermil })
	hi("@operator", { fg = p.rose_mist })
	hi("@punctuation", { fg = p.cool_gray })
	hi("@punctuation.bracket", { fg = p.cool_gray })
	hi("@punctuation.delimiter", { fg = p.cool_gray })
	hi("@punctuation.special", { fg = p.blush })
	hi("@variable", { fg = p.parchment })
	hi("@variable.builtin", { fg = p.blush, italic = true })
	hi("@variable.parameter", { fg = p.sand, italic = true })
	hi("@variable.member", { fg = p.parchment })
	hi("@function", { fg = p.ochre })
	hi("@function.builtin", { fg = p.gold })
	hi("@function.call", { fg = p.blue_gray })
	hi("@function.macro", { fg = p.rust })
	hi("@function.method", { fg = p.ochre })
	hi("@function.method.call", { fg = p.blue_gray })
	hi("@constructor", { fg = p.gold })
	hi("@type", { fg = p.earth })
	hi("@type.builtin", { fg = p.earth })
	hi("@type.definition", { fg = p.earth })
	hi("@constant", { fg = p.blush })
	hi("@constant.builtin", { fg = p.blush })
	hi("@constant.macro", { fg = p.maroon })
	hi("@property", { fg = p.parchment })
	hi("@attribute", { fg = p.maroon })
	hi("@namespace", { fg = p.earth })
	hi("@module", { fg = p.earth })
	hi("@label", { fg = p.gold })
	hi("@tag", { fg = p.rust })
	hi("@tag.builtin", { fg = p.maroon })
	hi("@tag.attribute", { fg = p.gold })
	hi("@tag.delimiter", { fg = p.blue_gray })
	hi("@markup.heading", { fg = p.ochre })
	hi("@markup.link", { fg = p.earth, underline = true })
	hi("@markup.link.url", { fg = p.blush, underline = true })
	hi("@markup.italic", { italic = true })
	hi("@markup.strong", { bold = true })
	hi("@markup.raw", { fg = p.earth })

	-- Disable LSP semantic tokens so Treesitter highlights take full control
	hi("@lsp.type.class", {})
	hi("@lsp.type.comment", {})
	hi("@lsp.type.decorator", {})
	hi("@lsp.type.enum", {})
	hi("@lsp.type.enumMember", {})
	hi("@lsp.type.function", {})
	hi("@lsp.type.interface", {})
	hi("@lsp.type.keyword", {})
	hi("@lsp.type.macro", {})
	hi("@lsp.type.method", {})
	hi("@lsp.type.namespace", {})
	hi("@lsp.type.number", {})
	hi("@lsp.type.operator", {})
	hi("@lsp.type.parameter", {})
	hi("@lsp.type.property", {})
	hi("@lsp.type.string", {})
	hi("@lsp.type.struct", {})
	hi("@lsp.type.type", {})
	hi("@lsp.type.typeParameter", {})
	hi("@lsp.type.variable", {})
	hi("@lsp.mod.deprecated", { strikethrough = true })

	-- Diagnostics
	hi("DiagnosticError", { fg = p.vermil })
	hi("DiagnosticWarn", { fg = p.ochre })
	hi("DiagnosticInfo", { fg = p.cool_gray })
	hi("DiagnosticHint", { fg = p.blue_gray })
	hi("DiagnosticOk", { fg = p.moss })
	hi("DiagnosticUnderlineError", { undercurl = true, sp = p.vermil })
	hi("DiagnosticUnderlineWarn", { undercurl = true, sp = p.ochre })
	hi("DiagnosticUnderlineInfo", { undercurl = true, sp = p.cool_gray })
	hi("DiagnosticUnderlineHint", { undercurl = true, sp = p.blue_gray })
	hi("DiagnosticVirtualTextError", { fg = p.rust, italic = true })
	hi("DiagnosticVirtualTextWarn", { fg = p.earth, italic = true })
	hi("DiagnosticVirtualTextInfo", { fg = p.blue_gray, italic = true })
	hi("DiagnosticVirtualTextHint", { fg = p.blue_gray, italic = true })
	hi("DiagnosticSignError", { fg = p.vermil })
	hi("DiagnosticSignWarn", { fg = p.ochre })
	hi("DiagnosticSignInfo", { fg = p.cool_gray })
	hi("DiagnosticSignHint", { fg = p.blue_gray })

	-- Git / Diff
	hi("DiffAdd", { fg = p.moss, bg = p.shadow })
	hi("DiffChange", { fg = p.sand, bg = p.shadow })
	hi("DiffDelete", { fg = p.rust, bg = p.shadow })
	hi("DiffText", { fg = p.blush, bg = p.shadow })
	hi("diffAdded", { fg = p.moss })
	hi("diffRemoved", { fg = p.rust })
	hi("diffChanged", { fg = p.sand })
	hi("diffFile", { fg = p.parchment })
	hi("diffLine", { fg = p.blue_gray })
	hi("diffIndexLine", { fg = p.blush })

	-- Gitsigns
	hi("GitSignsAdd", { fg = p.moss })
	hi("GitSignsChange", { fg = p.sand })
	hi("GitSignsDelete", { fg = p.rust })

	-- Telescope
	hi("TelescopeNormal", { fg = p.parchment, bg = p.shadow })
	hi("TelescopeBorder", { fg = p.slate, bg = p.shadow })
	hi("TelescopePromptNormal", { fg = p.cream, bg = p.halfmix })
	hi("TelescopePromptBorder", { fg = p.slate, bg = p.halfmix })
	hi("TelescopePromptPrefix", { fg = p.ochre, bg = p.halfmix })
	hi("TelescopeSelection", { fg = p.cream, bg = p.slate })
	hi("TelescopeMatching", { fg = p.ochre })
	hi("TelescopeResultsTitle", { fg = p.ochre })
	hi("TelescopePreviewTitle", { fg = p.earth })

	-- nvim-tree
	hi("NvimTreeNormal", { fg = p.parchment, bg = p.shadow })
	hi("NvimTreeFolderIcon", { fg = p.ochre })
	hi("NvimTreeFolderName", { fg = p.parchment })
	hi("NvimTreeRootFolder", { fg = p.ochre })
	hi("NvimTreeOpenedFile", { fg = p.gold })
	hi("NvimTreeGitDirty", { fg = p.sand })
	hi("NvimTreeGitNew", { fg = p.moss })
	hi("NvimTreeGitDeleted", { fg = p.rust })
	hi("NvimTreeIndentMarker", { fg = p.slate })

	-- Neotest
	hi("NeotestPassed", { fg = p.moss })
	hi("NeotestFailed", { fg = p.vermil })
	hi("NeotestRunning", { fg = p.ochre })
	hi("NeotestSkipped", { fg = p.cool_gray })

	-- Which-key
	hi("WhichKey", { fg = p.ochre })
	hi("WhichKeyGroup", { fg = p.gold })
	hi("WhichKeyDesc", { fg = p.parchment })
	hi("WhichKeySeperator", { fg = p.blue_gray })
	hi("WhichKeyFloat", { bg = p.shadow })

	-- Terminal colors
	vim.g.terminal_color_0 = p.shadow
	vim.g.terminal_color_1 = p.vermil
	vim.g.terminal_color_2 = p.moss
	vim.g.terminal_color_3 = p.ochre
	vim.g.terminal_color_4 = p.slate
	vim.g.terminal_color_5 = p.rust
	vim.g.terminal_color_6 = p.blue_gray
	vim.g.terminal_color_7 = p.parchment
	vim.g.terminal_color_8 = p.halfmix
	vim.g.terminal_color_9 = p.blush
	vim.g.terminal_color_10 = "#8BAD56"
	vim.g.terminal_color_11 = p.gold
	vim.g.terminal_color_12 = p.blue_gray
	vim.g.terminal_color_13 = p.blush
	vim.g.terminal_color_14 = p.cool_gray
	vim.g.terminal_color_15 = p.cream
end

return M
