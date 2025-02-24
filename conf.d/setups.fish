status is-interactive || exit

# Mise init setup
if type -q ~/.local/bin/mise
  set -l mise_init_cache "$__fish_config_dir/conf.d/setups_mise_init.fish"
  if not test -f "$mise_init_cache"
    ~/.local/bin/mise activate fish > "$mise_init_cache"
  end
  source "$mise_init_cache"
end

# Mise completion setup
if type -q usage
  set -l mise_completions_cache "$__fish_config_dir/conf.d/setups_mise_completions.fish"
  if not test -f "$mise_completions_cache"
    ~/.local/bin/mise completions fish > "$mise_completions_cache"
  end

  set -l usage_completions_cache "$__fish_config_dir/conf.d/setups_usage_completions.fish"
  if not test -f "$usage_completions_cache"
    usage --completions fish > "$usage_completions_cache"
  end
end

# Bat-cat setup
if type -q bat
  set -l bat_completions_cache "$__fish_config_dir/conf.d/setups_bat_completions.fish"
  if not test -f "$bat_completions_cache"
    bat --completion fish > "$bat_completions_cache"
  end
  alias cat='bat'
else if ype -q batcat
  set -l bat_completions_cache "$__fish_config_dir/conf.d/setups_bat_completions.fish"
  if not test -f "$bat_completions_cache"
    bat-cat --completion fish > "$bat_completions_cache"
  end
  alias cat='batcat'
end

# Eza/Exa setup
if type -q eza
  alias ls='eza --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
  alias lst='eza --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize --tree'
  alias la='eza --git --icons --color always --long --all'
  alias lat='eza --git --icons --color always --long --all --tree'
  alias ll='eza --git --icons --color always --long'
  alias llt='eza --git --icons --color always --long --tree'
  alias lt='eza --icons --color always --tree'
else if type -q exa
  alias ls='exa --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
  alias lst='exa --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize --tre'
  alias la='exa --git --icons --color always --long --all'
  alias lat='exa --git --icons --color always --long --all --tree'
  alias ll='exa --git --icons --color always --long'
  alias llt='exa --git --icons --color always --long --tree'
  alias lt='exa --icons --color always --tree'
end

# Zoxide setup
if type -q zoxide
  set -l zoxide_cache "$__fish_config_dir/conf.d/setups_zoxide_init.fish"
  if not test -f "$zoxide_cache"
    zoxide init fish --cmd cd > "$zoxide_cache"
  end
end

# TheFuck setup
if type -q thefuck
  set -l thefuck_cache "$__fish_config_dir/conf.d/setups_thefuck_init.fish"
  if not test -f "$thefuck_cache"
    thefuck --alias > "$thefuck_cache"
    thefuck --alias fk > "$thefuck_cache"
  end
end

# Fastfetch setup
if type -q fastfetch
  alias neofetch='fastfetch'
  alias fetch='fastfetch'
end

# PNPM setup
if type -q pnpm
  set -l pnpm_cache "$__fish_config_dir/conf.d/setups_pnpm_completion.fish"
  if not test -f "$pnpm_cache"
    pnpm completion fish > "$pnpm_cache"
  end
end
