require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver" }
})

local lspconfig = require('lspconfig')
local on_attach = function(_,_)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
    vim.keymap.set('n', 'gt', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
