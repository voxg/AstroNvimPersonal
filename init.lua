-- 
--    _      _ __    __         
--   (_)__  (_) /_  / /_ _____ _
--  / / _ \/ / __/ / / // / _ `/
-- /_/_//_/_/\__(_)_/\_,_/\_,_/ 
--                              
-- 
local config = {

  header = {
    " ",
    " ",
    "██╗   ██╗ ██████╗ ██╗  ██╗ ██████╗ ",
    "██║   ██║██╔═══██╗╚██╗██╔╝██╔════╝ ",
    "██║   ██║██║   ██║ ╚███╔╝ ██║  ███╗",
    "╚██╗ ██╔╝██║   ██║ ██╔██╗ ██║   ██║",
    " ╚████╔╝ ╚██████╔╝██╔╝ ██╗╚██████╔╝",
    "  ╚═══╝   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ",
    "                                   ",
    " ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
    " ████╗  ██║██║   ██║██║████╗ ████║ ",
    " ██╔██╗ ██║██║   ██║██║██╔████╔██║ ",
    " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                   ",
    " ",
  },
  --]=====]

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  --colorscheme = "catppuccin",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    autopairs = {
      disable_filetype = { "TelescopePrompt", "spectre_panel", "ps1" },
    },
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },
      {
        'nvim-orgmode/orgmode',
        ft = {'org'},
        config = function()
          require('orgmode').setup{}
        end,
      },
      {
        'akinsho/org-bullets.nvim',
        config=function()
          require('org-bullets').setup()
        end,
      },
      {
        'renerocksai/telekasten.nvim',
        config = require('user.telekasten_config')
      },
      {
        'iamcco/markdown-preview.nvim',
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
      },
      -- {
      --   'nvim-neorg/neorg',
      --   config = function ()
      --     require('neorg').setup {
      --       load = {
      --         ["core.defaults"] = {},
      --         ["core.neorg.dirman"] = {
      --           config = {
      --             workspaces = {
      --               default = '~/notes'
      --             }
      --           }
      --         }
      --       }
      --     }
      --   end,
      --   requires = 'nvim-lua/plenary.nvim'
      -- },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      highlight = {
        additional_vim_regex_highlighting = {'org'},
      },
      ensure_installed = { "lua", "org" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
}

return config
