local Utils = {}

Utils.ifilter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then
      table.insert(out, v)
    end
  end

  return out
end

Utils.kfilter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then
      out[k] = v
    end
  end

  return out
end

return Utils
