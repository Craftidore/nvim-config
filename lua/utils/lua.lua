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

return Lua
