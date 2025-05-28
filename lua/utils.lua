local M = {}
local function set_mappings(maps, options)
  options = options or {}
  for mode, mode_maps in pairs(maps) do
    for key, mapping in pairs(mode_maps) do
      if type(mapping) == "table" then
        local opts = vim.tbl_extend("force", { desc = mapping.desc }, options)
        if type(mapping[1]) == "function" then
          vim.keymap.set(mode, key, mapping[1], opts)
        else
          vim.keymap.set(mode, key, mapping[1] or key, opts)
        end
      end
    end
  end
end
local function load_env_file(filepath)
  filepath = filepath or ".env"
  local file = io.open(filepath, "r")

  if not file then
    vim.notify("Could not open " .. filepath, vim.log.levels.WARN)
    return
  end

  for line in file:lines() do
    if not line:match("^%s*#") and line:match("%S") then
      local key, value = line:match("^%s*([%w_]+)%s*=%s*(.*)%s*$")
      if key and value then
        -- Remove surrounding quotes if present
        value = value:gsub("^['\"](.-)['\"]$", "%1")
        vim.env[key] = value
      end
    end
  end

  file:close()
end

M.set_mappings = set_mappings
M.load_env_file = load_env_file
return M
