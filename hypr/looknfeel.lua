-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
	general = {
		-- No gaps between windows or borders.
		gaps_in = 3,
		gaps_out = 3,
		border_size = 2,

		["col.active_border"] = "rgba(255, 255, 255, 0.15)",
		["col.inactive_border"] = "rgba(255, 255, 255, 0.01)",

		-- Change to niri-like side-scrolling layout.
		--    layout = "scrolling",
	},
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
	decoration = {
		-- Use round window corners.
		rounding = 23,

		blur = {
			enabled = true,
			size = 10,
			passes = 4,
		},

		-- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
		dim_inactive = true,
		dim_strength = 0.15,
	},
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
hl.curve("mybezier", { type = "bezier", points = { { 0.05, 1.0 }, { 0, 1 } } })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "mybezier", style = "slidefade" })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, xray = true, ignore_alpha = 0.2 })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })
