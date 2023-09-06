-- setup language servers
local lspconfig = require('lspconfig')
--lspconfig.omnisharp.setup {}
--lspconfig.lua_ls.setup {
--  on_init = function(client)
--    local path = client.workspace_folders[1].name
--    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
--      client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--        runtime = {
--          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--          version = 'LuaJIT'
--        },
--        -- Make the server aware of Neovim runtime files
--        workspace = {
--          library = { vim.env.VIMRUNTIME }
--          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--          -- library = vim.api.nvim_get_runtime_file("", true)
--        }
--      })
--
--      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
--    end
--    return true
--  end
--}

-- Global mappings
-- See `:help vim.diagnostic.*` for docuemntation of any of the below functions
vim.keymap.set('n', "<leader>cd", vim.diagnostic.open_float)
vim.keymap.set('n', "[d", vim.diagnostic.goto_prev)
vim.keymap.set('n', "]d", vim.diagnostic.goto_next)
vim.keymap.set('n', "<leader>dl", vim.diagnostic.setloclist)

