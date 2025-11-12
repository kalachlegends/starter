-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "|", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == "" then
    print("No file associated with this buffer.")
    return
  end
  vim.cmd("vsplit " .. vim.fn.fnameescape(bufname))
end, { desc = "Open vertical split" })

map("n", "jk", "<ESC>")




map("n", "<leader>bC", function()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted and buf ~= current_buf then
      -- Save the buffer if it's modified
      if vim.bo[buf].modified and vim.bo[buf].modifiable then
        -- Use pcall to avoid errors
        pcall(vim.api.nvim_buf_call, buf, function()
          vim.cmd("w")
        end)
      end
      -- Delete the buffer safely
      pcall(vim.api.nvim_buf_delete, buf, { force = true})
    end
  end
end, { desc = "close all buffers except current" })

map("n", "<leader>bc", function()
  require("nvchad.tabufline").close_buffer()
end)
map("v", "<Tab>", ">>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- sdffds
--


map("n", "<leader>ls", function()
  local diagnostics = vim.diagnostic.get(0)
  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    print("No diagnostics found")
  end
end, { desc = "Show error" })

map("n", "<leader>lQ", function()
  -- Get diagnostics and copy first message to clipboard register
  local diagnostics = vim.diagnostic.get(0)
  if #diagnostics == 0 then
    print("No diagnostics found")
    return
  end
  local error_text = diagnostics[1].message
  -- copy to system clipboard register +
  pcall(vim.fn.setreg, "+", error_text)
  -- attempt to run :avanteedit with the error text as an argument (shell-escaped)
  local cmd = "AvanteEdit" .. vim.fn.shellescape(error_text)
  local ok, err = pcall(vim.cmd, cmd)
  if ok then
    print("Sent diagnostic to :avanteedit and copied to clipboard.")
  else
    -- If :avanteedit is not available or failed, notify the user
    print("Failed to run :avanteedit. Diagnostic copied to clipboard. (" .. (err or "unknown error") .. ")")
  end

end, { desc = "Copy error, open avante (if available) and paste" })

map("n", "<leader>Q", function()
  local choice = vim.fn.confirm("Quit Neovim and close all windows?", "&Yes\n&No", 2, "Question")
  if choice == 1 then
    vim.cmd("confirm qall")
  else
    print("Quit cancelled")
  end
end, { desc = "quit Neovim (confirm all)" })
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
-- map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>lf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings

-- tabufline
vim.api.nvim_create_user_command("NewLspBuffer", function(opts)
  local ft = opts.args

  if ft == "" then
    ft = vim.bo.filetype
  end

  if ft == "" then
    vim.ui.input({ prompt = "Enter filetype: " }, function(input)
      if input and input ~= "" then
        vim.cmd("enew")
        vim.bo.filetype = input
      else
        print("No filetype provided, aborting.")
      end
    end)
  else
    vim.cmd("enew")
    vim.bo.filetype = ft
  end
end, {
  nargs = "?",
  complete = "filetype",
})

map("n", "<leader>bn", "<cmd>NewLspBuffer<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree focus window" })


-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- map("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })
-- map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
-- map("n", "<Tab>", ":tabnext<CR>", { desc = "Next Tab" })

vim.keymap.del('n', '<C-s>')
vim.keymap.del('i', '<C-s>')
vim.keymap.del('v', '<C-s>')
map("n", "<C-s>", "<cmd>w!<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<Esc><cmd>w!<CR>a", { noremap = true, silent = true })
map("v", "<C-s>", "<Esc><cmd>w!<CR>", { noremap = true, silent = true })
map("n", "<leader>fk", "<cmd>Telescope commands<CR>", { desc = "telescope find commands" })
map("n", "m", "@q", { desc = "execute macro recorded in register q" })
-- Map '+' to open a fold
vim.keymap.set('n', '+', 'zo', { noremap = true, silent = true })

-- Map '-' to close a fold
vim.keymap.set('n', '-', 'zc', { noremap = true, silent = true })
map('n', '<C-Up>', function()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('resize -2')
  else
    vim.cmd('resize +2')
  end
end, { desc = "resize window up", noremap = true, silent = true })

map('n', '<C-Down>', function()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('resize +2')
  else
    vim.cmd('resize -2')
  end
end, { desc = "resize window down", noremap = true, silent = true })

map('n', '<C-Left>', function()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('vertical resize -2')
  else
    vim.cmd('vertical resize +2')
  end
end, { desc = "resize window left", noremap = true, silent = true })

map('n', '<C-Right>', function()
  if vim.fn.winnr('$') > 1 then
    vim.cmd('vertical resize +2')
  else
    vim.cmd('vertical resize -2')
  end
end, { desc = "resize window right", noremap = true, silent = true })
