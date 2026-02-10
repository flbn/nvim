-- opencode.nvim: Integrate the opencode AI assistant with Neovim.
-- Sends editor context (buffer, cursor, selection) to opencode CLI.
-- Requires: opencode CLI installed and running (https://github.com/sst/opencode)
--
-- Keymaps:
--   <C-a>     Ask opencode with current context (normal or visual mode)
--   <C-x>     Select an opencode action (prompts, commands, etc.)
--   <C-.>     Toggle opencode terminal
--   go{motion} Send a range to opencode (e.g. goap = send paragraph)
--   goo       Send current line to opencode
--
-- GOTCHA: <C-a> and <C-x> override Neovim's built-in increment/decrement.
-- If you need increment/decrement, use <C-a>/<C-x> in a context where
-- opencode isn't active, or remap them (see KEYMAPS.md).

return {
  'nickjvandyke/opencode.nvim',
  dependencies = {
    { 'folke/snacks.nvim' },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}

    vim.keymap.set({ 'n', 'x' }, '<C-a>', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode' })
    vim.keymap.set({ 'n', 'x' }, '<C-x>', function() require('opencode').select() end, { desc = 'Execute opencode action' })
    vim.keymap.set({ 'n', 't' }, '<C-.>', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })

    vim.keymap.set({ 'n', 'x' }, 'go', function() return require('opencode').operator('@this ') end, { desc = 'Add range to opencode', expr = true })
    vim.keymap.set('n', 'goo', function() return require('opencode').operator('@this ') .. '_' end, { desc = 'Add line to opencode', expr = true })
  end,
}
