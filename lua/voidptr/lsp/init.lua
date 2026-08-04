local capabilities = vim.lsp.protocol.make_client_capabilities()
local blink_ok, blink = pcall(require, "blink.cmp")
if blink_ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end

    local map = function(keys, fn)
      vim.keymap.set("n", keys, fn, { buffer = event.buf })
    end

    map("gD", vim.lsp.buf.declaration)
    map("gd", vim.lsp.buf.definition)
    map("K", vim.lsp.buf.hover)
    map("gi", vim.lsp.buf.implementation)
    map("gr", vim.lsp.buf.references)
    map("<leader>a", vim.lsp.buf.code_action)
    map("<leader>r", vim.lsp.buf.rename)
  end,
})

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = true,
})

vim.lsp.enable({
  "clangd",
  "lua_ls",
  "rust_analyzer",
  "zls",
})
