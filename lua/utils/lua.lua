local Lua = {}

Lua.ifilter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then
      table.insert(out, v)
    end
  end

  return out
end

Lua.kfilter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then
      out[k] = v
    end
  end

  return out
end

-- Shamelessly adapted from https://www.reddit.com/r/learnprogramming/comments/s41ykx/lua_is_there_a_method_to_see_if_a_table_or_array/
Lua.contains = function(arr, value, test)
  if test == nil then
    test = function(lhs, rhs)
      return lhs == rhs
    end
  end
  for i = 1, #arr do
    if test(arr[i], value) then
      return true
    end
  end
  return false
end

-- Stolen from https://www.reddit.com/r/neovim/comments/su0em7/pathjoin_for_lua_or_vimscript_do_we_have_anything/
Lua.split = function(inputString, sep)
  local fields = {}

  local pattern = string.format('([^%s]+)', sep)
  local _ = string.gsub(inputString, pattern, function(c)
    fields[#fields + 1] = c
  end)

  return fields
end

return Lua
