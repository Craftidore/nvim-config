-- [nfnl] lua/utils/defer.fnl
local M = {}
local vim = _G.vim
local function verbose(msg)
  local toprint = nil
  if vim.g.defer_verbose then
    if (type(msg) == "string") then
      toprint = msg
    else
      toprint = vim.inspect(msg)
    end
    return vim.print(toprint)
  else
    return nil
  end
end
M._deferred = {generic = {}}
M.add_deferred = function(func, _3flabel)
  local label = _3flabel
  if (label == nil) then
    label = "generic"
  else
  end
  if (M._deferred[label] == nil) then
    M._deferred[label] = {}
  else
  end
  if (M._deferred[label] == "finished") then
    verbose(("running " .. vim.inspect(func) .. " immediately; " .. vim.inspect(label) .. " executed"))
    return func()
  else
    verbose(("adding fn " .. vim.inspect(func) .. " to " .. vim.inspect(label)))
    return table.insert(M._deferred[label], func)
  end
end
M.run = function(_3flabel, _3frerun)
  local label = _3flabel
  local rerun = _3frerun
  if (label == nil) then
    label = "generic"
  else
  end
  if (rerun == nil) then
    rerun = false
  else
  end
  if ((M._deferred[label] == nil) or (M._deferred[label] == "finished")) then
    M._deferred[label] = "finished"
    return verbose(("skipping " .. vim.inspect(label) .. " as its nil or finished"))
  else
    verbose(("running " .. tostring(#M._deferred[label]) .. " functions for " .. vim.inspect(label)))
    for _, v in ipairs(M._deferred[label]) do
      v()
    end
    if not rerun then
      M._deferred[label] = "finished"
      return nil
    else
      return nil
    end
  end
end
return M
