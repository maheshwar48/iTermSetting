# iTerm2 (manual — not fully automatable without exporting your plist)

After `install.sh`:

1. Open **iTerm2** → **Settings** → **Profiles** → **Text**
2. **Font**: `UbuntuMonoNerdFontMono-Regular`, size **15**
3. **Use built-in Powerline glyphs**: off (Nerd Font includes powerline)
4. **Use Unicode version 9+ widths**: on (helps emoji in prompt)

Optional: export this profile for other machines:

- **Settings → Profiles → Other actions… → Save Profile as JSON**
- Commit the JSON under `iterm/` in this repo and load it on a new Mac.

Round prompt joins need **Ubuntu Mono Nerd** in iTerm, not plain Ubuntu Mono.
