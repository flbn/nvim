-- ts-error-translator.nvim: Translates cryptic TypeScript error messages
-- into human-readable explanations. Works automatically via vim.diagnostic.
-- No keymaps needed -- just hover over a TS error and read the improved message.
--
-- Supports: ts_ls, vtsls, typescript-tools, volar, astro, svelte
-- Lazy-loaded: only activates when you open a supported filetype.

return {
  'dmmulroy/ts-error-translator.nvim',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'svelte', 'astro', 'vue' },
  opts = {
    auto_attach = true,
  },
}
