# Setups.fish

This is a plugin for the [fish shell](https://fishshell.com/), that help to work with a lot of technology out of the box, adding some aliases, completions and helper functions, after any technology listed below is installed. See the **[Installation Guide](./readme.md#installation)**, and the **[Setups that are made](./readme.md#setups-that-are-made)** by this plugin.

> reload your shell after install a technology and all the setups is automatically done

## Technologies

- [bat](https://github.com/sharkdp/bat)
- [eza](https://github.com/eza-community/eza)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [GNU stow](https://github.com/gitGNU/gnu_stow)
- [mise-en-place](https://github.com/jdx/mise)
- [pnpm](https://github.com/pnpm/pnpm)
- [the fuck](https://github.com/nvbn/thefuck)
- [tldr](https://github.com/tldr-pages/tldr)
- [usage](https://github.com/jdx/usage)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

## Installation

The easiest way to use this plugin is using a plugin manager, like [fisher](https://github.com/jorgebucaran/fisher) or [fundle](https://github.com/danhper/fundle), I prefer fisher:

```bash
fisher install rafascalet/setups.fish
```

or manually, adding [conf.d/setups.fish](./conf.d/setups.fish) into your `$__fish_config_dir/conf.d` default is `$HOME/.config/fish`

## Setups that are made

- **bat**: add alias to replace `cat` command to bat or bat-cat command, and add the completions for the options.
- **eza**: just add alias to replace `ls` and variants (like `la` and `ll`) to eza/exa, with icons, color and git informations, also adds new commands (lss, las and lls) to show in the default way.
- **fastfetch**: just add alias to replace `neofetch` command and an alias called fetch.
- **Gnu stow**: adds three functions, `dot`, `undot` and `redot`, wrappers for gnu stow command, that use the env var called `dotfiles_dir` and `dotfiles_target` (default for dotfiles_dir is '~/Dotfiles' and for target is '$HOME'). e.g: `dot fish` stands for `stow -d ~/Dotfiles -t $HOME fish`.
- **mise-en-place**: activate mise for fish shell, and if the `usage` is installed, also add completions for commands.
- **pnpm**: add completions for core commands like add, remove, store, etc.
- **the fuck**: initialize the fuck with two alias, the default (fuck) and fk.
- **tldr**: add completions for tldr based on the pages you have in your machine.
- **usage**: just add the usage completions.
- **zoxide**: initialize zoxide with the default command (z) and replaces the cd command.