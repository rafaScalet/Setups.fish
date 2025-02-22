status is-interactive || exit

set -g SETUPS_CACHE $HOME/.cache/setups
mkdir -p $SETUPS_CACHE

# Mise init setup
if type -q ~/.local/bin/mise
  set -l mise_init_cache "$SETUPS_CACHE/mise_fish_init.fish"
  if not test -f "$mise_init_cache"
    ~/.local/bin/mise activate fish > "$mise_init_cache"
  end
  source "$mise_init_cache"
end

# Mise completion setup
if type -q usage
  set -l mise_completions_cache "$SETUPS_CACHE/mise_fish_completions.fish"
  if not test -f "$mise_completions_cache"
    ~/.local/bin/mise completions fish > "$mise_completions_cache"
  end
  source "$mise_completions_cache"
end

# Bat-cat setup
if type -q bat
  set -l bat_completions_cache "$SETUPS_CACHE/bat_fish_completions.fish"
  if not test -f "$bat_completions_cache"
    bat --completion fish > "$bat_completions_cache"
  end
  source "$bat_completions_cache"
  alias cat='bat'
else if ype -q bat-cat
  set -l bat_completions_cache "$SETUPS_CACHE/bat_fish_completions.fish"
  if not test -f "$bat_completions_cache"
    bat-cat --completion fish > "$bat_completions_cache"
  end
  source "$bat_completions_cache"
  alias cat='bat-cat'
end

# Eza/Exa setup
if type -q eza
  alias ls='eza --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
  alias la='eza --git --icons --color always --long --all'
  alias ll='eza --git --icons --color always --long'
  alias lt='eza --icons --color always --tree'
else if type -q exa
  alias ls='exa --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
  alias la='exa --git --icons --color always --long --all'
  alias ll='exa --git --icons --color always --long'
  alias lt='exa --icons --color always --tree'
end

# Zoxide setup
if type -q zoxide
  set -l zoxide_cache "$SETUPS_CACHE/zoxide_fish_init.fish"
  if not test -f "$zoxide_cache"
    zoxide init fish --cmd cd > "$zoxide_cache"
  end
  source "$zoxide_cache"
end

# TheFuck setup
if type -q thefuck
  set -l thefuck_cache "$SETUPS_CACHE/thefuck_fish_init.fish"
  if not test -f "$thefuck_cache"
    thefuck --alias > "$thefuck_cache"
    thefuck --alias fk > "$thefuck_cache"
  end
  source "$thefuck_cache"
end

# Fastfetch setup
if type -q fastfetch
  alias neofetch='fastfetch'
  alias fetch='fastfetch'
end

# PNPM setup
if type -q pnpm
  set -l pnpm_cache "$SETUPS_CACHE/pnpm_fish_completion.fish"
  if not test -f "$pnpm_cache"
    pnpm completion fish > "$pnpm_cache"
  end
  source "$pnpm_cache"
end
