# Neovim Shortcuts

Leader key is `<Space>`

## Global keymaps

- `<C-s>` (Normal, Insert): Save current file
- `<leader>p` (Normal): Open diagnostic float
- `<leader>f` (Normal): Format current file (Conform)

## Plugin keymaps

### Comment.nvim (default mappings)

- `gcc` (Normal): Toggle comment on current line
- `gc` + motion (Normal): Toggle comment for a motion
- `gc` (Visual): Toggle comment for selected lines

### nvim-surround (default mappings)

- `ys` + motion + surround (Normal): Add surrounding characters
- `cs` + old + new (Normal): Change surrounding characters
- `ds` + surround (Normal): Delete surrounding characters

### fff (fuzzy finder)

- `ff` (Normal): FFFind files
- `fg` (Normal): LiFFFe grep
- `fw` (Normal): Search current word / selection

## Completion keymaps (nvim-cmp)

These mappings apply while the completion menu is active.

- `<Tab>`: Select next completion item
- `<S-Tab>`: Select previous completion item
- `<CR>`: Confirm selected completion item
