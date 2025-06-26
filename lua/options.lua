require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.o.swapfile = false
vim.opt.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

local envpath = vim.fn.stdpath "config" .. "/.env"
require("utils").load_env_file(envpath)
