# neovim config

This repository is for learning to configure neovim. The goal is to have and configuration with Language Server Protocol, debugging capabilities, test runner and spellchecker for `dotnet`, `golang` and `rust`. 

## Structure

* The plugin manager used is `packer`, configuration is in the file [packer.lua](./lua/koepalex/packer.lua)
    * load new plugins by calling `:PackerSync` 
* The general settings (line numbers, tab stop width, fileencoding etc.) are defined in [set.lua](./lua/koepalex/set.lua)
* The general key bindings are defined in [remap.lua](./lua/koepalex/remap.lua)
* Configuration of plugins are located in the folder ./after/plugin/
    * [colors.lua](./after/plugin/colors.lua) contains method to load color schema (gruvbox as default) and allow 
    transparent background
    * [git-fugative.lua](./after/plugin/git-fugative.lua) configuration for Git integration
    * [lsp.lua](./after/plugin/lsp.lua) configuration for **language server protocol** server, installs as default 
`C#, go, rust, lua`
        * Install additional language server via `:Mason`
    * [telescope.lua](./after/plugin/telescope.lua) configuration for search plugin
        * Need [ripgrep](https://github.com/BurntSushi/ripgrep) installed on the device
    * [treesitter.lua](./after/plugin/treesitter.lua) configuration for syntax highlighting
    * [undotree.lua](./after/plugin/undotree.lua) configuration for the undo tree

## Hints
* Clone this repository into `~/.config` and `nvim` as name 
* Leader key (referenced as \<leader> is mapped to `space`
* After changing a config file, it need to be sourced (`:so`) or neovim restarted
ftero

# Acknowledgement

Thanks to `ThePrimeagen` and his facinating [0 to LSP: Neovim RC from Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&t=9s&pp=ygUadGhlcHJpbWVhZ2VuIG5lb3ZpbSBjb25maWc%3D) video, that got me kick started.
