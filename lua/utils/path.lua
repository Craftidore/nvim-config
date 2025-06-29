local M = {}

M.path_sep = '/'
if vim.fn.stdpath('config'):sub(1, 1) ~= M.path_sep then
  M.path_sep = '\\'
end

M.join_paths = function(...)
  local args = { ... }
  return vim.fn.join(args, M.path_sep)
end

M.glob_path = function(path, glob)
  return vim.fn.globpath(path, glob, false, true)
end

local function remove_prefix(path, prefix)
  return path:sub(#prefix + 2)
end

local function remove_suffix(path, suffix)
  return path:gsub(suffix .. '$', '')
end

M.get_filename = function(path)
  if M.path_sep == '/' then
    return path:sub(string.find(path, '/[^/]*$') + 1)
  else
    return path:sub(string.find(path, '\\[^\\]*$') + 1)
  end
end

M.get_directory = function(path)
  if M.path_sep == '/' then
    return path:sub(1, string.find(path, '/[^/]*$') + 1)
  else
    return path:sub(1, string.find(path, '\\[^\\]*$') + 1)
  end
end

M.load_modules = function(req_path, ignore)
  local config_path = vim.fn.stdpath('config')
  local lua_path = M.join_paths(config_path, 'lua')
  local full_path = M.join_paths(lua_path, req_path)
  local paths = M.glob_path(full_path, '*.lua')
  local modules = {}
  for _, v in ipairs(paths) do
    if ignore == nil or not v:match(ignore .. '$') then
      local normalized = remove_suffix(remove_prefix(v, lua_path), '.lua')
      local file_only = M.get_filename(normalized)
      modules[file_only] = require(normalized)
    end
  end
  return modules
end

return M
