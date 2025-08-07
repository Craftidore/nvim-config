-- [nfnl] lua/utils/scratch.fnl
local vim = _G.vim
local function _1_(_3fid)
  local atoz = "abcdefghijklmnopqrstuvwxyz"
  local id
  if (_3fid == nil) then
    local gen_id = ""
    for _ = 1, 10 do
      gen_id = (gen_id .. atoz[math.random(1, 26)])
    end
    id = gen_id
  else
    id = _3fid
  end
  vim.cmd(("vsplit _sb_" .. id))
  return vim.cmd("\n    normal! ggdG\n    setlocal filetype=scratch\n    setlocal buftype=nofile\n    setlocal nobuflisted\n  ")
end
return {get_scratch = _1_}
