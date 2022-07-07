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
        sidescrolloff=6,

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
        },
        --
        -- Markdown Preview options
        -- 
        -- set to 1, nvim will open the preview window after entering the markdown buffer
        -- default: 0
        -- mkdp_auto_start = 0,

        -- set to 1, the nvim will auto close current preview window when change
        -- from markdown buffer to another buffer
        -- default: 1
        -- mkdp_auto_close = 1,

        -- set to 1, the vim will refresh markdown when save the buffer or
        -- leave from insert mode, default 0 is auto refresh markdown as you edit or
        -- move the cursor
        -- default: 0
        -- mkdp_refresh_slow = 0,

        -- set to 1, the MarkdownPreview command can be use for all files,
        -- by default it can be use in markdown file
        -- default: 0
        -- mkdp_command_for_global = 0,

        -- set to 1, preview server available to others in your network
        -- by default, the server listens on localhost (127.0.0.1)
        -- default: 0
        -- mkdp_open_to_the_world = 0,

        -- use custom IP to open preview page
        -- useful when you work in remote vim and preview on local browser
        -- more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
        -- default empty
        -- mkdp_open_ip = '',

        -- specify browser to open preview page
        -- for path with space
        -- valid: `/path/with\ space/xxx`
        -- invalid: `/path/with\\ space/xxx`
        -- default: ''
        -- mkdp_browser = '',

        -- set to 1, echo preview page url in command line when open preview page
        -- default is 0
        -- mkdp_echo_preview_url = 0,

        -- a custom vim function name to open preview page
        -- this function will receive url as param
        -- default is empty
        -- mkdp_browserfunc = '',

        -- options for markdown render
        -- mkit: markdown-it options for render
        -- katex: katex options for math
        -- uml: markdown-it-plantuml options
        -- maid: mermaid options
        -- disable_sync_scroll: if disable sync scroll, default 0
        -- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
        --   middle: mean the cursor position alway show at the middle of the preview page
        --   top: mean the vim top viewport alway show at the top of the preview page
        --   relative: mean the cursor position alway show at the relative positon of the preview page
        -- hide_yaml_meta: if hide yaml metadata, default is 1
        -- sequence_diagrams: js-sequence-diagrams options
        -- content_editable: if enable content editable for preview page, default: v:false
        -- disable_filename: if disable filename header for preview page, default: 0
        -- mkdp_preview_options = {
        --   mkit = {},
        --   katex = {},
        --   uml = {},
        --   maid = {},
        --   disable_sync_scroll = 0,
        --   sync_scroll_type = 'middle',
        --   hide_yaml_meta = 1,
        --   sequence_diagrams = {},
        --   flowchart_diagrams = {},
        --   content_editable = false,
        --   disable_filename = 0,
        --   toc = {}
        -- },

        -- use a custom markdown style must be absolute path
        -- like '/Users/username/markdown.css' or expand('~/markdown.css')
        -- mkdp_markdown_css = '',

        -- use a custom highlight style must absolute path
        -- like '/Users/username/highlight.css' or expand('~/highlight.css')
        -- mkdp_highlight_css = '',

        -- use a custom port to start server or empty for random
        -- mkdp_port = '',

        -- preview page title
        -- ${name} will be replace with the file name
        -- mkdp_page_title = '「${name}」',

        -- recognized filetypes
        -- these filetypes will have MarkdownPreview... commands
        -- mkdp_filetypes = {'markdown'},

        -- set default theme (dark or light)
        -- By default the theme is define according to the preferences of the system
        -- mkdp_theme = 'dark',
    }
}
