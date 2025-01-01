vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    vim.keymap.set('n', 'gv', function()
      vim.cmd [[vsplit]]
      vim.lsp.buf.definition()
    end, { buffer = event.buf, desc = 'LSP: Open definition in VSplit' })
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})
