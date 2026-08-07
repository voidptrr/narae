local M = {}

local modes = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "VISUAL",
  ["\22"] = "VISUAL",
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
}

local function fallback(value, default)
  if value == nil or value == "" then
    return default
  end

  return value
end

local function branch()
  local root = vim.fs.find(".git", {
    path = vim.fn.expand("%:p:h") ~= "" and vim.fn.expand("%:p:h") or vim.uv.cwd(),
    upward = true,
  })[1]

  if root == nil then
    return "no branch"
  end

  local head = io.open(root .. "/HEAD", "r")

  if head == nil then
    return "no branch"
  end

  local line = head:read("*l")
  head:close()

  return fallback(line and (line:match("^ref: refs/heads/(.+)$") or line:sub(1, 7)), "no branch")
end

function M.statusline()
  local mode = vim.api.nvim_get_mode().mode:sub(1, 1)
  local left = table.concat({
    "%#NaraeStatusMode# ",
    modes[mode] or mode:upper(),
    " %#StatusLine# ",
    branch(),
    " | ",
    fallback(vim.fn.expand("%:t"), "[No Name]"),
  })

  local right = table.concat({
    fallback(vim.bo.filetype, "no ft"),
    "%l:%c",
    "%p%%",
  }, " | ")

  return table.concat({ left, "%=", right, " " })
end

function M.refresh_highlights()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local identifier = vim.api.nvim_get_hl(0, { name = "Identifier", link = false })

  local bg = normal.bg or 0x1c1c1c
  local fg = normal.fg or 0xdadada
  local accent = identifier.fg or 0x87afaf

  vim.api.nvim_set_hl(0, "StatusLine", { fg = fg, bg = bg, ctermfg = 253, ctermbg = 234 })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = fg, bg = bg, ctermfg = 243, ctermbg = 234 })
  vim.api.nvim_set_hl(
    0,
    "NaraeStatusMode",
    { fg = bg, bg = accent, ctermfg = 234, ctermbg = 109, bold = true }
  )
end

function M.setup()
  M.refresh_highlights()
  vim.o.statusline = "%!v:lua.require'narae.core.statusline'.statusline()"

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("narae_statusline", { clear = true }),
    callback = M.refresh_highlights,
  })
end

return M
