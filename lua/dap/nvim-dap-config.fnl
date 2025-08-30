(local vim _G.vim)

(fn dap [...]
  (var result (require :dap))
  (each [_ v (ipairs [...])]
    (set result (. result v)))
  result)

{1 :mfussenegger/nvim-dap 
 :config (fn []
          (local dap (require :dap))
          ; C/C++
          (tset dap.adapters :gdb {:type :executable
                                   :command :gdb
                                   :args [:--interpreter=dap :--eval-command "set print pretty on"]})
          (tset dap.configurations :c
                [{ :name :Launch
                   :type :gdb
                   :request :launch
                   :program (fn [] (vim.fn.input "Path to executable: " (.. (vim.fn.getcwd) :/) :file))
                   :cwd "${workspaceFolder}"
                   :stopAtBeginningOfMainSubprogram false}
                 {:name "Select and attach to process"
                  :type :gdb
                  :request :attach
                  :program (fn [] (vim.fn.input "Path to executable: " (.. (vim.fn.getcwd) :/) :file))
                  :pid (fn []
                        (local name (vim.fn.input "Executable name (filter): "))
                        (local dap-utils (require :dap.utils))
                        (dap-utils.pick_process { :filter name }))
                  :cwd "${workspaceFolder}"}])
          (tset dap.configurations :cpp dap.configurations.c))
 :keys [{1 "<M-o>" 2 (fn [] (vim.cmd "DapViewOpen")) :desc "Debug: Open View"}
        {1 "<M-h>" 2 (fn [] ((dap :step_out))) :desc "Debug: Step Out"} 
        {1 "<M-l>" 2 (fn [] ((dap :step_into))) :desc "Debug: Step Into"}
        {1 "<M-j>" 2 (fn [] ((dap :step_over))) :desc "Debug: Step Over"}
        {1 "<M-k>" 2 (fn [] ((dap :restart_frame))) :desc "Debug: Restart Frame"}
        {1 "<M-c>" 2 (fn [] ((dap :continue))) :desc "Debug: Continue"}
        {1 "<M-p>" 2 (fn [] ((dap :pause))) :desc "Debug: Pause"}
        {1 "<M-n>" 2 (fn [] (vim.cmd "DapNew")) :desc "Debug: New"}
        {1 "<M-b>" 2 (fn [] ((dap :toggle_breakpoint))) :desc "Debug: Toggle Breakpoint"}
        {1 "<M-s>" 2 (fn [] ((. (require "dap.ui.widgets") :preview))) :desc "Debug: Preview"}]}
