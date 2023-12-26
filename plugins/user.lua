return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
      }
      opts.window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      }
      return opts
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      select = { backend = { "fzf_lua" } },
    },
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      local fzf = require("fzf-lua")
      fzf.setup({
        winopts = {
          preview = {
            flip_columns = 125,
          },
        },
        grep = {
          rg_glob = true,
        },
      })
    end
  },
  {
    "folke/flash.nvim",
    event = "User AstroFile",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          -- Don't activate flash with default search / and ?, toggle it with <C-s>
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    init = function() vim.g.lsp_handlers_enabled = false end,
  },
  {
    'tummetott/unimpaired.nvim',
    event = "User AstroFile",
    config = function()
      require('unimpaired').setup {
        default_keymaps = false,
        keymaps = {
          -- cprevious = {
          --   mapping = '[q',
          --   description = 'Jump to [count] previous entry in qflist',
          --   dot_repeat = true,
          -- },
          -- cnext = {
          --   mapping = ']q',
          --   description = 'Jump to [count] next entry in qflist',
          --   dot_repeat = true,
          -- },
          cfirst = {
            mapping = '[Q',
            description = 'Jump to first entry in qflist',
            dot_repeat = false,
          },
          clast = {
            mapping = ']Q',
            description = 'Jump to last entry in qflist',
            dot_repeat = false,
          },
          blank_above = {
            mapping = '[<Space>',
            description = 'Add [count] blank lines above',
            dot_repeat = true,
          },
          blank_below = {
            mapping = ']<Space>',
            description = 'Add [count] blank lines below',
            dot_repeat = true,
          },
          exchange_above = {
            mapping = '[e',
            description = 'Exchange line with [count] lines above',
            dot_repeat = true,
          },
          exchange_below = {
            mapping = ']e',
            description = 'Exchange line with [count] lines below',
            dot_repeat = true,
          },
          exchange_section_above = {
            mapping = '[e',
            description = 'Move section [count] lines up',
            dot_repeat = true,
          },
          exchange_section_below = {
            mapping = ']e',
            description = 'Move section [count] lines down',
            dot_repeat = true,
          },
        },
      }
    end,
  },
  {
    "tpope/vim-rsi",
    event = "InsertEnter",
  },
  {
    "tpope/vim-repeat",
    event = "InsertEnter",
  },
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict with leap
      require("mini.surround").setup(opts)
    end,
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "ibhagwan/fzf-lua",
      "sindrets/diffview.nvim",
    },
    opts = {
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      integrations = {
        telescope = false,
        diffview = true,
      }
    },
    config = function(_, opts)
      require('neogit').setup(opts)
    end,
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diff File History" },
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview"},
    },
    config = function()
      require("diffview").setup({
        keymaps = {
          file_panel = {
            ["<up>"] = false,
            ["<down>"] = false,
          },
          file_history_panel = {
            ["<up>"] = false,
            ["<down>"] = false,
          }
        }
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Inline Blame" },
    },
    cmd = "Git"
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>aa", function () require("harpoon"):list():append() end, desc = "Add current" },
      { "<leader>al", function ()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Select" },
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { import = "user.plugins.lang.lua" },
  { import = "user.plugins.lang.java" },
  { import = "user.plugins.lang.bash" },
}
