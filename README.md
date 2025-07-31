# Neovim Configuration Repository

Welcome to my Neovim configuration repository! This repo contains all the configuration files, plugins, and shortcuts I use with Neovim.

---

## Overview

This repository includes:

* **Core Neovim configurations** – Settings for performance, appearance, and behavior.
* **Plugin management** – Handled via [Lazy.nvim](https://github.com/folke/lazy.nvim).
* **Custom keybindings** – Personalized mappings for efficient navigation and editing.
* **Language Server Protocol (LSP)** – Configured for enhanced coding assistance and autocompletion.

---

## Configuration File Paths

Neovim stores its configuration files in OS-specific locations:

### Linux & macOS

* Config: `~/.config/nvim/`
* Data: `~/.local/share/nvim/`
* Cache: `~/.cache/nvim/`

### Windows

* Config: `%LOCALAPPDATA%\nvim\` (typically `C:\Users\<your-username>\AppData\Local\nvim\`)
* Data: `%LOCALAPPDATA%\nvim-data\`
* Cache: `%LOCALAPPDATA%\nvim\cache\`

Ensure your configuration files are placed in the appropriate directory for Neovim to recognize them.

---

## Command-line Shortcut for Faster Access

Set up a shell alias to open Neovim in the current directory:

### Linux & macOS

1. Edit your shell config:

   * zsh: `nano ~/.zshrc`
   * bash: `nano ~/.bashrc`
   * fish: `nano ~/.config/fish/config.fish`

2. Add the alias:

   ```bash
   alias nvim='nvim .'
   ```

3. Reload your shell:

   ```bash
   source ~/.zshrc        # For zsh
   source ~/.bashrc       # For bash
   source ~/.config/fish/config.fish  # For fish
   ```

4. Use it:

   ```bash
   nvim
   ```

### Windows

#### PowerShell

1. Open and edit profile:

   ```powershell
   notepad $PROFILE
   ```

2. Add:

   ```powershell
   function nvim { nvim.exe . }
   ```

3. Reload:

   ```powershell
   . $PROFILE
   ```

4. Use it:

   ```powershell
   nvim
   ```

#### Command Prompt (cmd.exe)

1. Create `nvim.bat` in a directory in your `PATH`.
2. Add:

   ```bat
   @echo off
   nvim .
   ```
3. Save and restart `cmd.exe`.
4. Usage:

   ```cmd
   nvim
   ```

---

## Supermaven Commands

```text
:SupermavenStart      Start Supermaven
:SupermavenStop       Stop Supermaven
:SupermavenRestart    Restart Supermaven
:SupermavenToggle     Toggle Supermaven
:SupermavenStatus     Show current status
:SupermavenUseFree    Switch to free version
:SupermavenUsePro     Switch to pro version
:SupermavenLogout     Log out
:SupermavenShowLog    Show logs
:SupermavenClearLog   Clear logs
```

---

## LSP Completion Mapping

Example insert-mode mappings for `nvim-cmp`:

```lua
mapping = cmp.mapping.preset.insert({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})
```
