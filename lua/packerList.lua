local Module = {}

Module.list = {}

-- using should be a string
function Module.add(using)
    Module.list[#Module.list+1] = using;
end

function Module.forEach(use)
    for i = 1, #Module.list do
        use(Module.list[i])
    end
end

return Module
