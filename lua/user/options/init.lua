vim.o.backup = false                -- creates a backup file
vim.o.cmdheight = 1                 -- more space in the neovim command line for displaying messages
vim.o.conceallevel = 0              -- so that `` is visible in markdown files
vim.o.fileencoding = "utf-8"        -- default file encoding
vim.o.hlsearch = true               -- highlight all matches on previous search pattern
vim.o.ignorecase = true             -- ignore case in search patterns
vim.o.mouse = "a"                   -- allow the mouse to be used in neovim
vim.o.pumheight = 10                -- popup menu height
vim.o.showmode = false              -- hide the -- INSERT -- or -- VISUAL -- indicators
vim.o.showtabline = 0               -- never show tabs
vim.o.smartcase = true              -- smart case
vim.o.smartindent = true            -- smart indenting
vim.o.splitbelow = true             -- force all horizontal splits to go below current window
vim.o.splitright = true             -- force all vertical splits to go to the right of the current window
vim.o.swapfile = false              -- don't create a swap file
vim.o.termguicolors = true          -- set term gui colors which are supported by most terminals
vim.o.timeoutlen = 1000             -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.undofile = true               -- enable persistent undo
vim.o.updatetime = 300              -- faster completion (4000ms default)
vim.o.writebackup = false           -- if a file is being endited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.shiftwidth = 2                -- the number of spaces inserted for each indentation
vim.o.tabstop = 2                   -- insert 2 spaces for a tab
vim.o.cursorline = true             -- highlight the current line
vim.o.number = true                 -- numbered lines
vim.o.laststatus = 3                -- only the last status window will only have a status line
vim.o.showcmd = false               -- hide (partial) command in the last line of the screen (for performance)
vim.o.ruler = false                 -- hide the line and column number, otherwise it whould shift the text each time
vim.o.numberwidth = 4               -- minial number of columns to use for the line number {default 4}
vim.o.signcolumn = "yes"            -- always show the sign column, otherwise it would shift the text each time
vim.o.wrap = false                  -- don't wordwrap
vim.o.scrolloff = 8                 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8             -- minimal number of screen columns to keep to the left and right of the cursor if wrap is set 'false'
--vim.o.fillchars=eob:" "             -- show empty lines at the end of a buffer as ` ` { default `~` }
vim.opt.shortmess:append({c=true})          -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2"
vim.opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-")         -- treats words with `-` as single words
vim.opt.formatoptions:remove({"c", "r", "o"}) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.o.linebreak = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.clipboard = 'unnamedplus'

vim.g.OmniSharp_server_use_net6=1
