# mise setup
if type -q ~/.local/bin/mise
  ~/.local/bin/mise activate fish | source
  ~/.local/bin/mise completions fish | source
else
  curl https://mise.run | sh
  ~/.local/bin/mise use -g usage > /dev/null
end

# Bat-cat setup
if type -q bat
  alias cat='bat'
else
  if type -q bat-cat
    alias cat='bat-cat'
  end
end