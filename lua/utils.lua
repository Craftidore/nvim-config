local fn = vim.fn
local Module = {}

function Module.get_nvim_version()
  local actual_ver = vim.version()

  local nvim_ver_str = string.format("%d.%d.%d", actual_ver.major, actual_ver.minor, actual_ver.patch)
  return nvim_ver_str
end

function Module.reloadConfig()
    for name,_ in pairs(package.loaded) do
        package.loaded[name] = nil
    end
    dofile(vim.env.MYVIMRC)
    vim.notify("Neovim config reloaded.", vim.log.levels.INFO)
end

return Module
