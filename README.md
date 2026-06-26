<p align="center">
  <img src="kiro.jpg" alt="Kiro" width="220" />
</p>

# kiro-fish-config

Fish shell configuration for the Kiro Arch Linux distro.

## What it ships

A two-tier config, so package upgrades never clobber your personal settings:

- `/usr/share/kiro/fish/kiro-config.fish` — the **payload**: Kiro's default aliases,
  functions, environment and a quiet greeting. Owned by the package and overwritten on every
  upgrade, so don't edit it here.
- `/etc/skel/.config/fish/config.fish` — a thin **stub** every new user inherits. It just
  `source`s the payload and is the place for your own settings; upgrades never touch it.

To customise, edit your own `~/.config/fish/config.fish` below the `source` line — your
settings load last and override the Kiro defaults. Delete the `source` line to opt out
entirely.

## Install

```bash
sudo pacman -S kiro-fish-config
```

Pulled in automatically by the `kiro-shells` meta-package alongside
`kiro-bash-config` and `kiro-zsh-config`.

> DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.

## Heritage & credits

Kiro's fish defaults stand on the shoulders of the Arch-based community. The table below
records what we borrowed from our "colleague" distros and where it lives in the package.

**Adopted from colleagues**

| Element | From | In Kiro | Where | Notes |
|---|---|---|---|---|
| Two-tier packaging (system payload + thin user stub) | CachyOS | ✅ | `usr/share/kiro/fish/` + `/etc/skel` stub | the core idea we copied — clean upgrades, no clobbering |
| `!!` / `!$` bash-style history helpers | CachyOS | ✅ verbatim | `parts/20-keybindings.fish` | kept byte-exact from upstream |
| `copy` (recursive-aware `cp`) | CachyOS | ✅ adapted | `parts/30-functions.fish` | rewritten to fish-native `string trim` |
| `done` long-command notify tuning (`__done_*`) | CachyOS / Garuda | ✅ vars only | `parts/50-integrations.fish` | the plugin itself is installed via fisher / the Fish Tweak Tool |
| `bat` as man-pager (`MANPAGER` / `MANROFFOPT`) | CachyOS / Garuda | ✅ | `parts/00-env.fish` | guarded by `type -q bat` |
| Timestamped `history`, `backup` helpers | CachyOS | ✅ | `parts/30-functions.fish` | |
| `cleanup` (remove orphaned packages) | Garuda (function form) | ✅ improved | `parts/30-functions.fish` | no-ops cleanly when there are no orphans |
| Shared alias set (`..` ladder, `fixpacman`, `big`, `hw`, `rip`, `jctl`, `gitpkg`, mirrors) | Manjaro lineage | ✅ retained | `parts/40-aliases.fish` | the vocabulary CachyOS/Garuda also inherited |

**Deliberately not adopted**

| Element | From | Why not |
|---|---|---|
| Starship as a hard dependency | Garuda | native prompt is the zero-dep default; prompt is the Fish Tweak Tool's job |
| fastfetch greeting on by default | CachyOS / Garuda | shipped **off** (quiet) — fastfetch is left commented as an opt-in |
| `cat` → `bat` alias | Garuda | `bat` is used as the man-pager only |
| Joke / nag aliases (`please`, `helpme`, `apt`) | Garuda | another distro's personality, not Kiro's |
| Pure prompt shipped via package | CachyOS | prompt and colours are owned by `fish_config` / the Fish Tweak Tool |

Upstreams: [CachyOS/cachyos-fish-config](https://github.com/CachyOS/cachyos-fish-config) ·
[garuda-fish-config](https://gitlab.com/garuda-linux/pkgbuilds/-/tree/main/garuda-fish-config) ·
Manjaro (the shared alias lineage) ·
[franciscolourenco/done](https://github.com/franciscolourenco/done).

<!-- KIRO-FUNDING-FOOTER:START — managed by Kiro-HQ/cascade-readme-footer.sh -->
## Help fund Kiro

Everything I build here stays free and open — always. If Kiro or any of these
tools have ever saved you time or taught you something, a small monthly
contribution helps keep the work going. Donations target break-even, nothing
more — the core always stays free for everyone.

- GitHub Sponsors: https://github.com/sponsors/erikdubois
- Patreon: https://www.patreon.com/c/kiroproject
- YouTube memberships: https://www.youtube.com/@ErikDubois/join
- Ko-fi: https://ko-fi.com/erikdubois
- PayPal: https://www.paypal.me/erikdubois
<!-- KIRO-FUNDING-FOOTER:END -->
