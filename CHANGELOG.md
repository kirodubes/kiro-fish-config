# Changelog

## 2026.06.26

### What Changed
- Initial package. Split out of `kiro-shells`: ships the fish configuration as its own
  independently versioned package. `kiro-shells` is now a meta-package depending on
  `kiro-bash-config`, `kiro-zsh-config` and `kiro-fish-config`.
- Reworked the config into the CachyOS-style **two-tier model**: a basic, documented,
  package-owned payload plus a thin user stub. Replaced the previous ~540-line maximalist
  `config.fish` with a clean default; the greeting is now quiet by default (no fastfetch).

### Technical Details
- **Payload** (package-owned, overwritten on upgrade): `usr/share/kiro/fish/kiro-config.fish`
  — PATH/env (set before the interactive guard), bat man-pager, a quiet greeting, native
  prompt (zero-dep), a few helper functions (`history`, `backup`, `reload`) and a trimmed
  Manjaro-lineage alias set. No colours/prompt baked in (left to the Fish Tweak Tool).
- **Stub** (user-owned, never touched by upgrades): `etc/skel/.config/fish/config.fish` now
  just `source`s the payload and documents where to put personal settings.
- `/etc/skel` slimmed to **only** `config.fish` — removed the numbered oh-my-fish/tide helper
  scripts, the `666-remove-…` cleanup, and the bash-users cheat-sheet.
- PKGBUILD (in `KIRO-PKG-BUILD-APPS/kiro-fish-config`): `package()` now copies the whole
  `etc/` and `usr/` trees (the old `.*` glob skipped the non-dotfile `usr/share/kiro/`);
  added `optdepends` for the toolbelt (`eza`, `bat`, `fastfetch`, `expac`, `hwinfo`).
- `depends=('fish')`. Carries `conflicts=('cachyos-fish-config')` from `kiro-shells`.

### Files Modified
- `usr/share/kiro/fish/kiro-config.fish` (new — the payload)
- `etc/skel/.config/fish/config.fish` (rewritten as the stub)
- `etc/skel/.config/fish/{1..4-install-*.sh, 666-remove-*.sh, fish-for-bash-users.md}` (removed)
- `KIRO-PKG-BUILD-APPS/kiro-fish-config/PKGBUILD` (`package()` rewrite + `optdepends`)
