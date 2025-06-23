local Defer = {}
Defer._deferred = { generic = {} }
Defer.add_deferred = function(fn, label)
  if label == nil then
    label = 'generic'
  end
  if Defer._deferred[label] == nil then
    Defer._deferred[label] = {}
  end
  table.insert(Defer._deferred[label], fn)
end
Defer.run = function(label)
  if label == nil then
    label = 'generic'
  end
  if Defer._deferred[label] == nil then
    return
  end
  for _, v in ipairs(Defer._deferred[label]) do
    v()
  end
end
return Defer
