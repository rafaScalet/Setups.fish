# Mise setup
if type -q ~/.local/bin/mise
  if type -q usage
    ~/.local/bin/mise use -g usage > /dev/null
  end
  ~/.local/bin/mise completions fish | source
  ~/.local/bin/mise activate fish | source
end

# Bat-cat setup
if type -q bat
  alias cat='bat'
else
  if type -q bat-cat
    alias cat='bat-cat'
  end
end

# Eza setup
if type -q eza
  alias ls='eza --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
  alias la='eza --git --icons --color always --long --all'
  alias ll='eza --git --icons --color always --long'
  alias lt='eza --icons --color --tree'
else
  if type -q exa
    alias ls='exa --git --icons --color always --long --no-permissions --no-user --no-time --no-filesize'
    alias la='exa --git --icons --color always --long --all'
    alias ll='exa --git --icons --color always --long'
    alias lt='exa --icons --color --tree'
  end
end

# Zoxide setup
if type -q zoxide
  zoxide init fish | source
  zoxide init fish --cmd cd | source
end

# TheFuck setup
if type -q thefuck
  thefuck --alias | source
  thefuck --alias fk | source
end

# Fastfetch setup
if type -q fastfetch
  alias neofetch='fastfetch'
  alias fetch='fastfetch'
end