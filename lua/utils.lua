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

M.set_mappings = set_mappings
return M
