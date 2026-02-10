# Nvim

This repository contains my current [Neovim](https://neovim.io/) setup, used at work and for personal projects.

> You can always find the latest version of my configuration in the [`nightly`](https://github.com/leo-alvarenga/nvim/tree/nightly) branch

## Configurations

More specific configurations, such as plugin toggles and language support, can be found and easily changed by following the steps bellow:

1. Create a copy of the `values_example.json` file in the root of the Neovim config directory (`~/.config/nvim/` by default) and name it `values.json`.
2. Edit the `values.json` file to override the default settings (found in the `defaults.json` file in the same directory)

```json
// defaults.json
// Use the same structure for values.json
{
  "development": {
    "languages": ["c", "lua", "vim", "vimdoc", "query", "csv", "json", "json5"],
    "lsps": ["bashls", "hyprls", "jsonls", "lua_ls", "marksman", "harper_ls"],
    "formatters": ["ast-grep", "prettier", "prettierd", "shfmt", "stylua"],
    "linters": ["jsonlint", "shellharden"]
  },

  "theme": "onedark",
  "toggles": {
    "codecompanion": false,
    "copilot": false,
    "format_on_save": true,
    "supermaven": false
  }
}
```

### List of Togglable Plugins

- `olimorris/codecompanion.nvim`
- `github/copilot.nvim`
- `supermaven-inc/supermaven-nvim`

### List of Available Themes

- `catppuccin` - _Catppuccin Mocha_
- `everforest` - _Everforest Dark_
- `kanagawa` - _Kanagawa Wave_
- `onedark` - _One Dark Pro_
- `tokyonight` - _Tokyo Night Storm_

## Preview

![Starter](./docs/starter.png)
![Usage](./docs/usage-simple.png)
![Neotree](./docs/usage-neotree.png)
![Completions](./docs/usage-blink.png)
![Copilot completions](./docs/usage-copilot.png)
