return {
  "lewis6991/gitsigns.nvim",
  enabled = vim.fn.executable "git" == 1,
  lazy = false,
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      -- worktrees = astrocore.config.git_worktrees,
    })
    -- Настройка клавиш глобально
    local maps = {}
    local prefix = "<Leader>g"
    for _, mode in ipairs { "n", "v" } do
      maps[mode] = maps[mode] or {}
      maps[mode][prefix] = { desc = "Git" }
    end

    maps.n[prefix .. "l"] = { function() require("gitsigns").blame_line() end, desc = "View Git blame" }
    maps.n[prefix .. "L"] =
      { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }
    maps.n[prefix .. "p"] = { function() require("gitsigns").preview_hunk_inline() end, desc = "Preview Git hunk" }
    maps.n[prefix .. "r"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" }
    maps.v[prefix .. "r"] = {
      function() require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" } end,
      desc = "Reset Git hunk",
    }
    maps.n[prefix .. "R"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" }
    maps.n[prefix .. "s"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage/Unstage Git hunk" }
    maps.v[prefix .. "s"] = {
      function() require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" } end,
      desc = "Stage Git hunk",
    }
    maps.n[prefix .. "S"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" }
    maps.n[prefix .. "d"] = { function() require("gitsigns").diffthis() end, desc = "View Git diff" }

    maps.n["[G"] = { function() require("gitsigns").nav_hunk "first" end, desc = "First Git hunk" }
    maps.n["]G"] = { function() require("gitsigns").nav_hunk "last" end, desc = "Last Git hunk" }
    maps.n["]g"] = { function() require("gitsigns").nav_hunk "next" end, desc = "Next Git hunk" }
    maps.n["[g"] = { function() require("gitsigns").nav_hunk "prev" end, desc = "Previous Git hunk" }
    for _, mode in ipairs { "o", "x" } do
      maps[mode] = maps[mode] or {}
      maps[mode]["ig"] = { ":<C-U>Gitsigns select_hunk<CR>", desc = "inside Git hunk" }
    end

    require("utils").set_mappings(maps)
  end,
}
