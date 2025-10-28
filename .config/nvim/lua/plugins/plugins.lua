return {
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = {
          "actions.select",
          opts = { vertical = true },
          desc = "Open the entry in a vertical split",
        },
        ["<C-v>"] = {
          "actions.select",
          opts = { vertical = true },
          desc = "Open the entry in a vertical split",
        },
        ["<C-h>"] = {
          "actions.select",
          opts = { horizontal = true },
          desc = "Open the entry in a horizontal split",
        },
        ["<C-t>"] = {
          "actions.select",
          opts = { tab = true },
          desc = "Open the entry in new tab",
        },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-x>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = {
          "actions.cd",
          opts = { scope = "tab" },
          desc = ":tcd to the current oil directory",
        },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-sleuth",
  {
    "tpope/vim-eunuch",
    cmd = {
      "Remove",
      "Delete",
      "Move",
      "Chmod",
      "Rename",
      "Copy",
      "Duplicate",
      "Mkdir",
      "Cfind",
      "Clocate",
      "Lfind",
      "Llocate",
      "Wall",
      "SudoWrite",
      "SudoEdit",
    },
  },
  {
    "tpope/vim-obsession",
    cmd = { "Obsession", "Obsess" },
  },
  {
    "tpope/vim-characterize",
    keys = { "ga" },
  },
  {
    "tpope/vim-abolish",
    cmd = { "Abolish", "Subvert" },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    -- build = "cargo build --release",
    opts = {
      cmdline = {
        keymap = {
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-x>"] = { "hide", "fallback" },
          ["<C-l>"] = { "select_accept_and_enter", "fallback" },
          ["<C-e>"] = { "accept", "fallback" },
          ["<down>"] = { "select_next", "fallback" },
          ["<up>"] = { "select_prev", "fallback" },
        },
        completion = {
          list = {
            selection = {
              preselect = true,
              auto_insert = true,
            },
          },
          menu = {
            auto_show = true,
          },
        },
      },
      keymap = {
        preset = "default",
        ["<C-x>"] = { "hide", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "select_and_accept", "fallback" },
        ["<C-e>"] = {},
        ["<C-n>"] = {},
        ["<C-p>"] = {},
      },

      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "saghen/blink.pairs",
    version = "*",

    dependencies = "saghen/blink.download",

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        enabled = true,
        disabled_filetypes = {},
        pairs = {},
      },
      highlights = {
        enabled = true,
        groups = {
          "BlinkPairsOrange",
          "BlinkPairsPurple",
          "BlinkPairsBlue",
        },

        matchparen = {
          enabled = true,
          group = "BlinkPairsMatchParen",
        },
      },
      debug = false,
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>h", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Open harpoon window" })

      vim.keymap.set("n", "<leader>ga", function()
        harpoon:list():add()
      end)

      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
      end)
      vim.keymap.set("n", "<leader>5", function()
        harpoon:list():select(5)
      end)
      vim.keymap.set("n", "<leader>6", function()
        harpoon:list():select(6)
      end)
    end,
  },
  { "nvim-mini/mini.icons",     version = false },
  { "nvim-mini/mini.bracketed", version = false },
  {
    "nvim-mini/mini.ai",
    version = false,
    config = function()
      require("mini.ai").setup({
        custom_textobjects = {
          b = { { "%b()" }, "^.().*().$" },
          B = { { "%b{}" }, "^.().*().$" },
        },
        n_lines = 1000,
      })
    end,
  },
  {
    "gbprod/substitute.nvim",
    keys = {
      {
        "<leader>p",
        function()
          require("substitute").operator()
        end,
        mode = "n",
        desc = "Paste in",
      },
      {
        "<leader>pp",
        function()
          require("substitute").line()
        end,
        mode = "n",
        desc = "Substitute Line",
      },
      {
        "<leader>s",
        function()
          require("substitute.range").operator()
        end,
        mode = "n",
        desc = "Substitute in Range",
      },
      {
        "<leader>s",
        function()
          require("substitute.range").visual()
        end,
        mode = "x",
        desc = "Substitute in Range",
      },
      {
        "<leader>ss",
        function()
          require("substitute.range").word()
        end,
        mode = "n",
        desc = "Substitute Curr. Word in Range",
      },
      {
        "<leader>sx",
        "<cmd>lua require('substitute.exchange').operator()<cr>",
        mode = "n",
        desc = "Substitute Exchange",
      },
      {
        "<leader>sxx",
        "<cmd>lua require('substitute.exchange').line()<cr>",
        mode = "n",
        desc = "Substitute Exchange",
      },
      {
        "<leader>X",
        "<cmd>lua require('substitute.exchange').visual()<cr>",
        mode = "x",
        desc = "Substitute Exchange",
      },
      {
        "<leader>sxc",
        "<cmd>lua require('substitute.exchange').cancel()<cr>",
        mode = "n",
        desc = "Substitute Exchange",
      },
    },
    config = function()
      require("substitute").setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "printf",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
        textsubjects = {
          enable = true,
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-big",
          },
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  },
  {
    "booperlv/nvim-gomove",
    keys = {
      { "<A-h>", "<Plug>GoVSMLeft",  mode = "v" },
      { "<A-j>", "<Plug>GoVSMDown",  mode = "v" },
      { "<A-k>", "<Plug>GoVSMUp",    mode = "v" },
      { "<A-l>", "<Plug>GoVSMRight", mode = "v" },
      { "<A-h>", "<Plug>GoNSMLeft" },
      { "<A-j>", "<Plug>GoNSMDown" },
      { "<A-k>", "<Plug>GoNSMUp" },
      { "<A-l>", "<Plug>GoNSMRight" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    setup = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },
  {
    "gbprod/stay-in-place.nvim",
    config = function()
      require("stay-in-place").setup({})
    end,
  },
  {
    "mbbill/undotree",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        enabled = true,
        win = {
          input = {
            keys = {
              ["<C-l>"] = { "confirm", mode = { "n", "i" } },
            },
          },
          list = {
            keys = {
              ["<C-l>"] = { "confirm", mode = { "n", "i" } },
            },
          },
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      {
        "<leader><leader>",
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker()
          end
        end,
        desc = "Snacks: Picker",
      },
      {
        "<leader>f",
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.smart()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>w",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>n",
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = "Notification History",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      {
        "<leader>t",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<leader>T",
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
        desc = "Treesitter Search",
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
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "waiting-for-dev/ergoterm.nvim",
    config = function()
      require("ergoterm").setup({})

      local terms = require("ergoterm")

      local firstTerm = terms.Terminal:new({
        name = "1",
        cmd = "fish",
      })
      local secondTerm = terms.Terminal:new({
        name = "2",
        cmd = "fish",
      })
      local thirdTerm = terms.Terminal:new({
        name = "3",
        cmd = "fish",
      })
      local fourthTerm = terms.Terminal:new({
        name = "4",
        cmd = "fish",
      })

      vim.keymap.set({ "n", "t" }, "<C-1>", function()
        firstTerm:toggle()
      end, { desc = "First Terminal" })
      vim.keymap.set({ "n", "t" }, "<C-2>", function()
        secondTerm:toggle()
      end, { desc = "Second Terminal" })
      vim.keymap.set({ "n", "t" }, "<C-3>", function()
        thirdTerm:toggle()
      end, { desc = "Third Terminal" })
      vim.keymap.set({ "n", "t" }, "<C-4>", function()
        fourthTerm:toggle()
      end, { desc = "Fourth Terminal" })
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-i>",
          accept_word = "<C-n>",
          clear_suggestion = "<C-x>",
        },
        ignore_filetypes = { sh = true },
      })
    end,
  },
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = { enabled = true } } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
      }

      vim.opt.autoread = true

      vim.keymap.set("n", "<leader>ot", function()
        require("opencode").toggle()
      end, { desc = "Toggle embedded" })
      vim.keymap.set("n", "<leader>oa", function()
        require("opencode").ask("@cursor: ")
      end, { desc = "Ask about this" })
      vim.keymap.set("v", "<leader>oa", function()
        require("opencode").ask("@selection: ")
      end, { desc = "Ask about selection" })
      vim.keymap.set("n", "<leader>o+", function()
        require("opencode").prompt("@buffer", { append = true })
      end, { desc = "Add buffer to prompt" })
      vim.keymap.set("v", "<leader>o+", function()
        require("opencode").prompt("@selection", { append = true })
      end, { desc = "Add selection to prompt" })
      vim.keymap.set("n", "<leader>oe", function()
        require("opencode").prompt("Explain @cursor and its context")
      end, { desc = "Explain this code" })
      vim.keymap.set("n", "<leader>on", function()
        require("opencode").command("session_new")
      end, { desc = "New session" })
      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("messages_half_page_up")
      end, { desc = "Messages half page up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("messages_half_page_down")
      end, { desc = "Messages half page down" })
      vim.keymap.set({ "n", "v" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select prompt" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = {
            text = "▎",
          },
          change = {
            text = "▎",
          },
          delete = {
            text = "契",
          },
          topdelete = {
            text = "契",
          },
          changedelete = {
            text = "▎",
          },
          untracked = {
            text = "▎",
          },
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "<leader>gn", function()
            if vim.wo.diff then
              vim.cmd.normal({ "<leader>gn", bang = true })
            else
              gs.nav_hunk("next")
            end
          end, { desc = "Next Git Hunk" })

          map("n", "<leader>gN", function()
            if vim.wo.diff then
              vim.cmd.normal({ "<leader>gN", bang = true })
            else
              gs.nav_hunk("prev")
            end
          end, { desc = "Previous Git Hunk" })
          map(
            "n",
            "<Leader>gm",
            "<Plug>(git-messenger)",
            { desc = "Commit Message", silent = true }
          )

          -- Actions
          map(
            { "n", "v" },
            "<leader>gs",
            ":Gitsigns stage_hunk<CR>",
            { desc = "Stage Hunk" }
          )
          map(
            { "n", "v" },
            "<leader>gr",
            ":Gitsigns reset_hunk<CR>",
            { desc = "Reset Hunk" }
          )
          map("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Stage Hunk Visual" })
          map("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Reset Hunk Visual" })

          map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage Buffer" })
          map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
          map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Hunk" })
          map(
            "n",
            "<leader>gi",
            gs.preview_hunk_inline,
            { desc = "Preview Hunk Inline" }
          )
          map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, { desc = "Blame" })
          -- map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>gd", gs.diffthis, { desc = "Diff" })
          map("n", "<leader>gD", function()
            gs.diffthis("~")
          end, { desc = "Diff HEAD~" })

          map(
            "n",
            "<leader>gB",
            gs.toggle_current_line_blame,
            { desc = "Toggle Blame Current Line" }
          )
          map(
            "n",
            "<leader>gw",
            gs.toggle_word_diff,
            { desc = "Toggle Word Diff" }
          )

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return ""
        else
          return "Recording @" .. recording_register
        end
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { "filename", path = 1 },
            "branch",
            "diff",
            "diagnostics",
            {
              "macro-recording",
              fmt = show_macro_recording,
            },
          },
          lualine_x = {
            function()
              return require("lsp-progress").progress()
            end,
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    "linrongbin16/lsp-progress.nvim",
    config = function()
      require("lsp-progress").setup()
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
  {
    "yorickpeterse/nvim-pqf",
    config = function()
      require("pqf").setup()
    end,
  },
  -- {
  --   'DrKJeff16/project.nvim',
  --   version = false,
  --   ---@module 'project'
  --   ---@type Project.Config.Options
  --   opts = {
  --     detection_methods = { "pattern", "lsp" },
  --     patterns = { ".git" },
  --   },
  -- },
  -- {
  --   "ahmedkhalf/project.nvim",
  --   config = function()
  --     require("project_nvim").setup {
  --       detection_methods = { "pattern", "lsp" },
  --       patterns = { ".git" },
  --     }
  --   end,
  -- },
}
