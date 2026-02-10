-- snacks.nvim: A collection of small UI utilities by folke.
-- Provides: notifications, zen mode, scratch buffers, indent guides,
-- scope detection, file rename, git browse, word references, and more.
--
-- Keymaps:
--   <leader>z    Toggle zen mode (distraction-free editing)
--   <leader>Z    Zoom current window
--   <leader>.    Toggle scratch buffer (temporary notepad, persisted to disk)
--   <leader>S    Select from saved scratch buffers
--   <leader>n    Show notification history
--   <leader>un   Dismiss all notifications
--   <leader>cR   Rename current file (LSP-aware, updates imports)
--   <leader>gB   Open current file/line in browser (GitHub, etc.)
--   ]]  / [[     Jump to next/prev LSP word reference
--
-- UI Toggle keymaps (<leader>u):
--   <leader>us   Toggle spell check
--   <leader>uw   Toggle word wrap
--   <leader>uL   Toggle relative line numbers
--   <leader>ud   Toggle diagnostics
--   <leader>ul   Toggle line numbers
--   <leader>uh   Toggle inlay hints
--   <leader>uD   Toggle dim mode (dims inactive code)
--
-- GOTCHA: We use plain vim.keymap.set for toggles instead of Snacks.toggle():map()
-- because Snacks injects a `real` field that which-key doesn't recognize, causing errors.

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dim = { enabled = true },
    gh = { enabled = true },
    git = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    keymap = { enabled = true },
    layout = { enabled = true },
    notifier = { enabled = true, timeout = 5000, width = { min = 40, max = 0.6 }, wo = { wrap = true } },
    notify = { enabled = true },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    statuscolumn = { enabled = true },
    toggle = { enabled = true },
    win = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    { '<leader>z', function() Snacks.zen() end, desc = 'Toggle Zen Mode' },
    { '<leader>Z', function() Snacks.zen.zoom() end, desc = 'Toggle Zoom' },
    { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer' },
    { '<leader>S', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
    { '<leader>n', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
    { '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications' },
    { '<leader>cR', function() Snacks.rename.rename_file() end, desc = 'Rename File' },
    { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Git Browse', mode = { 'n', 'v' } },
    { ']]', function() Snacks.words.jump(vim.v.count1) end, desc = 'Next Reference', mode = { 'n', 't' } },
    { '[[', function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        _G.Snacks = require 'snacks'

        local function toggle_opt(opt, desc, key)
          vim.keymap.set('n', key, function() vim.o[opt] = not vim.o[opt] end, { desc = 'Toggle ' .. desc })
        end

        toggle_opt('spell', 'Spelling', '<leader>us')
        toggle_opt('wrap', 'Wrap', '<leader>uw')
        toggle_opt('relativenumber', 'Relative Number', '<leader>uL')

        vim.keymap.set('n', '<leader>ud', function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, { desc = 'Toggle Diagnostics' })

        vim.keymap.set('n', '<leader>ul', function()
          vim.o.number = not vim.o.number
        end, { desc = 'Toggle Line Numbers' })

        vim.keymap.set('n', '<leader>uh', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = 'Toggle Inlay Hints' })

        vim.keymap.set('n', '<leader>uD', function() Snacks.dim() end, { desc = 'Toggle Dim' })
      end,
    })
  end,
}
