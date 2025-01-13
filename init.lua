-- Keybinds
require 'editor.keymaps.split-navigation'
require 'editor.keymaps.quickfix-list'
require 'editor.keymaps.custom'

-- Import vim options and such
require 'editor.options.options'
require 'editor.autocommands.autocommands'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup({
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  { import = 'plugins.themes.catpuccin' },
  { import = 'plugins.core' },
  { import = 'plugins.core.lsp' },
  { import = 'plugins.optional' },
  -- { import = 'plugins.languages' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Plugin keymaps
require 'editor.keymaps.plugins.telescope'
require 'editor.keymaps.plugins.lsp'
require 'editor.keymaps.plugins.oil'
