--
--               __  _                 __
--    ___  ___  / /_(_)__  ___  ___   / /_ _____ _
--   / _ \/ _ \/ __/ / _ \/ _ \(_-<_ / / // / _ `/
--   \___/ .__/\__/_/\___/_//_/___(_)_/\_,_/\_,_/
--      /_/
--
return {
    opt = {
        -- [[ Context ]]
        colorcolumn = "80,100",
        number = true,
        relativenumber = false,
        -- signcolumn = "yes",
        scrolloff = 4,

        -- [[ File encoding ]]
        encoding = 'utf8',
        fileencoding = 'utf8',

        -- [[ Theme ]]
        syntax = "ON",
        termguicolors = true,

        -- [[ Search ]]
        ignorecase = true,
        smartcase = true,
        incsearch = true,
        hlsearch = true,

        -- [[ Whitespace ]]
        expandtab = true,
        shiftwidth = 4,
        softtabstop = 4,
        tabstop = 4,

        -- [[ Splits ]]
        splitright = true,
        splitbelow = true,
    },
    g = {
        vimwiki_list = {
            {path='~/OneDrive/Documents/documents/Notes', syntax='markdown', ext='.md'},
        }
    }
}
