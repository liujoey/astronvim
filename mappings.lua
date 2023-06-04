-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<leader><space>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<leader>`"] = { "<cmd>e #<cr>", desc = "Switch to Other Buffer" },
    ["<leader>,"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    ["<left>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<right>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<up>"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
    ["<down>"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
    ["n"] = { "'Nn'[v:searchforward]", desc = "Next search result", expr = true },
    ["N"] = { "'nN'[v:searchforward]", desc = "Prev search result", expr = true },
    ["H"] = "^",
    ["L"] = "$",
  },
  x = {
    ["H"] = "^",
    ["L"] = "$",
  },
  o = {
    ["H"] = "^",
    ["L"] = "$",
  },
}
