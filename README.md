# Neovim Configuration Repository

Welcome to my Neovim configuration repository! This repository contains all the configuration files, plugins, and shortcuts I use to enhance my Neovim experience. Whether you're looking to adopt some best practices or just curious about my setup, feel free to explore and customize it for your own workflow.

---
## Overview

This repository includes:
- **Core Neovim configurations**: Settings for performance, appearance, and behavior.
- **Plugin management**: Using [Lazy.nvim](https://github.com/folke/lazy.nvim) for effortless plugin handling.
- **Custom keybindings**: Personalized mappings for efficient navigation and editing.
- **Language Server Protocol (LSP)**: Configured for enhanced coding assistance and autocompletion.

---
## Command-line Shortcut for Faster Access

To quickly open Neovim in the current directory, set up a shortcut in your shell:

### 1. Add an Alias
Edit your shell configuration file depending on your shell:

- **For zsh (default on macOS):**
  ```bash
  nano ~/.zshrc
  ```

- **For bash:**
  ```bash
  nano ~/.bashrc
  ```

### 2. Add the Alias
Add this line to the configuration file:
```bash
alias v='nvim .'
```

### 3. Save and Apply Changes
Save the file and reload the shell:
```bash
source ~/.zshrc   # For zsh
# OR
source ~/.bashrc  # For bash
```

### 4. Usage
Simply type:
```bash
v
```
to open Neovim in the current directory.
