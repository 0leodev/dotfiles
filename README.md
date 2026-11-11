### CPU stats missing from the bar?

If the CPU stats don't show up in the bar, the script probably isn't executable. Fix it with:

```bash
chmod +x ~/.config/omarchy/bar/scripts/cpu
```

Then restart the bar to apply the change.

```bash
omarchy restart shell
```
