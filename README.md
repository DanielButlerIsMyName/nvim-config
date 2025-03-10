# Neovim Configuration Repository

Welcome to my Neovim configuration repository! This repository contains all the configuration files, plugins, and shortcuts I use to for Neovim.

---
## Overview

This repository includes:
- **Core Neovim configurations**: Settings for performance, appearance, and behavior.
- **Plugin management**: Using [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin handling.
- **Custom keybindings**: Personalized mappings for efficient navigation and editing.
- **Language Server Protocol (LSP)**: Configured for enhanced coding assistance and autocompletion.

---
## Configuration File Paths

Neovim stores its configuration files in different locations depending on the operating system:

- **Linux**:
  - Config path: `~/.config/nvim/`
  - Data path: `~/.local/share/nvim/`
  - Cache path: `~/.cache/nvim/`

- **macOS**:
  - Config path: `~/.config/nvim/`
  - Data path: `~/.local/share/nvim/`
  - Cache path: `~/.cache/nvim/`

- **Windows**:
  - Config path: `%LOCALAPPDATA%\nvim\` (typically `C:\Users\<your-username>\AppData\Local\nvim\`)
  - Data path: `%LOCALAPPDATA%\nvim-data\`
  - Cache path: `%LOCALAPPDATA%\nvim\cache\`

Ensure that your configuration files are placed inside the appropriate directory for Neovim to recognize them.

---
## Command-line Shortcut for Faster Access

To quickly open Neovim in the current directory, set up a shortcut in your shell:

### Linux & macOS

1. Edit your shell configuration file depending on your shell:
   - **For zsh (default on macOS):**
     ```bash
     nano ~/.zshrc
     ```
   - **For bash:**
     ```bash
     nano ~/.bashrc
     ```
   - **For fish:**
     ```bash
     nano ~/.config/fish/config.fish
     ```

2. Add the following alias:
   ```bash
   alias nvim='nvim .'
   ```

3. Save the file and reload the shell:
   ```bash
   source ~/.zshrc   # For zsh
   source ~/.bashrc   # For bash
   source ~/.config/fish/config.fish  # For fish
   ```

4. Usage:
   ```bash
   nvim
   ```
   This will open Neovim in the current directory.

### Windows (PowerShell & Command Prompt)

For Windows, you can set up an alias in PowerShell or add a batch file:

#### PowerShell:

1. Open PowerShell and edit your profile:
   ```powershell
   notepad $PROFILE
   ```

2. Add this line:
   ```powershell
   function nvim { nvim.exe . }
   ```

3. Save and reload the profile:
   ```powershell
   . $PROFILE
   ```

4. Usage:
   ```powershell
   nvim
   ```

#### Command Prompt (cmd.exe):

1. Create a batch file named `nvim.bat` in a directory that is in your system's `PATH` (e.g., `C:\Windows` or a custom scripts folder).
2. Add the following content to the file:
   ```bat
   @echo off
   nvim .
   ```
3. Save and restart the command prompt.
4. Now, typing `nvim` in cmd will open Neovim in the current directory.

