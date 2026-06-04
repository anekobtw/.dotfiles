hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.monitor({
	output = "",
	mode = "1920x1080@144",
	position = "auto",
	scale = 1,
})

hl.config({
	binds = { allow_workspace_cycles = true },

	general = {
		gaps_in = 16,
		gaps_out = 24,
		border_size = 3,
		col = {
			active_border = "rgba(89b4faee)",
			inactive_border = "rgba(313244ee)",
		},
	},

	decoration = {
		rounding = 16,
		blur = {
			enabled = true,
			size = 6,
			passes = 2,
		},
	},

	input = {
		kb_layout = "us",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true,
		},
	},
})

-- animations
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "quick" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "quick" })

-- binds
local mod = "SUPER"

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))

hl.bind("PRINT", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

hl.bind(mod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- workspaces
hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})

for i = 1, 7 do
	local key = i % 7
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- special keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
