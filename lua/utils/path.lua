-- [nfnl] lua/utils/path.fnl
local vim = _G.vim
local path_sep
do
  local first_path_char = vim.fn.stdpath("config"):sub(1, 1)
  if (first_path_char ~= "/") then
    path_sep = "\\"
  else
    path_sep = "/"
  end
end
local remove_prefix
local function _2_(path, prefix)
  return path:sub((#prefix + 2))
end
remove_prefix = _2_
local remove_suffix
local function _3_(path, suffix)
  return path:gsub((suffix .. "$"), "")
end
remove_suffix = _3_
local join_paths
local function _4_(...)
  return vim.fn.join({...}, path_sep)
end
join_paths = _4_
local glob_path
local function _5_(path, glob)
  return vim.fn.globpath(path, glob, false, true)
end
glob_path = _5_
local get_filename
local function _6_(path)
  if (path_sep == "/") then
    return path:sub((string.find(path, "/[^/]*$") + 1))
  else
    return path:sub((string.find(path, "\\[^\\]*$") + 1))
  end
end
get_filename = _6_
local function _8_(path)
  if (path_sep == "/") then
    return path:sub(1, (string.find(path, "/[^/]*$") + 1))
  else
    return path:sub(1, (string.find(path, "\\[^\\]*$") + 1))
  end
end
local function _10_(req_path, ignore)
  local config_path = vim.fn.stdpath("config")
  local lua_path = join_paths(config_path, "lua")
  local full_path = join_paths(lua_path, req_path)
  local paths = glob_path(full_path, "*.lua")
  local modules = {}
  for _, v in ipairs(paths) do
    if ((ignore == nil) or not v:match((ignore .. "$"))) then
      local normalized = remove_suffix(remove_prefix(v, lua_path), ".lua")
      local file_only = get_filename(normalized)
      modules[file_only] = require(normalized)
    else
    end
  end
  return modules
end
return {path_sep = path_sep, join_paths = join_paths, glob_path = glob_path, get_filename = get_filename, get_directory = _8_, load_modules = _10_}
