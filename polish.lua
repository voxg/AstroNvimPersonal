-- 
--               ___     __     __         
--    ___  ___  / (_)__ / /    / /_ _____ _
--   / _ \/ _ \/ / (_-</ _ \_ / / // / _ `/
--  / .__/\___/_/_/___/_//_(_)_/\_,_/\_,_/ 
-- /_/                                     
-- 

  return function()
    -- Set key bindings
    local keys = require('user.keybindings')
    keys()

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    require('user.options')

    -- Load custom tree-sitter grammar for org filetype
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
      org_agenda_files = {'~/notes/*'}, -- '~/my-orgs/**/*' (not sure what ** does)
      org_default_notes_file = '~/notes/refile.org',
      org_todo_keywords = { 'TODO', 'BLOCKED', '|', 'DONE' },
    })

    -- Tree-sitter configuration
    require'nvim-treesitter.configs'.setup {
      -- If TS highlighs are not enabled at all, or disabled fia `disable` prop, highlighting will fallback to default Vim syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTeX highlights and code block highlights that do not have ts grammar
      },
      ensure_installed = {'org'}, -- Or run :TSUpdate org
    }

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
end
