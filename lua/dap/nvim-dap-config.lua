-- [nfnl] lua/dap/nvim-dap-config.fnl
local vim = _G.vim
local function dap(...)
  local result = require("dap")
  for _, v in ipairs({...}) do
    result = result[v]
  end
  return result
end
local function _1_()
  local dap0 = require("dap")
  dap0.adapters["gdb"] = {type = "executable", command = "gdb", args = {"--interpreter=dap", "--eval-command", "set print pretty on"}}
  local function _2_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  local function _3_()
    return vim.fn.input("Path to executable: ", (vim.fn.getcwd() .. "/"), "file")
  end
  local function _4_()
    local name = vim.fn.input("Executable name (filter): ")
    local dap_utils = require("dap.utils")
    return dap_utils.pick_process({filter = name})
  end
  dap0.configurations["c"] = {{name = "Launch", type = "gdb", request = "launch", program = _2_, cwd = "${workspaceFolder}", stopAtBeginningOfMainSubprogram = false}, {name = "Select and attach to process", type = "gdb", request = "attach", program = _3_, pid = _4_, cwd = "${workspaceFolder}"}}
  dap0.configurations["cpp"] = dap0.configurations.c
  return nil
end
local function _5_()
  return vim.cmd("DapViewOpen")
end
local function _6_()
  return dap("step_out")()
end
local function _7_()
  return dap("step_into")()
end
local function _8_()
  return dap("step_over")()
end
local function _9_()
  return dap("restart_frame")()
end
local function _10_()
  return dap("continue")()
end
local function _11_()
  return dap("pause")()
end
local function _12_()
  return vim.cmd("DapNew")
end
local function _13_()
  return dap("toggle_breakpoint")()
end
local function _14_()
  return require("dap.ui.widgets").preview()
end
return {"mfussenegger/nvim-dap", config = _1_, keys = {{"<M-o>", _5_, desc = "Debug: Open View"}, {"<M-h>", _6_, desc = "Debug: Step Out"}, {"<M-l>", _7_, desc = "Debug: Step Into"}, {"<M-j>", _8_, desc = "Debug: Step Over"}, {"<M-k>", _9_, desc = "Debug: Restart Frame"}, {"<M-c>", _10_, desc = "Debug: Continue"}, {"<M-p>", _11_, desc = "Debug: Pause"}, {"<M-n>", _12_, desc = "Debug: New"}, {"<M-b>", _13_, desc = "Debug: Toggle Breakpoint"}, {"<M-s>", _14_, desc = "Debug: Preview"}}}
