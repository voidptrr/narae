local M = {}

---@alias NaraeKeyMode string|string[]
---@alias NaraeKeyRhs string|function

---@class NaraeKeySpec
---@field [1] string Left-hand side for the mapping.
---@field [2] NaraeKeyRhs Action for the mapping.
---@field mode? NaraeKeyMode Mapping mode. Defaults to normal mode.
---@field desc? string Mapping description.
---@field silent? boolean Suppress command output. Defaults to true.

---@class NaraePlugin
---@field repo string Repository URL installed with vim.pack outside mnw.
---@field keys? NaraeKeySpec[] Lazy-style key specs registered by the loader.
---@field setup? fun(plugin: NaraePlugin) Optional setup callback run after install.

---@return string[]
local function plugin_modules()
  local files = vim.api.nvim_get_runtime_file("lua/narae/plugins/*.lua", true)
  local modules = {}
  local seen = {}

  table.sort(files)

  for _, file in ipairs(files) do
    local name = "narae.plugins." .. vim.fn.fnamemodify(file, ":t:r")
    if not seen[name] then
      modules[#modules + 1] = name
      seen[name] = true
    end
  end

  return modules
end

function M.load()
  for _, module in ipairs(plugin_modules()) do
    ---@type NaraePlugin
    local plugin = require(module)

    if mnw == nil then
      vim.pack.add({ plugin.repo })
    end

    if plugin.setup ~= nil then
      plugin.setup(plugin)
    end

    for _, key in ipairs(plugin.keys or {}) do
      vim.keymap.set(key.mode or "n", key[1], key[2], {
        desc = key.desc,
        silent = key.silent ~= false,
      })
    end
  end
end

return M
