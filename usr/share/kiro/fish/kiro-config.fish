#
# kiro-config.fish — Kiro's default fish configuration (shared payload)
#
# Installed to : /usr/share/kiro/fish/kiro-config.fish   (owned by the package)
# Sourced from : ~/.config/fish/config.fish              (a thin stub, yours to edit)
#
# Package upgrades replace THIS file, so do not edit it here. To change, add or
# disable anything, put it in ~/.config/fish/config.fish below the `source` line
# — your home config is loaded last and always wins.
#

# ── PATH ──────────────────────────────────────────────────────────────────────
# Prepend user-local bin dirs. Done before the interactive guard so non-interactive
# scripts inherit the same PATH.
for dir in $HOME/.local/bin $HOME/.bin
    if test -d $dir; and not contains $dir $PATH
        set -gx PATH $dir $PATH
    end
end

# ── Environment ───────────────────────────────────────────────────────────────
# Default editor for the shell and tools that honour $EDITOR/$VISUAL.
set -gx EDITOR nano
set -gx VISUAL nano

# Render man pages through bat (colour + paging) when bat is installed.
if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT -c
end

# Everything below is for interactive shells only — skip it for scripts.
status is-interactive; or exit

# ── Greeting ──────────────────────────────────────────────────────────────────
# No greeting on launch — keep the terminal quiet (this also suppresses fish's
# default welcome message). To show a system summary instead, uncomment the block
# below, or add it to your own ~/.config/fish/config.fish.
set -g fish_greeting
# if type -q fastfetch
#     function fish_greeting
#         fastfetch
#     end
# end

# ── Prompt ────────────────────────────────────────────────────────────────────
# Kiro ships no prompt of its own: fish's built-in prompt is the zero-dependency
# default. Choose another built-in style with
#   fish_config prompt choose <name>; and fish_config prompt save
# or install a full prompt (Tide, Starship, …) via the Fish Tweak Tool.

# ── Functions ─────────────────────────────────────────────────────────────────
# Command history with timestamps, oldest first.
function history --description 'History with timestamps'
    builtin history --show-time='%F %T ' | sort
end

# Quick backup: backup <file> -> <file>.bak
function backup --argument filename --description 'Copy a file to <file>.bak'
    cp $filename $filename.bak
end

# Reload fish after editing your config.
function reload --description 'Restart fish to reload config'
    exec fish
end

# ── Aliases ───────────────────────────────────────────────────────────────────
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing — eza when available, otherwise coloured ls.
if type -q eza
    alias ls='eza --group-directories-first --icons'
    alias ll='eza -lh --group-directories-first --icons'
    alias la='eza -lah --group-directories-first --icons'
else
    alias ls='ls --color=auto'
    alias ll='ls -lh'
    alias la='ls -lah'
end

# Coloured grep family
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Human-readable output
alias df='df -h'
alias free='free -m'

# Package management (pacman)
alias update='sudo pacman -Syu'                            # full system upgrade
alias fixpacman='sudo rm -f /var/lib/pacman/db.lck'        # clear a stale pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'            # remove orphaned packages
alias big="expac -H M '%m\t%n' | sort -h | nl"             # installed packages by size
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"  # recently installed

# System info / troubleshooting
alias hw='hwinfo --short'                                  # hardware summary
alias jctl='journalctl -p 3 -xb'                           # errors from the current boot
