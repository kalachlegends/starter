return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = {
    filters = {
      dotfiles = false,
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = true,
    },
    git = {
      enable = true,
      ignore = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
        window_picker = {
          enable = false, -- Отключаем выбор окна, чтобы файл открывался в текущем окне
        },
      },
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      highlight_opened_files = "none",
      indent_markers = {
        enable = false,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      -- Создаем таблицу для привязок клавиш с префиксом
      local prefix, maps = "<Leader>e", {}

      for _, mode in ipairs { "n", "v" } do
        maps[mode] = {}
        maps[mode][prefix] = { desc = "󱏒 NvimTree" }
      end

      -- Отключаем стандартные привязки клавиш
      api.config.mappings.default_on_attach(bufnr)

      -- Основные команды дерева файлов с префиксом
      -- maps.n[prefix .. "o"] = { function() api.tree.change_root_to_node() end, desc = "Change Root to Node" }
      -- maps.n[prefix .. "p"] = { function() api.tree.change_root_to_parent() end, desc = "Change Root to Parent" }
      -- maps.n[prefix .. "f"] = { function() api.tree.find_file() end, desc = "Find File" }
      -- maps.n[prefix .. "r"] = { function() api.fs.rename() end, desc = "Rename" }
      -- maps.n[prefix .. "c"] = { function() api.fs.create() end, desc = "Create File/Directory" }
      -- maps.n[prefix .. "d"] = { function() api.fs.remove() end, desc = "Delete" }
      -- maps.n[prefix .. "y"] = { function() api.fs.copy.node() end, desc = "Copy" }
      -- maps.n[prefix .. "x"] = { function() api.fs.cut() end, desc = "Cut" }
      -- maps.n[prefix .. "P"] = { function() api.fs.paste() end, desc = "Paste" }
      -- maps.n[prefix .. "t"] = { function() api.node.open.tab() end, desc = "Open in New Tab" }
      -- maps.n[prefix .. "s"] = { function() api.node.open.vertical() end, desc = "Open in Vertical Split" }
      -- maps.n[prefix .. "h"] = { function() api.node.open.horizontal() end, desc = "Open in Horizontal Split" }
      --
      -- Навигационные команды без префикса
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local keymap = vim.keymap.set
      keymap("n", "l", api.node.open.edit, opts("Open"))
      keymap("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      keymap("n", "<BS>", api.tree.change_root_to_parent, opts("Change root to parent"))
      keymap("n", ".", api.tree.change_root_to_node, opts("Change root to node"))

    end,
  },
}
