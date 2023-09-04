local dap =  require('dap')
dap.configurations.python3 = {
    {
        type = 'python';
        request = 'launch';
        module = 'flow_initiator';
        name = 'flow1';
    },
}
local  dapui =  require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
require('dap-python').setup('/usr/bin/python3')
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  module= 'flow_initiator',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
require('dap.ext.vscode').load_launchjs("/opt/mov.ai/app/.vscode/launch.json")
require("dapui").setup()
vim.keymap.set('n', '<leader>du', function () require('dapui').toggle() end)

vim.keymap.set('n', '<F6>', function() require('dap').terminate() end, {desc='Terminate'})
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, {desc='Continue'})
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end , {desc='Step over'})
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end , {desc='Step into'})
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end , {desc='Step out'})
vim.keymap.set('n', '<leader>dt', function() require('dap').terminate() end, {desc='Terminate'})
vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, {desc='Continue'})
vim.keymap.set('n', '<Leader>ds', function() require('dap').step_over() end , {desc='Step over'})
vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end , {desc='Step into'})
vim.keymap.set('n', '<Leader>do', function() require('dap').step_out() end , {desc='Step out'})
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, {desc='Toggle breakpoint'})
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, {desc='Set breakpoint'})
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end , {desc='Open REPL'})
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end , {desc='Toggle UI'})
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end , {desc='Run last'})
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, {desc='Hover'})
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, {desc='Preview'})
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, {desc='Frames'})
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, {desc='Scopes'})
