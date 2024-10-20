local colors = {
    accent1 = "#6363c4",
    accent2 = "#5353ab",
    accent3 = "#43438e",
	c_black = "#111111",
	c_pink = "#ff4da6",
	c_blue = "#6363c4",
	c_dblue = "#343457",
	c_ddblue = "#1A1A1F",
	c_green = "#3dd3a5",
	c_red = "#8e1c1c",
	c_orange = "#9f6f17"
}

require('kanagawa').setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    colors = {
        palette = {
			sumiInk4 = colors.c_ddblue,
			sumiInk3 = "#111111"
		},
        theme = { 
			wave = {},
			lotus = {},
			dragon = {},
			all = {}
		},
    },
	overrides = function()
        return {
            Normal = { fg = "#FFFFFF", bg = "NONE" },
			CursorLine = { bg = colors.accent4 },
			LineNr = { fg = colors.c_blue, bg = colors.c_ddblue },
			LineNrAbove = { bg = colors.c_ddblue, fg = colors.c_dblue },
			LineNrBelow = { bg = colors.c_ddblue, fg = colors.c_dblue },
			SignColumn = { bg = colors.c_ddblue },
			VertSplit = { fg = colors.c_dblue, bg = "NONE" },
			StatusLine = { fg = colors.c_pink, bg = colors.c_ddblue },
			StatusLineNC = { fg = colors.accent3, bg = colors.c_ddblue },
			Pmenu = { fg = colors.c_dblue, bg = colors.c_ddblue },
			PmenuSel = { fg = colors.c_pink, bg = colors.c_dblue },
			Cmdline = { fg = colors.c_green, bg = colors.c_green },
			-- CmdlineInput = { fg = "#ff4da6", bg = "NONE" },
			TabLine = { fg = colors.c_blue, bg = colors.c_ddblue },
			TabLineSel = { fg = colors.c_pink, bg = colors.c_dblue },
			TabLineFill = { fg = colors.c_blue, bg = colors.c_ddblue },
			Visual = { bg = colors.c_dblue },
			MatchParen = { fg = "#FFFFFF", bg = colors.c_blue },
			TelescopeTitle = { fg = colors.c_blue, bold = true },
			TelescopePromptNormal = { fg = colors.c_green },
			TelescopePromptBorder = { fg = colors.c_dblue },
			TelescopePromptPrefix = { fg = colors.c_green, bold = true },
			TelescopeResultsNormal = { fg = colors.c_dblue },
			TelescopeResultsBorder = { link = "TelescopePromptBorder" },
			TelescopePreviewBorder = { link = "TelescopePromptBorder" },
			TelescopeSelection = { bg = colors.c_blue, bold = true }, 
			TelescopeSelectionCaret = { fg = colors.c_blue, bold = true },
			CmpBorder = { fg = colors.c_dblue },
			CmpDocBorder = { fg = colors.c_dblue },
			CmpCompletionBorder = { fg = colors.c_pink },
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
        	FloatTitle = { bg = "none" },
			MsgArea = { fg = colors.c_blue }
        }
    end,
    theme = "wave",
    background = {
        dark = "wave",
        light = "lotus"
    },
})
