# Neovim Keymaps Cheatsheet

`<leader>` = Space bar. Press Space then the next key(s).
`<C-x>` = Ctrl+x. `<A-x>` = Alt/Option+x. `<C-S-x>` = Ctrl+Shift+x.

**Tip**: Press Space and wait -- which-key (helix style) will show you all available commands.

---

## Basics (Normal Mode)

| Key | Action |
|-----|--------|
| `h j k l` | Move left, down, up, right |
| `i` | Enter Insert mode (type text) |
| `v` | Enter Visual mode (select text) |
| `Esc` | Back to Normal mode / Clear search highlight |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `dd` | Delete line |
| `yy` | Copy (yank) line |
| `p` | Paste |
| `.` | Repeat last action |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |

## Window Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h` | Focus left window |
| `Ctrl+j` | Focus below window |
| `Ctrl+k` | Focus above window |
| `Ctrl+l` | Focus right window |
| `Esc Esc` | Exit terminal mode (in :terminal) |

---

## Search (Telescope) -- `<leader>s`

| Key | Action |
|-----|--------|
| `Space s f` | Search files |
| `Space s g` | Search by grep (text in all files) |
| `Space s h` | Search help docs |
| `Space s k` | Search keymaps |
| `Space s d` | Search diagnostics (errors/warnings) |
| `Space s w` | Search current word under cursor |
| `Space s r` | Resume last search |
| `Space s .` | Search recent files |
| `Space s c` | Search commands |
| `Space s n` | Search Neovim config files |
| `Space s /` | Grep in open files only |
| `Space /` | Fuzzy search in current buffer |
| `Space Space` | Find open buffers |
| `Space s s` | Browse all Telescope pickers |

---

## File Explorer (Oil) -- edit filesystem like a buffer

| Key | Action |
|-----|--------|
| `-` | Open parent directory |
| `Enter` | Open file/directory |
| `g?` | Show help (inside Oil) |
| `Ctrl+p` | Preview file |
| `Ctrl+v` | Open in vertical split |
| `Ctrl+x` | Open in horizontal split |
| `Ctrl+t` | Open in new tab |
| `g.` | Toggle hidden files |
| `:w` | Confirm file operations (rename, delete, etc.) |

Just rename/delete/move lines in the Oil buffer to manage files!

---

## Harpoon -- pin & jump to favorite files

| Key | Action |
|-----|--------|
| `Space a` | Add current file to Harpoon |
| `Ctrl+e` | Open Harpoon menu |
| `Ctrl+1/2/3/4` | Jump to Harpoon file 1/2/3/4 |
| `Ctrl+Shift+P` | Previous Harpoon file |
| `Ctrl+Shift+N` | Next Harpoon file |

---

## LSP -- code intelligence (active in supported files)

| Key | Action |
|-----|--------|
| `grd` | Go to definition |
| `grr` | Find references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grD` | Go to declaration |
| `grn` | Rename symbol |
| `gra` | Code action (fix/refactor) |
| `gO` | Document symbols (functions, vars, etc.) |
| `gW` | Workspace symbols |
| `Ctrl+k` | Signature help (in insert mode, via blink) |
| `[d` / `]d` | Jump to prev/next diagnostic |
| `Space q` | Open diagnostic quickfix list |

---

## Completion (blink.cmp) -- in Insert Mode

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Open completion menu / show docs |
| `Ctrl+n` | Next completion item |
| `Ctrl+p` | Previous completion item |
| `Ctrl+y` | Accept completion |
| `Ctrl+e` | Dismiss completion |
| `Tab` / `Shift+Tab` | Navigate snippet placeholders |

---

## AI: NeoCodeium -- in Insert Mode

| Key | Action |
|-----|--------|
| `Alt+f` | Accept full suggestion |
| `Alt+w` | Accept one word |
| `Alt+a` | Accept one line |
| `Alt+e` | Cycle to next suggestion |
| `Alt+r` | Cycle to previous suggestion |
| `Alt+c` | Clear suggestion |

Run `:NeoCodeium auth` first to authenticate.

---

## AI: opencode.nvim

| Key | Action |
|-----|--------|
| `Ctrl+a` | Ask opencode (sends cursor/selection context) |
| `Ctrl+x` | Select opencode action |
| `Ctrl+.` | Toggle opencode terminal |
| `go{motion}` | Send range to opencode (e.g. `goap` = paragraph) |
| `goo` | Send current line to opencode |

---

## AI: 99 -- visual mode AI agent

| Key | Action |
|-----|--------|
| `Space 9 v` | Send visual selection to 99 |
| `Space 9 s` | Stop all 99 requests |

Requires opencode CLI installed.

---

## Formatting (conform.nvim)

| Key | Action |
|-----|--------|
| `Space f` | Format buffer |
| (automatic) | Formats on save |

---

## Snacks Utilities

| Key | Action |
|-----|--------|
| `Space z` | Zen mode (distraction-free) |
| `Space Z` | Zoom current window |
| `Space .` | Toggle scratch buffer |
| `Space S` | Select scratch buffer |
| `Space n` | Notification history |
| `Space cR` | Rename file (LSP-aware) |
| `Space gB` | Open in browser (GitHub, etc.) |
| `]]` / `[[` | Jump to next/prev LSP reference |

---

## UI Toggles -- `<leader>u`

| Key | Action |
|-----|--------|
| `Space u s` | Toggle spell check |
| `Space u w` | Toggle word wrap |
| `Space u L` | Toggle relative line numbers |
| `Space u d` | Toggle diagnostics |
| `Space u l` | Toggle line numbers |
| `Space u h` | Toggle inlay hints |
| `Space u D` | Toggle dim (focus mode) |
| `Space u n` | Dismiss notifications |

---

## Text Objects (mini.ai) -- use with `d`, `c`, `y`, `v`

| Key | Action |
|-----|--------|
| `va)` | Select around parentheses |
| `ci'` | Change inside quotes |
| `diq` | Delete inside any quote |
| `yinq` | Yank inside next quote |

## Surround (mini.surround)

| Key | Action |
|-----|--------|
| `saiw)` | Surround word with () |
| `sd'` | Delete surrounding quotes |
| `sr)"` | Replace ) with " |

---

## Git (gitsigns)

| Key | Action |
|-----|--------|
| Signs in gutter | `+` added, `~` changed, `_` deleted |

---

## Colorschemes

| Command | Theme |
|---------|-------|
| `:colorscheme monoglow` | Dark (default) |
| `:colorscheme monoglow-z` | Dark variant |
| `:colorscheme monoglow-lack` | Dark variant |
| `:colorscheme monoglow-void` | Dark variant |
| `:colorscheme ef-spring` | Light |
| `:colorscheme ef-day` | Light |
| Any `ef-*` theme | See ef-themes docs |

---

## Pro Tips

1. **Press Space and wait** -- which-key shows all available commands in helix style
2. **`:Tutor`** -- built-in Neovim tutorial
3. **`:checkhealth`** -- diagnose plugin issues
4. **`:Lazy`** -- manage plugins
5. **`:Mason`** -- manage language servers & formatters
