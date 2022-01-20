-- Use `:help options` to see the full definitions for all settings.
-- Alternatively, to see only the documentation for a single option
-- use `:help <option>`.

local options = {
    backup         = false,           -- create a backup file while editing
    clipboard      = "unnamedplus",   -- allow neovim to access system clipboard
    cmdheight      = 2,               -- increase command space by this many lines
    completeopt    = {                -- A list of options for Insert mode completion
        "menuone",  -- use popup menu also when there is only one match
        "noselect", -- do not select a match in the menu automatically
    },
    conceallevel   = 0,               -- how text with the conceal attribute is shown
    fileencoding   = "utf-8",         -- encoding for the current buffer
    hlsearch       = true,            -- highlight all matches on search
    ignorecase     = true,            -- make search case insensitive
    mouse          = "a",             -- set mouse support within neovim
    pumheight      = 10,              -- maximum number of items to show in popup menu
    showmode       = false,           -- whether to show the current mode or not
    showtabline    = 2,               -- when to show tab lines
    smartcase      = true,            -- override search sensitivity when uppercase chars are used
    smartindent    = true,            -- attempt to indent properly for the current language
    splitbelow     = true,            -- whether to split the current window towards the bottom
    splitright     = true,            -- whether to split the current window towards the right
    swapfile       = false,           -- create a swap file when editing/writing
    timeoutlen     = 100,             -- time to wait for a mapped sequence to complete (ms)
    undofile       = true,            -- enable persistent undo tracking
    updatetime     = 300,             -- time to wait for inactivity before writing swap file
    writebackup    = false,           -- make a backup before overwriting a file
    expandtab      = true,            -- expand tabs into spaces
    shiftwidth     = 4,               -- default number of spaces to add when indenting
    tabstop        = 4,               -- default indentation size
    cursorline     = true,            -- highlight the current line
    number         = true,            -- show line numbers
    relativenumber = false,           -- show line numbers relative to the cursor
    numberwidth    = 4,               -- minimal number of columns to use for the line number
    signcolumn     = "yes",           -- when to draw the sign column (always)
    wrap           = false,           -- whether vim should wrap long lines
    scrolloff      = 8,               -- how many lines to keep above and below the cursor when scrolling
    sidescrolloff  = 8,               -- how many columns to keep on either side of the cursor when scrolling
    guifont        = "monospace:h17", -- font family for graphical neovim
}

vim.opt.shortmess:append "c"

for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
