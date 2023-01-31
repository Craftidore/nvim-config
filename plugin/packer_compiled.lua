-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/craftidore/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/craftidore/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/craftidore/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/craftidore/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/craftidore/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    config = { "\27LJ\2\nJ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0+let g:camelcasemotion_key = '<leader>'\bcmd\bvim\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nŠ\1\0\0\6\1\6\2\25-\0\0\0009\0\0\0'\2\1\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16€-\1\0\0009\1\2\1'\3\1\0B\1\2\2\18\3\1\0009\1\3\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\4\1'\4\5\0B\1\3\2X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\0À\a%s\nmatch\bsub\fgetline\6.\bcol\2\0»\2\0\0\a\2\17\0+-\0\0\0009\0\0\0'\2\1\0B\0\2\2-\1\0\0009\1\2\0015\3\3\0006\4\4\0009\4\5\0049\4\6\4B\1\3\2)\2\0\0\3\2\1\0X\1\a€-\1\1\0009\1\a\1'\3\b\0\18\4\0\0&\3\4\3B\1\2\1X\1\21€-\1\1\0009\1\t\1'\3\n\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\v\1'\3\f\0B\1\2\1X\1\n€-\1\1\0009\1\a\1'\3\r\0006\4\4\0009\4\14\0049\4\15\4'\5\16\0\18\6\0\0&\3\6\3B\1\2\1K\0\1\0\0À\2À\6 \15keywordprg\6o\6!\fdoHover\19CocActionAsync\20coc#rpc#ready()\14nvim_eval\ah \17nvim_command\rfiletype\abo\bvim\1\3\0\0\bvim\thelp\nindex\f<cword>\vexpand®\t\1\0\v\0007\0i6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\0\0009\2\3\2)\3,\1=\3\4\1'\3\6\0=\3\5\0016\3\a\0003\4\t\0=\4\b\0035\3\n\0009\4\v\2'\6\f\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\0019\4\v\2'\6\f\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\0019\4\v\2'\6\f\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\0016\4\0\0009\4\19\0049\4\20\4\18\5\4\0'\a\f\0'\b\21\0'\t\22\0B\5\4\1\18\5\4\0'\a\f\0'\b\23\0'\t\24\0005\n\25\0B\5\5\1\18\5\4\0'\a\26\0'\b\27\0'\t\28\0005\n\29\0B\5\5\1\18\5\4\0'\a\26\0'\b\30\0'\t\31\0005\n \0B\5\5\1\18\5\4\0'\a\26\0'\b!\0'\t\"\0005\n#\0B\5\5\1\18\5\4\0'\a\26\0'\b$\0'\t%\0005\n&\0B\5\5\1\18\5\4\0'\a\26\0'\b'\0'\t(\0005\n)\0B\5\5\1\18\5\4\0'\a\26\0'\b*\0'\t+\0005\n,\0B\5\5\0016\5\a\0003\6.\0=\6-\5\18\5\4\0'\a\26\0'\b/\0'\t0\0005\n1\0B\5\5\1\18\5\4\0'\a2\0'\b3\0'\t4\0005\n5\0B\5\5\1\18\5\4\0'\a\26\0'\b3\0'\t4\0005\n6\0B\5\5\0012\0\0€K\0\1\0\1\0\1\vsilent\2\1\0\1\vsilent\2 <Plug>(coc-format-selected)\14<leader>h\6x\1\0\1\vsilent\2 <CMD>lua _G.show_docs()<CR>\15<leader>gk\0\14show_docs\1\0\1\vsilent\2\27<Plug>(coc-references)\agr\1\0\1\vsilent\2\31<Plug>(coc-implementation)\agi\1\0\1\vsilent\2 <Plug>(coc-type-definition)\agy\1\0\1\vsilent\2\27<Plug>(coc-definition)\agd\1\0\1\vsilent\2 <Plug>(coc-diagnostic-next)\a]g\1\0\1\vsilent\2 <Plug>(coc-diagnostic-prev)\a[g\6n\1\0\2\texpr\2\vsilent\2\18coc#refresh()\14<c-space>%<Plug>(coc-snippets-expand-jump)\n<c-j>\bset\vkeymap7coc#pum#visible() ? coc#_select_confirm() : \"<CR>\"\t<CR>3coc#pum#visible() ? coc#pum#prev(1) : \"\\<C-h>\"\f<S-TAB>_coc#pum#visible() ?  (coc#pum#next(1)): v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()\n<TAB>\6i\20nvim_set_keymap\1\0\3\fnoremap\2\texpr\2\vsilent\2\0\21check_back_space\a_G\byes\15signcolumn\15updatetime\bapi\bopt\afn\bvim\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0¯\t\1\0\a\0001\0?6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\19\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0044\5\0\0=\5\b\0045\5\t\0=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0=\6\15\5=\5\16\0043\5\17\0=\5\18\4=\4\20\0035\4\21\0005\5\22\0=\5\23\0045\5\25\0005\6\24\0=\6\26\5=\5\27\0045\5\29\0005\6\28\0=\6\30\5=\5\31\0045\5 \0005\6!\0=\6\"\0055\6#\0=\6\b\0055\6$\0=\6\n\5=\5%\0045\5&\0004\6\0\0=\6\b\0055\6'\0=\6\n\0055\6(\0=\6\5\0055\6)\0=\6\a\0055\6*\0=\6+\0055\6,\0=\6\16\0053\6-\0=\6\18\5=\5.\0044\5\0\0=\5/\4=\0040\3B\1\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\1\0\3\n<C-c>\nClose\n<Esc>\nClose\t<CR>\fConfirm\15min_height\1\3\0\0\3\n\4š³æÌ\t™³¦þ\3\1\3\0\0\3(\4š³æÌ\t™³¦þ\3\1\3\0\0\3Œ\1\4š³æÌ\t™³¦ÿ\3\1\0\1\rwinblend\3\n\1\0\4\vanchor\aNW\15max_height\4Í™³æ\fÌ™³ÿ\3\rrelative\veditor\vborder\frounded\bnui\1\0\1\rwinblend\3\n\1\0\2\rfiletype\19DressingSelect\rswapfile\1\vborder\1\0\1\nstyle\frounded\1\0\6\rposition\b50%\14max_width\3P\15min_height\3\n\14min_width\3(\15max_height\3(\rrelative\veditor\ffzf_lua\fwinopts\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\bfzf\vwindow\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\2\16trim_prompt\2\fenabled\2\ninput\1\0\0\roverride\0\rmappings\6i\1\0\4\t<Up>\16HistoryPrev\n<C-c>\nClose\t<CR>\fConfirm\v<Down>\16HistoryNext\6n\1\0\0\1\0\2\t<CR>\fConfirm\n<Esc>\nClose\16win_options\1\0\2\twrap\1\rwinblend\3\n\16buf_options\14min_width\1\3\0\0\3\20\4š³æÌ\t™³¦þ\3\14max_width\1\3\0\0\3Œ\1\4Í™³æ\fÌ™³ÿ\3\1\0\t\16insert_only\2\vanchor\aSW\20start_in_insert\2\19default_prompt\vInput:\fenabled\2\17prompt_align\tleft\17prefer_width\3(\rrelative\vcursor\vborder\frounded\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  firenvim = {
    config = { "\27LJ\2\n9\0\0\1\0\3\0\0066\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\0€K\0\1\0\24started_by_firenvim\6g\bvim\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n[\0\0\4\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0+\3\2\0B\1\2\1K\0\1\0\19init_highlight\24set_default_keymaps\tleap\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n²\1\0\0\4\0\t\0\0216\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1\15\0\1\0X\2\t€6\1\2\0009\1\5\1'\3\6\0B\1\2\0016\1\2\0009\1\5\1'\3\a\0B\1\2\1X\1\3€9\1\b\0004\3\0\0B\1\2\1K\0\1\0\nsetup\21set laststatus=0\22set showtabline=0\bcmd\24started_by_firenvim\6g\bvim\flualine\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-genghis"] = {
    config = { "\27LJ\2\n­\3\0\0\a\0\23\0/6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1\18\2\1\0'\4\5\0'\5\6\0009\6\a\0B\2\4\1\18\2\1\0'\4\5\0'\5\b\0009\6\t\0B\2\4\1\18\2\1\0'\4\5\0'\5\n\0009\6\v\0B\2\4\1\18\2\1\0'\4\5\0'\5\f\0009\6\r\0B\2\4\1\18\2\1\0'\4\5\0'\5\14\0009\6\15\0B\2\4\1\18\2\1\0'\4\5\0'\5\16\0009\6\17\0B\2\4\1\18\2\1\0'\4\5\0'\5\18\0009\6\19\0B\2\4\1\18\2\1\0'\4\20\0'\5\21\0009\6\22\0B\2\4\1K\0\1\0\27moveSelectionToNewFile\14<leader>x\6x\14trashFile\16<leader>fdd\18duplicateFile\16<leader>fyy\18createNewFile\16<leader>fnn\15renameFile\16<leader>frr\vchmodx\16<leader>fcx\17copyFilename\16<leader>fyn\17copyFilepath\16<leader>fyp\6n\bset\vkeymap\bvim\fgenghis\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/nvim-genghis",
    url = "https://github.com/chrisgrieser/nvim-genghis"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0026\1\2\0=\0\1\1K\0\1\0\bvim\vnotify\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\ne\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1\14\0\1\0X\1\2€9\1\5\0B\1\1\1K\0\1\0\nsetup\24started_by_firenvim\6g\bvim\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\ná\3\0\0\5\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0005\4\v\0=\4\b\3=\3\f\2B\0\2\1K\0\1\0\vindent\1\3\0\0\tyaml\bcpp\1\0\1\venable\2\14highlight\fdisable\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\21ensure_installed\1\0\1\17sync_install\1\1 \0\0\tbash\6c\fc_sharp\ncmake\15commonlisp\bcpp\bcss\15dockerfile\18gitattributes\14gitignore\ago\fhaskell\thtml\tjava\15javascript\tjson\nlatex\blua\tmake\rmarkdown\20markdown_inline\bphp\vpython\tscss\vsvelte\fsxhkdrc\ttoml\15typescript\bvim\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  sonokai = {
    config = { "\27LJ\2\n¦\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0†\2\" Important!!\n    if has('termguicolors')\n      set termguicolors\n    endif\n    \" The configuration options should be placed before `colorscheme sonokai`.\n    let g:sonokai_style = 'andromeda'\n    let g:sonokai_better_performance = 1\n    colorscheme sonokai\bcmd\bvim\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["tabby.nvim"] = {
    config = { "\27LJ\2\nŠ\2\0\1\b\2\r\0+9\1\0\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1\14\0\1\0X\2\2€-\1\0\0009\1\2\0015\2\v\0-\3\1\0009\3\3\3'\5\4\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\1\0029\3\0\0B\3\1\2\15\0\3\0X\4\2€'\3\6\0X\4\1€'\3\a\0>\3\2\0029\3\b\0B\3\1\2>\3\3\0029\3\t\0B\3\1\2>\3\4\2-\3\1\0009\3\3\3'\5\n\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\5\2=\1\f\2L\2\2\0\0\0\0À\ahl\1\0\1\vmargin\6 \bî‚¼\tname\vnumber\tïš¢ \tï†’ \tfill\n î‚º \bsep\btab\16current_tab\15is_currentŽ\2\1\1\b\1\14\1-5\1\r\0004\2\3\0005\3\0\0-\4\0\0009\4\1\4=\4\2\3>\3\1\0029\3\3\0'\5\4\0-\6\0\0009\6\1\6-\a\0\0009\a\5\aB\3\4\0?\3\0\0>\2\1\0019\2\6\0B\2\1\0029\2\a\0023\4\b\0B\2\2\2>\2\2\0019\2\t\0B\2\1\2>\2\3\0014\2\3\0009\3\3\0'\5\n\0-\6\0\0009\6\v\6-\a\0\0009\a\5\aB\3\4\2>\3\1\0025\3\f\0-\4\0\0009\4\v\4=\4\2\3>\3\2\2>\2\4\1-\2\0\0009\2\5\2=\2\2\0012\0\0€L\1\2\0\1À\1\0\0\1\2\0\0\n ïƒ¶ \ttail\tî‚º \vspacer\0\fforeach\ttabs\tfill\bî‚¼\bsep\ahl\thead\1\2\0\0\n îŸ… \5€€À™\4Æ\1\1\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\3\0=\2\4\0019\2\5\0003\4\6\0B\2\2\0012\0\0€K\0\1\0\0\bset\16current_tab\1\0\3\nstyle\vitalic\abg\f#896a98\afg\f#F8FBF6\1\0\5\tfill\16TabLineFill\thead\fTabLine\bwin\fTabLine\ttail\fTabLine\btab\fTabLine\18tabby.tabline\frequire\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/tabby.nvim",
    url = "https://github.com/nanozuki/tabby.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¼\2\0\0\b\0\r\0\0286\0\0\0009\0\1\0005\1\2\0009\2\3\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\0019\2\3\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\0019\2\3\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\0019\2\3\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1K\0\1\0!<cmd>Telescope help_tags<cr>\15<leader>fh\31<cmd>Telescope buffers<cr>\15<leader>fb!<cmd>Telescope live_grep<cr>\15<leader>fg\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\20nvim_set_keymap\1\0\1\fnoremap\2\bapi\bvim\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-latex"] = {
    config = { "\27LJ\2\nº\2\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0X\"\n    nmap <Leader>lb :exec '!biber '.Tex_GetMainFileName(':p:t:r').'.bcf'<CR>\n    ¶\1\"\n    let g:Tex_BibtexFlavor = 'biber'\n    let g:Tex_DefaultTargetFormat = 'pdf'\n    let g:Tex_MultipleCompileFormats = 'pdf,dvi'\n    let g:Tex_CompileRule_bib = 'biber $*'\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-latex",
    url = "https://github.com/vim-latex/vim-latex"
  },
  ["vim-repeat"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-textobj-latex"] = {
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-textobj-latex",
    url = "https://github.com/rbonvall/vim-textobj-latex"
  },
  ["vim-textobj-numeral"] = {
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-textobj-numeral",
    url = "https://github.com/tkhren/vim-textobj-numeral"
  },
  ["vim-textobj-user"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n¡\2\0\0\n\0\16\1\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0019\1\6\0'\3\a\0004\4\3\0009\5\b\0009\a\t\0B\a\1\0029\b\n\0B\b\1\0A\5\1\0?\5\0\0B\1\3\0019\1\6\0'\3\v\0009\4\f\0005\6\14\0009\a\r\0B\a\1\2=\a\15\6B\4\2\0A\1\1\1K\0\1\0\16highlighter\1\0\0\22basic_highlighter\22wildmenu_renderer\rrenderer\20search_pipeline\21cmdline_pipeline\vbranch\rpipeline\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/home/craftidore/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n[\0\0\4\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0+\3\2\0B\1\2\1K\0\1\0\19init_highlight\24set_default_keymaps\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: sonokai
time([[Config for sonokai]], true)
try_loadstring("\27LJ\2\n¦\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0†\2\" Important!!\n    if has('termguicolors')\n      set termguicolors\n    endif\n    \" The configuration options should be placed before `colorscheme sonokai`.\n    let g:sonokai_style = 'andromeda'\n    let g:sonokai_better_performance = 1\n    colorscheme sonokai\bcmd\bvim\0", "config", "sonokai")
time([[Config for sonokai]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n²\1\0\0\4\0\t\0\0216\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1\15\0\1\0X\2\t€6\1\2\0009\1\5\1'\3\6\0B\1\2\0016\1\2\0009\1\5\1'\3\a\0B\1\2\1X\1\3€9\1\b\0004\3\0\0B\1\2\1K\0\1\0\nsetup\21set laststatus=0\22set showtabline=0\bcmd\24started_by_firenvim\6g\bvim\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
try_loadstring("\27LJ\2\nŠ\2\0\1\b\2\r\0+9\1\0\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1\14\0\1\0X\2\2€-\1\0\0009\1\2\0015\2\v\0-\3\1\0009\3\3\3'\5\4\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\1\0029\3\0\0B\3\1\2\15\0\3\0X\4\2€'\3\6\0X\4\1€'\3\a\0>\3\2\0029\3\b\0B\3\1\2>\3\3\0029\3\t\0B\3\1\2>\3\4\2-\3\1\0009\3\3\3'\5\n\0\18\6\1\0-\a\0\0009\a\5\aB\3\4\2>\3\5\2=\1\f\2L\2\2\0\0\0\0À\ahl\1\0\1\vmargin\6 \bî‚¼\tname\vnumber\tïš¢ \tï†’ \tfill\n î‚º \bsep\btab\16current_tab\15is_currentŽ\2\1\1\b\1\14\1-5\1\r\0004\2\3\0005\3\0\0-\4\0\0009\4\1\4=\4\2\3>\3\1\0029\3\3\0'\5\4\0-\6\0\0009\6\1\6-\a\0\0009\a\5\aB\3\4\0?\3\0\0>\2\1\0019\2\6\0B\2\1\0029\2\a\0023\4\b\0B\2\2\2>\2\2\0019\2\t\0B\2\1\2>\2\3\0014\2\3\0009\3\3\0'\5\n\0-\6\0\0009\6\v\6-\a\0\0009\a\5\aB\3\4\2>\3\1\0025\3\f\0-\4\0\0009\4\v\4=\4\2\3>\3\2\2>\2\4\1-\2\0\0009\2\5\2=\2\2\0012\0\0€L\1\2\0\1À\1\0\0\1\2\0\0\n ïƒ¶ \ttail\tî‚º \vspacer\0\fforeach\ttabs\tfill\bî‚¼\bsep\ahl\thead\1\2\0\0\n îŸ… \5€€À™\4Æ\1\1\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\3\0=\2\4\0019\2\5\0003\4\6\0B\2\2\0012\0\0€K\0\1\0\0\bset\16current_tab\1\0\3\nstyle\vitalic\abg\f#896a98\afg\f#F8FBF6\1\0\5\tfill\16TabLineFill\thead\fTabLine\bwin\fTabLine\ttail\fTabLine\btab\fTabLine\18tabby.tabline\frequire\0", "config", "tabby.nvim")
time([[Config for tabby.nvim]], false)
-- Config for: vim-textobj-user
time([[Config for vim-textobj-user]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-textobj-user")
time([[Config for vim-textobj-user]], false)
-- Config for: nvim-genghis
time([[Config for nvim-genghis]], true)
try_loadstring("\27LJ\2\n­\3\0\0\a\0\23\0/6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1\18\2\1\0'\4\5\0'\5\6\0009\6\a\0B\2\4\1\18\2\1\0'\4\5\0'\5\b\0009\6\t\0B\2\4\1\18\2\1\0'\4\5\0'\5\n\0009\6\v\0B\2\4\1\18\2\1\0'\4\5\0'\5\f\0009\6\r\0B\2\4\1\18\2\1\0'\4\5\0'\5\14\0009\6\15\0B\2\4\1\18\2\1\0'\4\5\0'\5\16\0009\6\17\0B\2\4\1\18\2\1\0'\4\5\0'\5\18\0009\6\19\0B\2\4\1\18\2\1\0'\4\20\0'\5\21\0009\6\22\0B\2\4\1K\0\1\0\27moveSelectionToNewFile\14<leader>x\6x\14trashFile\16<leader>fdd\18duplicateFile\16<leader>fyy\18createNewFile\16<leader>fnn\15renameFile\16<leader>frr\vchmodx\16<leader>fcx\17copyFilename\16<leader>fyn\17copyFilepath\16<leader>fyp\6n\bset\vkeymap\bvim\fgenghis\frequire\0", "config", "nvim-genghis")
time([[Config for nvim-genghis]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¼\2\0\0\b\0\r\0\0286\0\0\0009\0\1\0005\1\2\0009\2\3\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\0019\2\3\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\0019\2\3\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\0019\2\3\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1K\0\1\0!<cmd>Telescope help_tags<cr>\15<leader>fh\31<cmd>Telescope buffers<cr>\15<leader>fb!<cmd>Telescope live_grep<cr>\15<leader>fg\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\20nvim_set_keymap\1\0\1\fnoremap\2\bapi\bvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0026\1\2\0=\0\1\1K\0\1\0\bvim\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: vim-commentary
time([[Config for vim-commentary]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-commentary")
time([[Config for vim-commentary]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nŠ\1\0\0\6\1\6\2\25-\0\0\0009\0\0\0'\2\1\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16€-\1\0\0009\1\2\1'\3\1\0B\1\2\2\18\3\1\0009\1\3\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\4\1'\4\5\0B\1\3\2X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\0À\a%s\nmatch\bsub\fgetline\6.\bcol\2\0»\2\0\0\a\2\17\0+-\0\0\0009\0\0\0'\2\1\0B\0\2\2-\1\0\0009\1\2\0015\3\3\0006\4\4\0009\4\5\0049\4\6\4B\1\3\2)\2\0\0\3\2\1\0X\1\a€-\1\1\0009\1\a\1'\3\b\0\18\4\0\0&\3\4\3B\1\2\1X\1\21€-\1\1\0009\1\t\1'\3\n\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\v\1'\3\f\0B\1\2\1X\1\n€-\1\1\0009\1\a\1'\3\r\0006\4\4\0009\4\14\0049\4\15\4'\5\16\0\18\6\0\0&\3\6\3B\1\2\1K\0\1\0\0À\2À\6 \15keywordprg\6o\6!\fdoHover\19CocActionAsync\20coc#rpc#ready()\14nvim_eval\ah \17nvim_command\rfiletype\abo\bvim\1\3\0\0\bvim\thelp\nindex\f<cword>\vexpand®\t\1\0\v\0007\0i6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\0\0009\2\3\2)\3,\1=\3\4\1'\3\6\0=\3\5\0016\3\a\0003\4\t\0=\4\b\0035\3\n\0009\4\v\2'\6\f\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\0019\4\v\2'\6\f\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\0019\4\v\2'\6\f\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\0016\4\0\0009\4\19\0049\4\20\4\18\5\4\0'\a\f\0'\b\21\0'\t\22\0B\5\4\1\18\5\4\0'\a\f\0'\b\23\0'\t\24\0005\n\25\0B\5\5\1\18\5\4\0'\a\26\0'\b\27\0'\t\28\0005\n\29\0B\5\5\1\18\5\4\0'\a\26\0'\b\30\0'\t\31\0005\n \0B\5\5\1\18\5\4\0'\a\26\0'\b!\0'\t\"\0005\n#\0B\5\5\1\18\5\4\0'\a\26\0'\b$\0'\t%\0005\n&\0B\5\5\1\18\5\4\0'\a\26\0'\b'\0'\t(\0005\n)\0B\5\5\1\18\5\4\0'\a\26\0'\b*\0'\t+\0005\n,\0B\5\5\0016\5\a\0003\6.\0=\6-\5\18\5\4\0'\a\26\0'\b/\0'\t0\0005\n1\0B\5\5\1\18\5\4\0'\a2\0'\b3\0'\t4\0005\n5\0B\5\5\1\18\5\4\0'\a\26\0'\b3\0'\t4\0005\n6\0B\5\5\0012\0\0€K\0\1\0\1\0\1\vsilent\2\1\0\1\vsilent\2 <Plug>(coc-format-selected)\14<leader>h\6x\1\0\1\vsilent\2 <CMD>lua _G.show_docs()<CR>\15<leader>gk\0\14show_docs\1\0\1\vsilent\2\27<Plug>(coc-references)\agr\1\0\1\vsilent\2\31<Plug>(coc-implementation)\agi\1\0\1\vsilent\2 <Plug>(coc-type-definition)\agy\1\0\1\vsilent\2\27<Plug>(coc-definition)\agd\1\0\1\vsilent\2 <Plug>(coc-diagnostic-next)\a]g\1\0\1\vsilent\2 <Plug>(coc-diagnostic-prev)\a[g\6n\1\0\2\texpr\2\vsilent\2\18coc#refresh()\14<c-space>%<Plug>(coc-snippets-expand-jump)\n<c-j>\bset\vkeymap7coc#pum#visible() ? coc#_select_confirm() : \"<CR>\"\t<CR>3coc#pum#visible() ? coc#pum#prev(1) : \"\\<C-h>\"\f<S-TAB>_coc#pum#visible() ?  (coc#pum#next(1)): v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()\n<TAB>\6i\20nvim_set_keymap\1\0\3\fnoremap\2\texpr\2\vsilent\2\0\21check_back_space\a_G\byes\15signcolumn\15updatetime\bapi\bopt\afn\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: vim-latex
time([[Config for vim-latex]], true)
try_loadstring("\27LJ\2\nº\2\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0X\"\n    nmap <Leader>lb :exec '!biber '.Tex_GetMainFileName(':p:t:r').'.bcf'<CR>\n    ¶\1\"\n    let g:Tex_BibtexFlavor = 'biber'\n    let g:Tex_DefaultTargetFormat = 'pdf'\n    let g:Tex_MultipleCompileFormats = 'pdf,dvi'\n    let g:Tex_CompileRule_bib = 'biber $*'\n    \bcmd\bvim\0", "config", "vim-latex")
time([[Config for vim-latex]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0¯\t\1\0\a\0001\0?6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\19\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0044\5\0\0=\5\b\0045\5\t\0=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0=\6\15\5=\5\16\0043\5\17\0=\5\18\4=\4\20\0035\4\21\0005\5\22\0=\5\23\0045\5\25\0005\6\24\0=\6\26\5=\5\27\0045\5\29\0005\6\28\0=\6\30\5=\5\31\0045\5 \0005\6!\0=\6\"\0055\6#\0=\6\b\0055\6$\0=\6\n\5=\5%\0045\5&\0004\6\0\0=\6\b\0055\6'\0=\6\n\0055\6(\0=\6\5\0055\6)\0=\6\a\0055\6*\0=\6+\0055\6,\0=\6\16\0053\6-\0=\6\18\5=\5.\0044\5\0\0=\5/\4=\0040\3B\1\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\1\0\3\n<C-c>\nClose\n<Esc>\nClose\t<CR>\fConfirm\15min_height\1\3\0\0\3\n\4š³æÌ\t™³¦þ\3\1\3\0\0\3(\4š³æÌ\t™³¦þ\3\1\3\0\0\3Œ\1\4š³æÌ\t™³¦ÿ\3\1\0\1\rwinblend\3\n\1\0\4\vanchor\aNW\15max_height\4Í™³æ\fÌ™³ÿ\3\rrelative\veditor\vborder\frounded\bnui\1\0\1\rwinblend\3\n\1\0\2\rfiletype\19DressingSelect\rswapfile\1\vborder\1\0\1\nstyle\frounded\1\0\6\rposition\b50%\14max_width\3P\15min_height\3\n\14min_width\3(\15max_height\3(\rrelative\veditor\ffzf_lua\fwinopts\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\bfzf\vwindow\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\2\16trim_prompt\2\fenabled\2\ninput\1\0\0\roverride\0\rmappings\6i\1\0\4\t<Up>\16HistoryPrev\n<C-c>\nClose\t<CR>\fConfirm\v<Down>\16HistoryNext\6n\1\0\0\1\0\2\t<CR>\fConfirm\n<Esc>\nClose\16win_options\1\0\2\twrap\1\rwinblend\3\n\16buf_options\14min_width\1\3\0\0\3\20\4š³æÌ\t™³¦þ\3\14max_width\1\3\0\0\3Œ\1\4Í™³æ\fÌ™³ÿ\3\1\0\t\16insert_only\2\vanchor\aSW\20start_in_insert\2\19default_prompt\vInput:\fenabled\2\17prompt_align\tleft\17prefer_width\3(\rrelative\vcursor\vborder\frounded\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\ná\3\0\0\5\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0005\4\v\0=\4\b\3=\3\f\2B\0\2\1K\0\1\0\vindent\1\3\0\0\tyaml\bcpp\1\0\1\venable\2\14highlight\fdisable\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\21ensure_installed\1\0\1\17sync_install\1\1 \0\0\tbash\6c\fc_sharp\ncmake\15commonlisp\bcpp\bcss\15dockerfile\18gitattributes\14gitignore\ago\fhaskell\thtml\tjava\15javascript\tjson\nlatex\blua\tmake\rmarkdown\20markdown_inline\bphp\vpython\tscss\vsvelte\fsxhkdrc\ttoml\15typescript\bvim\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\ne\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1\14\0\1\0X\1\2€9\1\5\0B\1\1\1K\0\1\0\nsetup\24started_by_firenvim\6g\bvim\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-repeat
time([[Config for vim-repeat]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-repeat")
time([[Config for vim-repeat]], false)
-- Config for: firenvim
time([[Config for firenvim]], true)
try_loadstring("\27LJ\2\n9\0\0\1\0\3\0\0066\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\0€K\0\1\0\24started_by_firenvim\6g\bvim\0", "config", "firenvim")
time([[Config for firenvim]], false)
-- Config for: CamelCaseMotion
time([[Config for CamelCaseMotion]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0+let g:camelcasemotion_key = '<leader>'\bcmd\bvim\0", "config", "CamelCaseMotion")
time([[Config for CamelCaseMotion]], false)
-- Config for: vim-sandwich
time([[Config for vim-sandwich]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-sandwich")
time([[Config for vim-sandwich]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n¡\2\0\0\n\0\16\1\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0019\1\6\0'\3\a\0004\4\3\0009\5\b\0009\a\t\0B\a\1\0029\b\n\0B\b\1\0A\5\1\0?\5\0\0B\1\3\0019\1\6\0'\3\v\0009\4\f\0005\6\14\0009\a\r\0B\a\1\2=\a\15\6B\4\2\0A\1\1\1K\0\1\0\16highlighter\1\0\0\22basic_highlighter\22wildmenu_renderer\rrenderer\20search_pipeline\21cmdline_pipeline\vbranch\rpipeline\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\3€€À™\4\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: vim-signature
time([[Config for vim-signature]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-signature")
time([[Config for vim-signature]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
