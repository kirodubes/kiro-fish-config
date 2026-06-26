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
