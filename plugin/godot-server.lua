-- [nfnl] plugin/godot-server.fnl
local vim = _G.vim
local paths_to_check = {"/", "/../"}
local cwd = vim.uv.cwd()
local function file_exists_3f(path)
  local stat_file = vim.uv.fs_stat(path)
  return ((stat_file and true) or false)
end
local godot_project_path
do
  local found = nil
  for _, path in pairs(paths_to_check) do
    if found then break end
    if file_exists_3f((cwd .. path .. "project.godot")) then
      found = (cwd .. path)
    else
      found = found
    end
  end
  godot_project_path = found
end
if godot_project_path then
  local server_path = (godot_project_path .. "/server.pipe")
  local is_server_running = file_exists_3f(server_path)
  if not is_server_running then
    vim.notify("Server started automatically")
    return vim.fn.serverstart(server_path)
  else
    return nil
  end
else
  return nil
end
