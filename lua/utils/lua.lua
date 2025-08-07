-- [nfnl] lua/utils/lua.fnl
local function _1_(t, filter_iter)
  local out = {}
  for k, v in ipairs(t) do
    if filter_iter(v, k, t) then
      table.insert(out, v)
    else
    end
  end
  return nil
end
local function _3_(t, filter_iter)
  local out = {}
  for k, v in pairs(t) do
    if filter_iter(v, k, t) then
      table.insert(out, v)
    else
    end
  end
  return nil
end
local function _5_(arr, value, _3ftest)
  local test
  if (_3ftest == nil) then
    local function _6_(lhs, rhs)
      return (lhs == rhs)
    end
    test = _6_
  else
    test = _3ftest
  end
  local result = false
  for i = 1, #arr do
    if test(arr[i], value) then
      result = true
    else
    end
  end
  return result
end
local function _9_(inputString, sep)
  local fields = {}
  local pattern = string.format("([^%s]+)", sep)
  local function _10_(c)
    fields[(#fields + 1)] = c
    return nil
  end
  string.gsub(inputString, pattern, _10_)
  return fields
end
return {ifilter = _1_, kfilter = _3_, contains = _5_, split = _9_}
