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
  alias lss='eza'
  alias la='eza --git --icons --color always --long --all'
  alias las='eza --long --all'
  alias ll='eza --git --icons --color always --long'
  alias lls='eza --long'
else if type -q exa
  alias ls='exa --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
  alias lss='exa'
  alias la='exa --git --icons --color always --long --all'
  alias las='exa --long --all'
  alias ll='exa --git --icons --color always --long'
  alias lls='exa --long'
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

# GNU Stow setup
if type -q stow
  if not set -q dotfiles_dir; set -g dotfiles_dir ~/Dotfiles; end
  if not set -q dotfiles_target; set -g dotfiles_target $HOME; end

  function __dotfiles_completions
    for dir in $dotfiles_dir/*
      if test -d $dir
        echo (basename $dir)
      end
    end
  end

  function dot --wraps=stow --description "Stow package(s) inside $dotfiles_dir"
    stow --dir $dotfiles_dir --target "$dotfiles_target" --stow $argv
  end

  function undot --wraps=stow --description "Unstow package(s) inside $dotfiles_dir"
    stow --dir $dotfiles_dir --target "$dotfiles_target" --delete $argv
  end

  function redot --wraps=stow --description "Restow package(s) inside $dotfiles_dir"
    stow --dir $dotfiles_dir --target "$dotfiles_target" --restow $argv
  end

  complete -f -c dot -a "(__dotfiles_completions)"
  complete -f -c undot -a "(__dotfiles_completions)"
  complete -f -c redot -a "(__dotfiles_completions)"
end

if type -q tldr
  function __tldr_completions
    tldr --list | awk '{print $1}'
  end

  complete -f -c tldr -a "(__tldr_completions)"
end
