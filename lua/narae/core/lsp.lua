local M = {}
local language = require("narae.core.language")

function M.setup()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "E",
        [vim.diagnostic.severity.WARN] = "W",
        [vim.diagnostic.severity.INFO] = "I",
        [vim.diagnostic.severity.HINT] = "H",
      },
    },
    underline = false,
    virtual_lines = false,
    virtual_text = false,
    severity_sort = true,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("narae_lsp", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client ~= nil then
        client.server_capabilities.semanticTokensProvider = nil

        if client:supports_method("textDocument/completion") then
          vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.lsp.completion.enable(true, client.id, args.buf)
        end
      end

      local opts = { buffer = args.buf }
      local maps = {
        { "K", vim.lsp.buf.hover, "hover documentation" },
        { "<leader>gd", vim.lsp.buf.definition, "go to definition" },
        { "<leader>gD", vim.lsp.buf.declaration, "go to declaration" },
        { "<leader>gi", vim.lsp.buf.implementation, "go to implementation" },
        { "<leader>gt", vim.lsp.buf.type_definition, "go to type definition" },
        { "<leader>gr", vim.lsp.buf.references, "list references" },
        { "<leader>rn", vim.lsp.buf.rename, "rename symbol" },
        { "<leader>ca", vim.lsp.buf.code_action, "code action" },
        {
          "<leader>d",
          function()
            vim.diagnostic.setqflist({ open = true })
          end,
          "diagnostics to quickfix",
        },
      }

      for _, map in ipairs(maps) do
        opts.desc = map[3]
        vim.keymap.set("n", map[1], map[2], opts)
      end
    end,
  })

  for _, name in ipairs(language.lsp_servers) do
    local config = vim.lsp.config[name]
    local cmd = config ~= nil and config.cmd or nil
    local executable = true

    if type(cmd) == "table" then
      executable = vim.fn.executable(cmd[1]) == 1
    elseif type(cmd) == "string" then
      executable = vim.fn.executable(cmd) == 1
    end

    if config ~= nil and executable then
      vim.lsp.enable(name)
    end
  end
end

return M
