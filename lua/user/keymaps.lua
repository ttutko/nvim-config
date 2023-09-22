-- Shorten function name
local keymap = vim.keymap.set
-- Slient keymap option
local opts = { silent = true }

local wk = require("which-key")

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",
--
--  Normal --
--  Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

-- Clear hightlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>c", "<cmd>bdelete<CR>", opts)
keymap("n", "<leader>C", "<cmd>bdelete!<CR>", opts)

-- Quit nvim
keymap("n", "<leader>q", "<cmd>qa<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<cr>", opts)
--keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
wk.register({
  f = {
    name = "Find",
    prefix = "<leader>f",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    t = { "<cmd>Telescope live_grep<CR>", "Live grep Text" },
    p = { "<cmd>Telescope projects<CR>", "Find Projects" },
    u = { "<cmd>Telescope undo<cr>", "Undo Tree" },
    ws = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
    ds = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  }
})

-- Git
wk.register({
  g = {
    name = "Git",
    prefix = "<leader>g",
    g = { _LAZYGIT_TOGGLE, "LazyGit" },
  }
})
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
wk.register({
  ["<leader>"] = {
    ["/"] = {
      "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
      "Toggle Comment"
    },
--     x = {
--       "<esc><cmd>lua require('comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       "toggle comment"
--     }
   }
})
-- -- keymap("n", "<leader>/", "<cmd>lua require('comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by ctrl space
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for docuemntation on any of the below functions
    local opts = { buffer = ev.buf }
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gl", vim.diagnostic.open_float, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    keymap("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap({'n','v'}, "<C-.>", vim.lsp.buf.code_action, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "<C-k><C-f>", function()
        vim.lsp.buf.format { async=true }
      end, opts)
  end,
})

-- DAP
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>dc", "<cmd>DapContinue<CR>", opts)
keymap("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", opts)

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "<leader>xr", function() require("trouble").open("lsp_references") end)

-- Harpoon
keymap("n", "<leader>mm", function() require("harpoon.ui").toggle_quick_menu() end)
keymap("n", "<leader>ma", function() require("harpoon.mark").add_file() end)
keymap("n", "<leader>m1", function() require("harpoon.ui").nav_file(1) end)
keymap("n", "<leader>m2", function() require("harpoon.ui").nav_file(2) end)
keymap("n", "<leader>m3", function() require("harpoon.ui").nav_file(3) end)
keymap("n", "<leader>m4", function() require("harpoon.ui").nav_file(4) end)
keymap("n", "<leader>m5", function() require("harpoon.ui").nav_file(5) end)
keymap("n", "<leader>mn", function() require("harpoon.ui").nav_next() end)
keymap("n", "<leader>mp", function() require("harpoon.ui").nav_prev() end)
keymap("n", "<leader>md", function() require("harpoon.mark").rm_file() end)

-- Dashboard
keymap("n", "<leader>;", "<cmd>Dashboard<CR>", opts)

-- Clipboard
keymap({'n', 'v'}, '<leader>y', '"+y') -- yank motion
keymap({'n', 'v'}, '<leader>Y', '"+Y') -- yank line
keymap({'n', 'v'}, '<leader>d', '"+d') -- delete motion
keymap({'n', 'v'}, '<leader>D', '"+D') -- delete line
keymap('n', '<leader>p', '"+p') -- paste after cursor
keymap('n', '<leader>P', '"+P') -- paste before cursor
