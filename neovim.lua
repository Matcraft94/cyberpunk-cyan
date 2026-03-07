return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true, bold = true },
					functions = { bold = true },
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
				on_colors = function(colors)
					-- Cyberpunk Cyan palette
					colors.bg = "#0a0a0f"
					colors.bg_dark = "#050508"
					colors.bg_highlight = "#12121a"
					colors.bg_popup = "#0f0f16"
					colors.bg_statusline = "#0a0a0f"
					colors.bg_visual = "#00CCCC"
					colors.border = "#00FFFF"
					colors.fg = "#e0f7ff"
					colors.fg_dark = "#8a9aa8"
					colors.fg_gutter = "#1a1a24"
					colors.fg_sidebar = "#8a9aa8"
					
					-- Syntax colors
					colors.blue = "#00FFFF"
					colors.blue0 = "#00CCCC"
					colors.blue1 = "#66FFFF"
					colors.blue2 = "#33dddd"
					colors.blue5 = "#00FFFF"
					colors.blue6 = "#99ffff"
					colors.blue7 = "#004d4d"
					colors.comment = "#4a4a5c"
					colors.cyan = "#00FFFF"
					colors.green = "#39ff14"
					colors.green1 = "#5fff44"
					colors.green2 = "#2dd90f"
					colors.magenta = "#ff00ff"
					colors.magenta2 = "#ff66ff"
					colors.orange = "#ff9e64"
					colors.purple = "#b829dd"
					colors.red = "#ff2a6d"
					colors.red1 = "#ff5c8d"
					colors.teal = "#00CCCC"
					colors.yellow = "#ffd700"
				end,
				on_highlights = function(highlights, colors)
					highlights.CursorLine = { bg = "#12121a" }
					highlights.LineNr = { fg = "#00FFFF" }
					highlights.CursorLineNr = { fg = "#00FFFF", bold = true }
					highlights.VertSplit = { fg = "#00FFFF" }
					highlights.StatusLine = { fg = "#e0f7ff", bg = "#0a0a0f" }
					highlights.StatusLineNC = { fg = "#4a4a5c", bg = "#0a0a0f" }
					highlights.Pmenu = { bg = "#0f0f16", fg = "#e0f7ff" }
					highlights.PmenuSel = { bg = "#00CCCC", fg = "#0a0a0f" }
					highlights.PmenuBorder = { fg = "#00FFFF" }
					highlights.TelescopeBorder = { fg = "#00FFFF" }
					highlights.TelescopePromptBorder = { fg = "#00FFFF" }
					highlights.TelescopeResultsBorder = { fg = "#00FFFF" }
					highlights.TelescopePreviewBorder = { fg = "#00FFFF" }
				end,
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
