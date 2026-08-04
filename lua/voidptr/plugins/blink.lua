return {
  "saghen/blink.cmp",
  build = mnw == nil and "cargo build --release" or nil,
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
    },
    keymap = {
      preset = "none",
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
      ["<C-e>"] = { "cancel", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
  },
}
