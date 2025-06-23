local Plugin = {}

Plugin.has_plugin = function(plugin_path)
  local success = true
  local err = function()
    success = false
  end
  xpcall(function()
    local _ = require(plugin_path)
  end, err)
  return success
end

return Plugin
