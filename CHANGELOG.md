# Changelog

## 2026.06.26

### What Changed
- Added a `kiro-help` function (`30-functions.fish`) that prints a categorised overview of
  everything the config ships — helper functions, aliases (grouped under their section
  dividers), and the history keybindings. It parses the live `parts/*.fish` at runtime, so the
  overview never drifts from what is actually loaded.
- Initial package. Split out of `kiro-shells`: ships the fish configuration as its own
  independently versioned package. `kiro-shells` is now a meta-package depending on
  `kiro-bash-config`, `kiro-zsh-config` and `kiro-fish-config`.
- Reworked the config into the CachyOS-style **two-tier model**: a basic, documented,
  package-owned payload plus a thin user stub. Replaced the previous ~540-line maximalist
  `config.fish` with a clean default; the greeting is now quiet by default (no fastfetch).
- Split the payload into a `parts/` directory sourced by a thin loader, and reintroduced the
  full alias/function library (categorized, each line commented) plus colleague extras (`!!`/`!$`
  history helpers, recursive `copy`, `done`-plugin tuning). Personal/dev-box aliases are shipped
  commented-out. Added a Heritage & credits table (README) crediting CachyOS/Garuda/Manjaro.
- Added a pacman `.install` scriptlet (`post_install`/`post_upgrade`) that tells existing users how
  to copy the stub into their home (new users get it via `/etc/skel`). Hashtagged the forced
  `TERM=xterm-256color` (let the terminal own `TERM`). Fixed `README.md` mode to `0644`.

### Technical Details
- **Payload** (package-owned, overwritten on upgrade): `usr/share/kiro/fish/kiro-config.fish`
  is now a thin **loader** that sources `usr/share/kiro/fish/parts/*.fish`:
  `00-env` (PATH/env, before the interactive guard) · `10-interactive` (TERM, fzf opts, quiet
  greeting, prompt/colour pointers) · `20-keybindings` (`!!`/`!$`) · `30-functions` ·
  `40-aliases` (full categorized library + commented personal block) · `50-integrations`
  (fzf/direnv/tree hooks, `__done_*` via `set -g`). No colours/prompt baked in (Fish Tweak Tool).
- Loader uses a plain `*.fish` glob (fish has no `[..]` bracket globs) and skips the
  already-sourced `00-env.fish`. `copy` adapted to fish-native `string trim` (no `trim-right`
  dependency); `cleanup` is now a function that no-ops when there are no orphans; `bupskel`/
  `clean`/`cls` single-quoted so `(date)`/`(tput cols)` evaluate at call time, not at startup.
- **Stub** (user-owned, never touched by upgrades): `etc/skel/.config/fish/config.fish` now
  just `source`s the payload and documents where to put personal settings.
- `/etc/skel` slimmed to **only** `config.fish` — removed the numbered oh-my-fish/tide helper
  scripts, the `666-remove-…` cleanup, and the bash-users cheat-sheet.
- PKGBUILD (in `KIRO-PKG-BUILD-APPS/kiro-fish-config`): `package()` now copies the whole
  `etc/` and `usr/` trees (the old `.*` glob skipped the non-dotfile `usr/share/kiro/`);
  added `optdepends` for the toolbelt (`eza`, `bat`, `fastfetch`, `expac`, `hwinfo`).
- `depends=('fish')`. Carries `conflicts=('cachyos-fish-config')` from `kiro-shells`.

### Files Modified
- `usr/share/kiro/fish/kiro-config.fish` (the loader)
- `usr/share/kiro/fish/parts/{00-env,10-interactive,20-keybindings,30-functions,40-aliases,50-integrations}.fish` (new)
- `etc/skel/.config/fish/config.fish` (rewritten as the stub)
- `etc/skel/.config/fish/{1..4-install-*.sh, 666-remove-*.sh, fish-for-bash-users.md}` (removed)
- `KIRO-PKG-BUILD-APPS/kiro-fish-config/PKGBUILD` (`package()` rewrite + `optdepends`)
