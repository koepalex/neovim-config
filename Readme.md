# neovim config

This repository is for learning to configure neovim. I would like to have an usable neovim configuration, that I can benchmark myself against graphical editors like VsCode. The main driver to look into neovim was the need to extend the editor by my own. As target state I would like to have neovim with Language Server Protocol support, debugging- and refactoring-capabilities, test-runner as well as spellchecker. For my major programming languages (`dotnet`, `go` and `rust`).

## Structure

* The plugin manager used is `paq`
    * load new plugins by calling `:PaqInstall`

## Hints
* Clone this repository into `~/.config` with `nvim` as name
* Leader key (referenced as \<leader>) is mapped to `space`
* After changing a config file, it need to be sourced (`:so`) or neovim restarted

# General Commands

| Command             | Name               | Usage                                |
| ------------------- | ------------------ | ------------------------------------ |
| \<leader>pn         | Project Navigation | Open NERDtree on the side            |
| \<leader>bf         | Browse Files       | Browse the files within the folder   |
| \<leader>ff         | Find Files         | Find files by name within the folder |
| \<leader>ft         | Find Text          | Find in files                        |
| \<leader>tt         | Toggle Terminal    | Switch between neovim and terminal   |
| \<leader>c          | Toggle Comment     | Switch commenting in and out         |
| \<leader>uni _name_ | Find Unicode       | Find unicode char and add to file    |

# Coding Commands
| Command     | Name             | Usage                                |
| ----------- | ---------------- | ------------------------------------ |
| \<leader>a   | Code Action      | Open code actions menu               |
| \<leader>f  | Formatting       | Format the current file              |
| \<leader>vd | Workspace Symbol | Find workspace symbol                |
| >e          | Next Error       | Go to next error                     |
| \<e         | Previous Error   | Go to previous error                 |
| gd          | Definition       | Go to definition of symbol           |
| gD          | Declaration      | Go to declaration of symbol          |
| gr          | References       | Go to references of symbol           |
| gi          | Implementation   | Go to implementation of symbol       |
| gty         | Type             | Go to type definition of symbol      |
| K           | Documentation    | Show (hover) documentation of symbol |
| F2          | Rename           | Rename the symbol                    |


# Acknowledgement

Thanks to `ThePrimeagen` and his fascinating [0 to LSP: Neovim RC from Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE&t=9s&pp=ygUadGhlcHJpbWVhZ2VuIG5lb3ZpbSBjb25maWc%3D) video, that got me interested in that topic.
