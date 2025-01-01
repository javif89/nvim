return {
  -- Automatically install LSPs and related tools to stdpath for Neovim
  {
    'williamboman/mason.nvim',
    config = true,
    priority = 1000,
    opts = {},
  },
  'williamboman/mason-lspconfig.nvim',
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        -- Go
        'gopls',
        -- PHP and Web
        'emmet-language-server',
        'intelephense',
        'pint',
        'prettier',
        'stimulus-language-server',
        'tailwindcss-language-server',
        -- Lua
        'stylua',
        'lua-language-server',
      },
    },
  },
}
