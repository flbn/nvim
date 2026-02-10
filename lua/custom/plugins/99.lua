-- 99: ThePrimeagen's AI agent for Neovim. Sends visual selections to an
-- AI CLI (opencode, claude, or cursor-agent) for code modifications.
-- Unlike general chat, 99 is designed for targeted, scoped AI edits.
-- Requires: opencode CLI installed (default provider).
--
-- Keymaps (all in VISUAL mode):
--   <leader>9v   Send visual selection to 99 for AI processing
--   <leader>9s   Stop/cancel all active 99 requests
--
-- GOTCHA: 99 only supports nvim-cmp for its prompt completions (#rules, @files).
-- We use blink.cmp, so prompt completions are disabled. You can still use
-- 99's visual mode to send code to the AI -- it just won't have
-- autocomplete in the prompt buffer.
--
-- The md_files config tells 99 to auto-include AGENT.md/AGENTS.md files
-- found in your project directory for AI context.

return {
  'ThePrimeagen/99',
  config = function()
    local _99 = require '99'

    _99.setup {
      logger = {
        level = _99.DEBUG,
        path = '/tmp/' .. vim.fs.basename(vim.uv.cwd() or '') .. '.99.debug',
        print_on_error = true,
      },
      md_files = {
        'AGENT.md',
        'AGENTS.md',
      },
    }

    vim.keymap.set('v', '<leader>9v', function() _99.visual() end, { desc = '99 visual' })
    vim.keymap.set('v', '<leader>9s', function() _99.stop_all_requests() end, { desc = '99 stop requests' })
  end,
}
