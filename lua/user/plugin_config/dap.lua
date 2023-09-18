local dap = require("dap")
local dapui = require("dapui")

dap.adapters.coreclr = {
  type = 'executable',
  command = 'netcoredbg',
  args = {'--interpreter=vscode'}
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- dap.configuration.cs = {
--   {
--     type = "coreclr",
--     name = "launch - netcoredbg",
--     request = "launch"
--   }
-- }
