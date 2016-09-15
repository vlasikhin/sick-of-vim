## Somewhat practical [NeoVIM](https://neovim.io/) configuration.

1. Install NeoVIM 0.1.2+, eg. from [https://neovim.io/](https://neovim.io/)

2. Fork this repo

3. Pull and link your fork with [`homesick`](https://github.com/technicalpickles/homesick):
```bash
  homesick clone https://github.com/vlasikhin/sick-of-vim.git
  homesick link sick-of-vim
```

4. Launch NeoVIM (`nvim`), ignore errors and call `:PlugUpgrade` (upgrades Plug manager to the latest version)
and `:PlugUpdate` (updates/installs all the Plug-referenced plugins) commands. Plugins will be loaded on the next run. \
It might be a good idea to run those commands once in a while to keep your tools up-to-date

Original [config](https://gitlab.com/kirushik/sick-of-vim)