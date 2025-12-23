-- ============================================================================
-- Plugin Specifications
-- ============================================================================

return {
  -- ============================================================================
  -- Colorscheme
  -- ============================================================================

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave", -- wave, dragon, lotus
        transparent = false, -- Don't use terminal background
        background = {
          dark = "wave",
          light = "lotus"
        },
      })
    end,
  },

  -- ============================================================================
  -- LSP & Completion
  -- ============================================================================

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- LSP Keybindings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
      vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "List workspace folders" })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set loclist" })
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

      -- Diagnostic signs
      vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
      vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" })

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = { prefix = "", spacing = 0 },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Custom CompletionItemKind icons
      vim.lsp.protocol.CompletionItemKind = {
        "   (Text) ", "   (Method)", "   (Function)", "   (Constructor)",
        " ﴲ  (Field)", "[] (Variable)", "   (Class)", " ﰮ  (Interface)",
        "   (Module)", " 襁 (Property)", "   (Unit)", "   (Value)",
        " 練 (Enum)", "   (Keyword)", "   (Snippet)", "   (Color)",
        "   (File)", "   (Reference)", "   (Folder)", "   (EnumMember)",
        " ﲀ  (Constant)", " ﳤ  (Struct)", "   (Event)", "   (Operator)",
        "   (TypeParameter)"
      }

      -- Common on_attach function for illuminate
      local function on_attach(client)
        require("illuminate").on_attach(client)
        vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
        vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
        vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
      end

      -- Setup capabilities with nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Merge with cmp_nvim_lsp capabilities
      local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, cmp_capabilities)

      -- LSP Server Configurations
      -- TypeScript/JavaScript
      vim.lsp.config('ts_ls', {
        default_config = {
          cmd = { 'typescript-language-server', '--stdio' },
          filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
          root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
          capabilities = capabilities,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      })
      vim.lsp.enable('ts_ls')

      -- ESLint
      vim.lsp.config('eslint', {
        default_config = {
          cmd = { 'vscode-eslint-language-server', '--stdio' },
          filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue', 'svelte', 'astro' },
          root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json', 'eslint.config.js', 'package.json' },
          capabilities = capabilities,
          settings = {
            codeAction = {
              disableRuleComment = {
                enable = true,
                location = "separateLine"
              },
              showDocumentation = {
                enable = true
              }
            },
            codeActionOnSave = {
              enable = false,
              mode = "all"
            },
            format = true,
            nodePath = "",
            onIgnoredFiles = "off",
            packageManager = "npm",
            quiet = false,
            rulesCustomizations = {},
            run = "onType",
            useESLintClass = false,
            validate = "on",
            workingDirectory = {
              mode = "location"
            }
          },
        },
      })
      vim.lsp.enable('eslint')

      -- Enable inlay hints globally
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })

      -- Python
      vim.lsp.config('pyright', {
        default_config = {
          cmd = { 'pyright-langserver', '--stdio' },
          filetypes = { 'python' },
          root_markers = { 'pyrightconfig.json', 'pyproject.toml', 'setup.py', '.git' },
          capabilities = capabilities,
        },
      })
      vim.lsp.enable('pyright')

      -- Rust
      vim.lsp.config('rust_analyzer', {
        default_config = {
          cmd = { 'rust-analyzer' },
          filetypes = { 'rust' },
          root_markers = { 'Cargo.toml', '.git' },
          capabilities = capabilities,
        },
      })
      vim.lsp.enable('rust_analyzer')

      -- CSS
      vim.lsp.config('cssls', {
        default_config = {
          cmd = { 'css-languageserver', '--stdio' },
          filetypes = { 'css', 'scss', 'less' },
          root_markers = { 'package.json', '.git' },
          capabilities = capabilities,
        },
      })
      vim.lsp.enable('cssls')

      -- HTML
      vim.lsp.config('html', {
        default_config = {
          cmd = { 'html-languageserver', '--stdio' },
          filetypes = { 'html' },
          root_markers = { 'package.json', '.git' },
          capabilities = capabilities,
        },
      })
      vim.lsp.enable('html')

      -- Go
      vim.lsp.config('gopls', {
        default_config = {
          cmd = { 'gopls' },
          filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
          root_markers = { 'go.mod', '.git' },
          capabilities = capabilities,
        },
      })
      vim.lsp.enable('gopls')

      -- Set up LspAttach autocmd for common on_attach
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            on_attach(client)
          end
        end,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "   (LSP)",
              vsnip = "   (Snippet)",
              buffer = "   (Buffer)",
              path = "   (Path)",
            })[entry.source.name]
            return vim_item
          end
        },
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- ============================================================================
  -- Treesitter
  -- ============================================================================

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "tsx",
          "python", "rust", "go",
          "html", "css", "json", "yaml",
          "bash", "markdown", "markdown_inline"
        },
        autotag = { enable = true },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        autopairs = { enable = true },
      })
    end,
  },

  -- ============================================================================
  -- Telescope
  -- ============================================================================

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<C-t>", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { "node_modules", ".git/" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      -- Load fzf extension for better performance
      telescope.load_extension("fzf")
    end,
  },

  -- ============================================================================
  -- Git
  -- ============================================================================

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Stage file" },
      { "<leader>gr", "<cmd>Gread<cr>", desc = "Checkout file (revert)" },
      { "<leader>gm", "<cmd>Gdiffsplit!<cr>", desc = "3-way merge" },
      { "<leader>go", "<cmd>GBrowse<cr>", desc = "Open in GitHub" },
      { "<leader>go", ":GBrowse<cr>", mode = "v", desc = "Open selection in GitHub" },
    },
  },

  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- ============================================================================
  -- File Explorer
  -- ============================================================================

  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle file tree" },
      { "<leader>n", ":NvimTreeFindFile<CR>", desc = "Find current file in tree" },
    },
    config = function()
      require("nvim-tree").setup({
        hijack_netrw = false, -- Let oil.nvim handle netrw
        disable_netrw = false,
        git = { enable = true, ignore = true },
        diagnostics = { enable = true },
        filters = { dotfiles = true },
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>-", "<cmd>Oil .<cr>", desc = "Open current directory" },
    },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
      })
    end,
  },

  -- ============================================================================
  -- UI Enhancements
  -- ============================================================================

  {
    "mhinz/vim-startify",
    lazy = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- Will automatically match kanagawa
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
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
    "romgrk/barbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        win = {
          border = "rounded",
        },
      })
    end,
  },

  -- ============================================================================
  -- Editing Enhancements
  -- ============================================================================

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')

      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = {"string"},
          javascript = {"template_string"}
        }
      })

      npairs.add_rules {
        Rule(' ', ' '):with_pair(function (opts)
          local pair = opts.line:sub(opts.col, opts.col + 1)
          return vim.tbl_contains({ '()', '[]', '{}' }, pair)
        end)
      }

      -- Integration with nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "tpope/vim-abolish",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "tpope/vim-commentary",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle" },
      { "gcc", desc = "Comment line" },
    },
  },

  {
    "tpope/vim-eunuch",
    cmd = { "Delete", "Unlink", "Move", "Rename", "Chmod", "Mkdir", "Cfind", "Clocate", "Lfind", "Llocate", "Wall", "SudoWrite", "SudoEdit" },
  },

  {
    "tpope/vim-surround",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "tpope/vim-unimpaired",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "tpope/vim-repeat",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- ============================================================================
  -- Navigation
  -- ============================================================================

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right" },
    },
  },
}
