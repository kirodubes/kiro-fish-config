<p align="center">
  <img src="kiro.jpg" alt="Kiro" width="220" />
</p>

# kiro-fish-config

Fish shell configuration for the Kiro Arch Linux distro.

## What it ships

Delivered to `/etc/skel/.config/fish/` so every new user inherits it:

- `config.fish` — the Kiro fish configuration.
- `fish-for-bash-users.md` — cheat-sheet for users coming from bash.
- Numbered helper scripts to opt into oh-my-fish / fisher / tide:
  `1-install-oh-my-fish.sh` … `4-install-tide-plugin.sh`, plus
  `666-remove-oh-my-fish-and-all-folders-completely.sh` to undo them.

The oh-my-fish / fisher / tide frameworks are optional and installed on demand via the
helper scripts.

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
