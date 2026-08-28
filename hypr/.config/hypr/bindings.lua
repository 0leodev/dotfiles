-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")



-- Defauled shorten -- Overrides for Omarchy default app bindings

-- SUPER+SHIFT+G was Signal -> Grok
hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + SHIFT + G", "Grok", 'omarchy-launch-webapp "https://grok.com"')

-- SUPER+SHIFT+C was Calendar -> Claude
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Claude", 'omarchy-launch-webapp "https://claude.ai/new"')

-- SUPER+SHIFT+W was Omawrite -> WhatsApp
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "WhatsApp", 'omarchy-launch-or-focus-webapp "WhatsApp" "https://web.whatsapp.com/"')

-- SUPER+SHIFT+S was Google Maps -> screenshot
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")

-- SUPER+SHIFT+V was Universal paste -> code editor
hl.unbind("SUPER + SHIFT + V")
o.bind("SUPER + SHIFT + V", "Editor", "code")

-- Signal is default on SUPER+SHIFT+G; yours is on SUPER+SHIFT+CTRL+S (free key, no unbind needed)
o.bind("SUPER + SHIFT + CTRL + S", "Signal", 'omarchy-launch-or-focus "^signal$" "uwsm-app -- signal-desktop"')

-- Deepl: SUPER+SHIFT+T is free (no default)
o.bind("SUPER + SHIFT + T", "Deepl", 'omarchy-launch-webapp "https://www.deepl.com/en/translator"')

-- Logitech MX Keys
o.bind("Delete", nil, "voxtype record toggle")                        -- Dictation Button
o.bind("SUPER + SHIFT + CTRL + ALT + SPACE", nil, "omarchy-launch-walker -m symbols") -- Emoji Button



-- -- Application bindings
-- o.bind("SUPER + RETURN", "Terminal", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"')
-- o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" bash -c "tmux attach || tmux new -s Work"')
-- o.bind("SUPER + SHIFT + RETURN", "Browser", "omarchy-launch-browser")
-- o.bind("SUPER + SHIFT + F", "File manager", "uwsm-app -- nautilus --new-window")
-- o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", 'uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"')
-- o.bind("SUPER + SHIFT + B", "Browser", "omarchy-launch-browser")
-- o.bind("SUPER + ALT + SHIFT + B", "Browser (private)", "omarchy-launch-browser --private")
-- o.bind("SUPER + SHIFT + M", "Music", "omarchy-launch-or-focus spotify")
-- o.bind("SUPER + ALT + SHIFT + M", "Music TUI", "omarchy-launch-or-focus-tui cliamp")
-- o.bind("SUPER + SHIFT + N", "Editor", "omarchy-launch-editor")
-- o.bind("SUPER + SHIFT + V", "Editor", "code")
-- o.bind("SUPER + SHIFT + D", "Docker", "omarchy-launch-tui lazydocker")
-- o.bind("SUPER + SHIFT + CTRL + S", "Signal", 'omarchy-launch-or-focus "^signal$" "uwsm-app -- signal-desktop"')
-- o.bind("SUPER + SHIFT + O", "Obsidian", 'omarchy-launch-or-focus "^obsidian$" "uwsm-app -- obsidian"')
-- o.bind("SUPER + SHIFT + SLASH", "Passwords", "uwsm-app -- 1password")
--
-- -- If your web app url contains #, type it as ## to prevent hyprland treating it as a comment
-- o.bind("SUPER + SHIFT + A", "ChatGPT", 'omarchy-launch-webapp "https://chatgpt.com"')
-- o.bind("SUPER + SHIFT + C", "Claude", 'omarchy-launch-webapp "https://claude.ai/new"')
-- o.bind("SUPER + SHIFT + G", "Grok", 'omarchy-launch-webapp "https://grok.com"')
-- o.bind("SUPER + SHIFT + E", "Email", 'omarchy-launch-webapp "https://app.hey.com"')
-- o.bind("SUPER + SHIFT + Y", "YouTube", 'omarchy-launch-webapp "https://youtube.com/"')
-- o.bind("SUPER + SHIFT + T", "Deepl", 'omarchy-launch-webapp "https://www.deepl.com/en/translator"')
-- o.bind("SUPER + SHIFT + W", "WhatsApp", 'omarchy-launch-or-focus-webapp "WhatsApp" "https://web.whatsapp.com/"')
-- o.bind("SUPER + SHIFT + CTRL + G", "Google Messages", 'omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"')
-- o.bind("SUPER + SHIFT + P", "Google Photos", 'omarchy-launch-or-focus-webapp "Google Photos" "https://photos.google.com/"')
-- o.bind("SUPER + SHIFT + X", "X", 'omarchy-launch-webapp "https://x.com/"')
-- o.bind("SUPER + ALT + SHIFT + X", "X Post", 'omarchy-launch-webapp "https://x.com/compose/post"')
--
-- -- Add extra bindings
-- -- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")
--
-- -- Overwrite existing bindings, like putting Omarchy Menu on Super + Space
-- -- hl.unbind("SUPER + SPACE")
-- -- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu")
--
-- -- Logitech MX Keys
-- -- Remove the default Google Maps binding before overriding SUPER+SHIFT+S
-- hl.unbind("SUPER + SHIFT + S")
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")       -- Print Screen Button
-- o.bind("Delete", nil, "voxtype record toggle")                       -- Dictation Button
-- o.bind("SUPER + SHIFT + CTRL + ALT + SPACE", nil, "omarchy-launch-walker -m symbols") -- Emoji Button
