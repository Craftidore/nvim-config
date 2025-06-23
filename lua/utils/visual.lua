local Visual = {}

Visual.get_visual_lines = function()
  local curpos_info = vim.fn.getpos('.')
  local visual_end_info = vim.fn.getpos('v')
  local start_lnum
  local end_lnum
  if curpos_info[2] < visual_end_info[2] then
    start_lnum = curpos_info[2]
    end_lnum = visual_end_info[2]
  else
    start_lnum = visual_end_info[2]
    end_lnum = curpos_info[2]
  end
  return { start_lnum, end_lnum }
end

return Visual
