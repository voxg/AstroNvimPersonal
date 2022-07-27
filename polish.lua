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
