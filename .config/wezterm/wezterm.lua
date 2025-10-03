-- WezTerm configuration file
local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font configuration
config.font = wezterm.font("Fira Code") -- Change this to your preferred font
config.font_size = 14.0

-- Catppuccin Mocha color scheme
config.colors = {
	-- Basic colors
	foreground = "#cdd6f4", -- Text
	background = "#1e1e2e", -- Base
	cursor_bg = "#f5e0dc", -- Rosewater
	cursor_fg = "#1e1e2e",
	cursor_border = "#f5e0dc",

	-- Selection colors
	selection_fg = "#1e1e2e",
	selection_bg = "#f5e0dc",

	-- ANSI colors
	ansi = {
		"#45475a", -- Black (Surface1)
		"#f38ba8", -- Red
		"#a6e3a1", -- Green
		"#f9e2af", -- Yellow
		"#89b4fa", -- Blue
		"#f5c2e7", -- Magenta
		"#94e2d5", -- Cyan
		"#bac2de", -- White (Subtext1)
	},

	-- Bright ANSI colors
	brights = {
		"#585b70", -- Bright Black (Surface2)
		"#f38ba8", -- Bright Red
		"#a6e3a1", -- Bright Green
		"#f9e2af", -- Bright Yellow
		"#89b4fa", -- Bright Blue
		"#f5c2e7", -- Bright Magenta
		"#94e2d5", -- Bright Cyan
		"#a6adc8", -- Bright White (Subtext0)
	},

	-- Tab bar colors
	tab_bar = {
		background = "#181825", -- Mantle
		active_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#cdd6f4",
		},
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#6c7086",
		},
		inactive_tab_hover = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
		},
		new_tab = {
			bg_color = "#181825",
			fg_color = "#6c7086",
		},
		new_tab_hover = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
		},
	},
}

config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

return config
