-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local get_icon = utils.get_icon
local sections = {
  f = { desc = get_icon("Search", 1, true) .. "Find" },
}
return {
  -- first key is the mode
  n = {
    ["<leader><space>"] = { function() require("fzf-lua").git_files() end, desc = "Find files" },
    ["<leader>`"] = { "<cmd>e #<cr>", desc = "Switch to Other Buffer" },
    ["<leader>,"] = { function() require("fzf-lua").buffers() end, desc = "Find buffers" },
    ["<leader>f"] = sections.f,
    ["<leader>fb"] = { function() require("fzf-lua").buffers() end, desc = "Find buffers" },
    ["<leader>fc"] = { function() require("fzf-lua").grep_cword() end, desc = "Find for word under cursor" },
    ["<leader>fC"] = { function() require("fzf-lua").commands() end, desc = "Find commands" },
    ["<leader>ff"] = { function() require("fzf-lua").files() end, desc = "Find files" },
    ["<leader>fh"] = { function() require("fzf-lua").help_tags() end, desc = "Find help" },
    ["<leader>fk"] = { function() require("fzf-lua").keymaps() end, desc = "Find keymaps" },
    ["<leader>fw"] = { function() require('fzf-lua').live_grep({query_delay=200, winopts={preview={layout='vertical'}}}) end, desc = "Find words" },
    ["<leader>f<cr>"] = { function() require("fzf-lua").resume() end, desc = "Resume previous search" },
    ["<leader>f'"] = { function() require("fzf-lua").marks() end, desc = "Find marks" },
    ["<leader>a"] = { desc = "󰛢 Harpoon"},
    ["<leader>1"] = { function() require("harpoon"):list():select(1) end, desc = "Navigate to 1" },
    ["<leader>2"] = { function() require("harpoon"):list():select(2) end, desc = "Navigate to 2" },
    ["<leader>3"] = { function() require("harpoon"):list():select(3) end, desc = "Navigate to 3" },
    ["<leader>4"] = { function() require("harpoon"):list():select(4) end, desc = "Navigate to 4" },
    ["<leader>gg"] = { function() require("neogit").open() end, desc = "Neogit status" },
    ["<leader>x"] = { desc = " Trouble"},
    ["<S-Tab>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<Tab>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["n"] = { "'Nn'[v:searchforward]", desc = "Next search result", expr = true },
    ["N"] = { "'nN'[v:searchforward]", desc = "Prev search result", expr = true },
  },
}
