-- oil.nvim: Edit your filesystem like a normal buffer.
-- Open a directory and you see files as lines in a buffer.
-- Rename, delete, or move files by editing the buffer text, then :w to confirm.
--
-- Keymaps:
--   -        Open parent directory (works from any buffer)
--   <CR>     Open file/directory
--   g?       Show help for all Oil keymaps
--   <C-p>    Preview file
--   <C-v>    Open in vertical split
--   <C-x>    Open in horizontal split
--   <C-t>    Open in new tab
--   g.       Toggle hidden files
--   g\       Toggle trash
--
-- GOTCHA: Oil replaces netrw as the default file explorer. Opening `nvim .`
-- will open Oil instead of netrw.

return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    default_file_explorer = true,
    columns = {},
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-x>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['<C-r>'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = { 'actions.cd', opts = { scope = 'tab' } },
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['g\\'] = 'actions.toggle_trash',
    },
  },
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
