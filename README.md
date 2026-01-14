# nvim

This repository contains my current [Neovim](https://neovim.io/) setup, used at work and for personal projects.

## Toggleable plugins

Create a `toggle.json` file in the root of the Neovim config (`~/.config/nvim/` by default) directory to enable or disable specific plugins. The file should contain a JSON object with plugin names as keys and boolean values indicating whether the plugin is enabled or disabled. For example:

```json
{
  "copilot": true
}
```

### List of toggleable plugins

- `github/copilot.nvim`

## Preview

![Dashboard](./docs/dashboard.png)
![Usage](./docs/usage.png)
![Completions](./docs/completions.png)
![Copilot completions](./docs/copilot-completion.png)
