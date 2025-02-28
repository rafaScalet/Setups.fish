status is-interactive || exit

set -g __setups_dir "$__fish_config_dir/conf.d"

# Mise init setup
if type -q ~/.local/bin/mise
  set -l mise_init "$__setups_dir/setups_mise_init.fish"
  if not test -f "$mise_init"
    ~/.local/bin/mise activate fish > "$mise_init"
  end
  source "$mise_init"
end

# Mise completion setup
if type -q usage
  set -l mise_completions "$__setups_dir/setups_mise_completions.fish"
  if not test -f "$mise_completions"
    ~/.local/bin/mise completions fish > "$mise_completions"
  end

  set -l usage_completions "$__setups_dir/setups_usage_init.fish"
  if not test -f "$usage_completions"
    usage --completions fish > "$usage_completions"
  end
end

# RipGrep setup
if type -q rg
  alias grep='rg'
end

# Bat-cat setup
if type -q bat
  set bat_cmd bat
else if type -q batcat
  set bat_cmd batcat
else
  set bat_cmd default
end

if test "$bat_cmd" != " default"
  set -l bat_completions "$__setups_dir/setups_bat_completions.fish"
  if not test -f "$bat_completions"
    $bat_cmd --completion fish > "$bat_completions"
  end

  alias cat="$bat_cmd"
end

# Bat-extras setups
if type -q batman
  alias man='batman'
end

# Eza/Exa setup
if type -q eza
  set eza_cmd eza
else if type -q exa
  set eza_cmd exa
else
  set eza_cmd default
end

if test "$eza_cmd" != "default"
  alias ls="$eza_cmd --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize"
  alias lss="$eza_cmd"
  alias la="$eza_cmd --git --icons --color always --long --all"
  alias las="$eza_cmd --long --all"
  alias ll="$eza_cmd --git --icons --color always --long"
  alias lls="$eza_cmd --long"
end


# Zoxide setup
if type -q zoxide
  set -l zoxide_init "$__setups_dir/setups_zoxide_init.fish"
  if not test -f "$zoxide_init"
    zoxide init fish > "$zoxide_init"
    zoxide init fish --cmd cd >> "$zoxide_init"
  end
end

# TheFuck setup
if type -q thefuck
  set -l thefuck_init "$__setups_dir/setups_thefuck_init.fish"
  if not test -f "$thefuck_init"
    thefuck --alias > "$thefuck_init"
    thefuck --alias fk >> "$thefuck_init"
  end
end

# Fastfetch setup
if type -q fastfetch
  alias neofetch='fastfetch'
  alias fetch='fastfetch'
end

# PNPM setup
if type -q pnpm
  set -l pnpm_completions "$__setups_dir/setups_pnpm_completions.fish"
  if not test -f "$pnpm_completions"
    pnpm completion fish > "$pnpm_completions"
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

# TL;DR setup
if type -q tldr
  function __tldr_completions
    tldr --list | awk '{print $1}'
  end

  complete -f -c tldr -a "(__tldr_completions)"
end

# docker setup
if type -q docker
  if not id -nG | grep -qw docker
    sudo usermod -aG docker; and newgrp docker
  end

  if not systemctl is-active --quiet docker
    sudo systemctl enable --now docker
  end
end
