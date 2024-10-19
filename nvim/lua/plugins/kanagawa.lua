local colors = {
    accent1 = "#6363c4",
    accent2 = "#5353ab",
    accent3 = "#43438e",
    accent4 = "#343457",
}

require('kanagawa').setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = {
        palette = {},
        theme = { 
			wave = {},
			lotus = {},
			dragon = {},
			all = {}
		},
    },
	overrides = function(colors)
        return {
            Normal = { fg = "#FFFFFF", bg = "NONE" },
			CursorLine = { bg = colors.accent4 },
    		LineNr = { fg = colors.accent1 },
    		CursorLineNr = { fg = colors.accent2 },
    		VertSplit = { fg = colors.accent3, bg = "NONE" },
    		StatusLine = { fg = "#FFFFFF", bg = colors.accent3 },
    		StatusLineNC = { fg = colors.accent3, bg = colors.accent4 },
    		Pmenu = { fg = "#FFFFFF", bg = colors.accent4 },
    		PmenuSel = { fg = "#FFFFFF", bg = colors.accent2 },
    		TabLine = { fg = colors.accent1, bg = colors.accent4 },
    		TabLineSel = { fg = "#FFFFFF", bg = colors.accent2 },
    		TabLineFill = { fg = "#FFFFFF", bg = colors.accent3 },
    		Visual = { bg = colors.accent2 },
    		MatchParen = { fg = "#FFFFFF", bg = colors.accent1 }
        }
    end,
    theme = "wave",
    background = {
        dark = "wave",
        light = "lotus"
    },
})
