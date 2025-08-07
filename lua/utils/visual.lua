-- [nfnl] lua/utils/visual.fnl
local vim = _G.vim
local function _1_()
  local curpos_info = vim.fn.getpos(".")
  local visual_end_info = vim.fn.getpos("v")
  local start_lnum = nil
  local end_lnum = nil
  if (curpos_info[2] < visual_end_info[2]) then
    start_lnum = curpos_info[2]
    end_lnum = visual_end_info[2]
  else
    start_lnum = visual_end_info[2]
    end_lnum = curpos_info[2]
  end
  return {start_lnum, end_lnum}
end
return {get_visual_lines = _1_}
