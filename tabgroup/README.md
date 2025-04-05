# 🧠 Tabgroup

**Tabgroup** is a simple CLI tool to manage and launch groups of browser tabs. Define reusable sets of URLs (with optional arguments) and open them all at once in Firefox — perfect for workspaces, dev projects, and more.


## 🚀 Features

- Launch tab groups into a new Firefox window
- Dynamic URL templates using positional arguments `{0}`, `{1}`, etc.
- Zsh tab completion for tabgroup names
- Configurable tab group location and launch delay
- No dependencies — just Bash and Firefox


## 📦 Installation

```sh
./install.sh
```

This will:
- Install the tabgroup script to ~/bin
- Install default config to ~/.config/tabgroup
- Install Zsh completions to ~/.zsh/completions/_tabgroup

Make sure ~/bin is in your $PATH.

## 🛠 Configuration

The config file is located at:

`~/.config/tabgroup`

It supports the following options:

```
# How long to wait before launching additional tabs (in seconds)
sleep_duration=2

# Where your tabgroup files live
tabgroup_dir=$HOME/.tabgroup
```

## 📁 Tabgroup Files

Each tab group is a plain text file located in `$tabgroup_dir`. Each line is a URL.

You can use placeholders like `{0}`, `{1}`, etc., which will be replaced by arguments you pass on the command line.

Example `$HOME/.tabgroup/news`:

```
https://reddit.com
https://news.ycombinator.com
https://www.google.com/search?q={0}
```

## 📂 Tab Completion

Tabgroup comes with Zsh completions that show available tab group files when typing:

```sh
tabgroup [TAB][TAB]
```

To enable completions:

Ensure `~/.zsh/completions` is in your `$fpath`

Your `~/.zshrc` should include:
```
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
```

Then restart your shell or run:

```sh
exec zsh
```

## 🧹 Uninstall

To remove the script and completions:

```sh
./uninstall.sh
```

This will:
- Remove `~/bin/tabgroup`
- Remove `~/.zsh/completions/_tabgroup`

You can optionally remove config and tab files manually:

```sh
rm -r ~/.config/tabgroup
rm -r ~/.tabgroup
```
