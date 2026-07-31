# Reminder
## `.git` was removed from `ghostty/shaders`

The `ghostty/shaders` folder was originally a cloned repo from:
`https://github.com/sahaj-b/ghostty-cursor-shaders`

I deleted its `.git` folder (`rm -rf ~/.config/ghostty/shaders/.git`) so it could be copied cleanly as plain files, instead of causing nested-repo/permission issues.

**This means:**
- If the author (sahaj-b) pushes updates/fixes, I won't get them automatically, I'd need to manually re-clone and diff, or re-add it as a submodule.

**If I want to re-link it as a submodule later:**
```bash
git submodule add https://github.com/sahaj-b/ghostty-cursor-shaders ghostty/shaders
```
