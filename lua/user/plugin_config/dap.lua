local dap = require("dap")
local dapui = require("dapui")

dap.adapters.coreclr = {
  type = 'executable',
  command = 'netcoredbg',
  args = {'--interpreter=vscode'}
}

dapui.setup()


-- dap.configuration.cs = {
--   {
--     type = "coreclr",
--     name = "launch - netcoredbg",
--     request = "launch"
--   }
-- }
