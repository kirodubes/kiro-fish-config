# kiro-fish-config — Project Instructions

## Purpose
Fish shell configuration for Kiro. Ships `/etc/skel/.config/fish/` (config.fish, the
oh-my-fish/tide helper scripts, and a bash-users cheat-sheet) so every new user inherits
the Kiro fish setup.

## Heritage
Split out of `kiro-shells` on 2026.06.26. `kiro-shells` is now a meta-package that
depends on this package plus `kiro-bash-config` and `kiro-zsh-config`.

## Standards
- Scripts follow the standard bash template (see global CLAUDE.md): `set -euo pipefail`,
  color/logging/error-trap boilerplate.

## Notes
- `depends=('fish')`. oh-my-fish / fisher / tide are NOT dependencies — they are opt-in via
  the numbered helper scripts shipped in `etc/skel/.config/fish/`.
- Carries `conflicts=('cachyos-fish-config')` (both ship a fish config) — moved here from
  `kiro-shells` in the split.
