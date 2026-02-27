# Nvim

This repository contains my current [Neovim](https://neovim.io/) setup, used at work and for personal projects.

> You can always find the latest version of my configuration in the [`nightly`](https://github.com/leo-alvarenga/nvim/tree/nightly) branch

For the complete list of plugins and configurations, please refer to the [Plugin List](./PLUGINS.md).

> Make sure to also check my tmux configuration, which is designed to work seamlessly with this Neovim setup: [leo-alvarenga/tmux](https://github.com/leo-alvarenga/tmux)

> Check out my Neovim plugins, which are also used in this configuration:
>
> - [leo-alvarenga/homecoming.nvim](https://github.com/leo-alvarenga/homecoming.nvim)
> - [leo-alvarenga/quoth.nvim](https://github.com/leo-alvarenga/quoth.nvim)

## Configurations

More specific configurations, such as plugin toggles and language support, can be found and easily changed by editing the values inside the files found under `lua/values/`.

### List of Togglable Plugins

- `github/copilot.vim`
- `olimorris/codecompanion.nvim`
- `folke/sidekick.nvim`
- `supermaven-inc/supermaven-nvim`

### List of Available Themes

- `catppuccin` - _Catppuccin Mocha_
- `everforest` - _Everforest Dark_
- `kanagawa` - _Kanagawa Wave_
- `onedark` - _One Dark Pro_
- `tokyonight` - _Tokyo Night Storm_

## Preview

![Starter using leo-alvarenga/homecoming.nvim](./docs/starter.png)
![Usage](./docs/usage-simple.png)
![Neotree](./docs/usage-neotree.png)
![Completions](./docs/usage-blink.png)
![Copilot completions](./docs/usage-copilot.png)

## License

This project is licensed under the GPLv3 license - see the [LICENSE](./LICENSE) file for details.
