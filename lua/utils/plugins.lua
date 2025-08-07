-- [nfnl] lua/utils/plugins.fnl
local function _1_(plugin_path)
  local success = true
  local function err()
    success = false
    return nil
  end
  local function _2_()
    local _ = require(plugin_path)
    return nil
  end
  xpcall(_2_, err)
  return success
end
return {has_plugin = _1_}
