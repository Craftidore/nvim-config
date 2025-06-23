local Scratch = {}

-- WARN: I'm inclined to change how this works later;
--       I'll probably want to use it for better things than just <leader>ox
Scratch.get_scratch = function(id)
  local atoz = 'abcdefghijklmnopqrstuvwxyz'
  if id == nil then
    id = ''
    for _ = 1, 10 do
      id = id .. atoz[math.random(1, 26)]
    end
  end
  vim.cmd([[
    vsplit _sb_]] .. id)
  vim.cmd([[
    normal! ggdG
    setlocal filetype=scratch
    setlocal buftype=nofile
    setlocal nobuflisted
  ]])
end

return Scratch
