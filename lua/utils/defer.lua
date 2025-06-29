local M = {}

local verbose = function(msg)
  if not vim.g.defer_verbose then
    return
  end
  if type(msg) == 'string' then
    toprint = msg
  else
    toprint = vim.inspect(msg)
  end
  vim.print(toprint)
end

M._deferred = { generic = {} }

M.add_deferred = function(fn, label)
  if label == nil then
    label = 'generic'
  end
  if M._deferred[label] == nil then
    M._deferred[label] = {}
  end
  if M._deferred[label] == 'finished' then
    verbose('running ' .. vim.inspect(fn) .. ' immediately; ' .. vim.inspect(label) .. ' executed')
    fn()
  else
    verbose('adding fn ' .. vim.inspect(fn) .. ' to ' .. vim.inspect(label))
    table.insert(M._deferred[label], fn)
  end
end

M.run = function(label, rerun)
  if label == nil then
    label = 'generic'
  end
  if rerun == nil then
    rerun = false
  end
  if M._deferred[label] == nil or M._deferred[label] == 'finished' then
    M._deferred[label] = 'finished'
    verbose('skipping ' .. vim.inspect(label) .. ' as its nil or finished')
    return
  end
  verbose('running ' .. tostring(#M._deferred[label]) .. ' functions for ' .. vim.inspect(label))
  for _, v in ipairs(M._deferred[label]) do
    v()
  end
  if not rerun then
    M._deferred[label] = 'finished'
  end
end

return M
