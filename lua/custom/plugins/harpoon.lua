-- harpoon: Quickly jump between your most-used files.
-- Think of it as "bookmarks on steroids" -- pin files and jump to them instantly.
--
-- Keymaps:
--   <leader>a      Add current file to harpoon list
--   <C-e>          Open harpoon menu (edit list, reorder files)
--   <C-1/2/3/4>    Jump directly to harpoon file 1/2/3/4
--   <C-S-P>        Previous file in harpoon list
--   <C-S-N>        Next file in harpoon list
--
-- GOTCHA: <C-1> through <C-4> may not work in all terminals. If they don't,
-- use <C-e> to open the menu and select from there.
-- Harpoon saves its list per-project (based on cwd).

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon add file' })
    vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon menu' })

    vim.keymap.set('n', '<C-1>', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
    vim.keymap.set('n', '<C-2>', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
    vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
    vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })

    vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, { desc = 'Harpoon prev' })
    vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, { desc = 'Harpoon next' })

    harpoon:extend(require('harpoon.extensions').builtins.highlight_current_file())
  end,
}
