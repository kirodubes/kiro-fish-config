# kiro-fish-config — Project Instructions

## Purpose
Fish shell configuration for Kiro, using the CachyOS-style **two-tier model**:
- **Payload** (package-owned, overwritten on upgrade): `usr/share/kiro/fish/kiro-config.fish`
  is a thin **loader** that sources `usr/share/kiro/fish/parts/*.fish` in numeric order
  (`00-env`, `10-interactive`, `20-keybindings`, `30-functions`, `40-aliases`,
  `50-integrations`). `00-env` runs for all shells (before the interactive guard); the rest
  are interactive-only. Do not put per-user logic here. Add new defaults as a numbered part.
- **Stub** (user-owned, never clobbered): `etc/skel/.config/fish/config.fish` just `source`s
  the payload; users add their own settings below the source line.

`/etc/skel/.config/fish/` ships **only** `config.fish` (the stub).

## Heritage
Split out of `kiro-shells` on 2026.06.26. `kiro-shells` is now a meta-package that
depends on this package plus `kiro-bash-config` and `kiro-zsh-config`.

## Standards
- Scripts follow the standard bash template (see global CLAUDE.md): `set -euo pipefail`,
  color/logging/error-trap boilerplate.

## Notes
- `depends=('fish')`; toolbelt the payload uses (`eza`, `bat`, `fastfetch`, `expac`, `hwinfo`)
  is `optdepends`. oh-my-fish / fisher / tide are NOT shipped — prompt/plugin orchestration is
  the Fish Tweak Tool's job.
- Greeting is **quiet by default** (no fastfetch); the fastfetch block is left commented in
  the payload as an opt-in.
- Colours/prompt are deliberately NOT set in the payload — that's the Fish Tweak Tool's domain
  (`fish_config theme` / `prompt`).
- Carries `conflicts=('cachyos-fish-config')` (both ship a fish config) — moved here from
  `kiro-shells` in the split.
- The PKGBUILD lives in `KIRO-PKG-BUILD-APPS/kiro-fish-config`; its `package()` copies the
  whole `etc/` and `usr/` trees (don't reintroduce the `.*` glob — it skips `usr/share/kiro/`).
- fish has **no `[..]` bracket globs** (only `*`/`**`/`?`) — the loader globs `*.fish` and skips
  `00-env.fish` rather than using a char-class. Personal/dev aliases stay commented at the
  bottom of `40-aliases.fish`. Run `fish --no-execute` on changed parts before shipping.
- **FTT override contract (load order):** fish sources `conf.d/*.fish` **before** `config.fish`, and
  our stub sources this payload from `config.fish` — so the payload runs *after* `conf.d`. Any
  per-user override (greeting/aliases/presets) must go **below the `source` line in the user's
  `config.fish`, never in `conf.d`** (it would be clobbered). Theme/prompt go via
  `fish_config theme save` / `prompt save`. Greeting must not be `set -U` (the payload's
  `set -g fish_greeting` shadows a universal). Pinned in `fish-tweak-tool.md`.
