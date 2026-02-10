-- neocodeium: Free AI code completion powered by Windsurf (formerly Codeium).
-- Shows inline suggestions as you type in insert mode.
-- Run :NeoCodeium auth to authenticate on first use.
--
-- Keymaps (all in INSERT mode):
--   <A-f>    Accept full suggestion
--   <A-w>    Accept one word
--   <A-a>    Accept one line
--   <A-e>    Cycle to next suggestion
--   <A-r>    Cycle to previous suggestion
--   <A-c>    Clear/dismiss suggestion
--
-- GOTCHA: On macOS, <A-x> means Option+x. Make sure your terminal sends
-- Option as Alt/Meta, not as a special character. In Ghostty, this is
-- the default behavior. In iTerm2, set "Left Option key" to "Esc+".
--
-- GOTCHA: Your code is sent to Windsurf servers for completion.
-- Read their privacy policy before using: https://windsurf.com/privacy-policy
-- Use :NeoCodeium disable to stop sending code.

return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup()

    vim.keymap.set('i', '<A-f>', neocodeium.accept, { desc = 'Accept suggestion' })
    vim.keymap.set('i', '<A-w>', neocodeium.accept_word, { desc = 'Accept word' })
    vim.keymap.set('i', '<A-a>', neocodeium.accept_line, { desc = 'Accept line' })
    vim.keymap.set('i', '<A-e>', neocodeium.cycle_or_complete, { desc = 'Cycle suggestion' })
    vim.keymap.set('i', '<A-r>', function() neocodeium.cycle_or_complete(-1) end, { desc = 'Cycle suggestion reverse' })
    vim.keymap.set('i', '<A-c>', neocodeium.clear, { desc = 'Clear suggestion' })
  end,
}
