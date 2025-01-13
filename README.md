# Neovim Configuration

This repository contains Neovim configurations that include:

- **Treesitter**: Enhanced syntax highlighting and code parsing
- **Telescope**: Fuzzy finder for files, buffers, etc.
- **Packer**: Plugin manager for Neovim

## Installation

1. Clone this repository into your Neovim configuration directory:

   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

2. Open Neovim and install the plugins using Packer:

   ```
   :PackerSync
   ```

3. For Treesitter, make sure to update parsers:

   ```
   :TSUpdate
   ```

## File Structure

- `init.lua`: Main configuration file
- `lua/settings.lua`: General settings for Neovim
- `lua/plugins.lua`: Plugin configurations
