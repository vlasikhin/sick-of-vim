## Somewhat practical [NeoVIM](https://neovim.io/) configuration.

1. Install NeoVIM 0.1.2+, eg. from [home:siegel:neovim](https://build.opensuse.org/project/show/home:siegel:neovim)

2. Fork this repo

3. Pull and link your fork with `homesick`:
```bash
  homesick pull https://gitlab.suse.de/<username>/sick-of-vim.git
  homesick link sick-of-vim
```

4. Launch NeoVIM (`nvim`), ignore errors and call `:PlugUpgrade` (upgrades Plug manager to the latest version)
and `:PlugUpdate` (updates/installs all the Plug-referenced plugins) commands. Plugins will be loaded on the next run. \
It might be a good idea to run those commands once in a while to keep your tools up-to-date
