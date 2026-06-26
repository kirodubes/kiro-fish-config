# Changelog

## 2026.06.26

### What Changed
- Initial package. Split out of `kiro-shells`: ships the fish configuration
  (`/etc/skel/.config/fish/`) as its own independently versioned package. `kiro-shells` is
  now a meta-package depending on `kiro-bash-config`, `kiro-zsh-config` and
  `kiro-fish-config`.

### Technical Details
- `package()` installs `etc/skel/.config/fish/` (config.fish, the numbered oh-my-fish /
  tide helper scripts, the `666-remove-…` cleanup, and the bash-users cheat-sheet).
- `depends=('fish')`. oh-my-fish / fisher / tide stay optional (installed via the helper
  scripts).
- Carries the `conflicts=('cachyos-fish-config')` from `kiro-shells` (both ship a fish
  config).

### Files Modified
- `etc/skel/.config/fish/*` (moved from `kiro-shells`)
