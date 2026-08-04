return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = {
    "Cargo.toml",
    "Cargo.lock",
    "rust-project.json",
    ".git",
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
      },
      check = {
        command = "clippy",
      },
      checkOnSave = true,
      completion = {
        postfix = {
          enable = false,
        },
      },
      imports = {
        group = {
          enable = false,
        },
      },
    },
  },
}
