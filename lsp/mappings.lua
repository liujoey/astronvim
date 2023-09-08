return {
  n = {
    ["gI"] = {
      function() require('fzf-lua').lsp_implementations({ jump_to_single_result = true }) end,
      desc = "Implementation of current symbol",
    },
    ["gd"] = {
      function() require("fzf-lua").lsp_definitions({ jump_to_single_result = true }) end,
      desc = "Show the definition of current symbol",
    },
    ["gr"] = {
      function() require("fzf-lua").lsp_references({ jump_to_single_result = true }) end,
      desc = "References of current symbol",
    },
    ["gD"] = {
      function() require("fzf-lua").lsp_declarations({ jump_to_single_result = true }) end,
      desc = "Declaration of current symbol",
    },
    ["gT"] = {
      function() require("fzf-lua").lsp_typedefs({ jump_to_single_result = true }) end,
      desc = "Definition of current type",
    },
    ["<leader>lc"] = {
      function() require("fzf-lua").lsp_incoming_calls({ jump_to_single_result = true }) end,
      desc = "Incoming calls"
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
    ["<leader>ls"] = {
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "Search symbols",
    }
  }
}
