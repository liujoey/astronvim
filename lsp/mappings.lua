return {
  n = {
    ["gI"] = {
      function() require('fzf-lua').lsp_implementations() end,
      desc = "Implementation of current symbol",
    },
    ["gd"] = {
      function() require("fzf-lua").lsp_definitions() end,
      desc = "Show the definition of current symbol",
    },
    ["gr"] = {
      function() require("fzf-lua").lsp_references() end,
      desc = "References of current symbol",
    },
    ["gD"] = {
      function() require("fzf-lua").lsp_declarations() end,
      desc = "Declaration of current symbol",
    },
    ["gT"] = {
      function() require("fzf-lua").lsp_typedefs() end,
      desc = "Definition of current type",
    },
    ["<leader>lD"] = {
      function() require("fzf-lua").diagnostics_workspace() end,
      desc = "Search diagnostics"
    },
    ["<leader>lG"] = {
      function()
        require("fzf-lua").lsp_live_workspace_symbols()
      end,
      desc = "Search workspace symbols",
    },
  }
}
