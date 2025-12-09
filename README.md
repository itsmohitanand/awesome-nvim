# awesome-nvim

This is a Neovim configuration that is designed to be simple, fast, and easy to use. It is built on top of `lazy.nvim`, a modern plugin manager for Neovim.

## Installation

1.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone https://github.com/itsmohitanand/awesome-nvim.git ~/.config/nvim
    ```
2.  Start Neovim:
    ```bash
    nvim
    ```
    `lazy.nvim` will automatically install all the plugins.

## Keymaps

### Insert Mode

| Keymap | Description |
| --- | --- |
| `jk` | Exit insert mode |
| `<C-BS>` | Delete previous word |

### Normal Mode

#### Window Navigation

| Keymap | Description |
| --- | --- |
| `<C-h>` | Move to left window |
| `<C-j>` | Move to down window |
| `<C-k>` | Move to up window |
| `<C-l>` | Move to right window |

#### File Explorer (nvim-tree)

| Keymap | Description |
| --- | --- |
| `<leader>e` | Toggle file explorer |
| `<leader>f` | Find file in explorer |

#### Buffer Navigation

| Keymap | Description |
| --- | --- |
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>bd` | Close current buffer |

#### File

| Keymap | Description |
| --- | --- |
| `<leader>s` | Save file |
| `<leader>q` | Quit |

#### Navigation

| Keymap | Description |
| --- | --- |
| `j` | Move down by visual line |
| `k` | Move up by visual line |
| `<C-d>` | Page down and center |
| `<C-u>` | Page up and center |
| `n` | Search next and center |
| `N` | Search previous and center |

### Visual Mode

| Keymap | Description |
| --- | --- |
| `J` | Move line down |
| `K` | Move line up |
| `<` | Indent left |
| `>` | Indent right |
| `p` | Paste over selection |

### Other

| Keymap | Description |
| --- | --- |
| `<F5>` | Save and run Python file |
