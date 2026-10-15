---@diagnostic disable: undefined-global

---@class HighlightOpt
---@field style string
---@field link? string if defined, everything else is ignored
---@field guifg string
---@field guibg string
---@field guisp string
---@field ctermfg string
---@field ctermbg string

---@class Quick
---@field command fun(name: string, command: string|function, opts?: table) Creates a command from provided specifics.
---@field normal fun(mode: string, motion: string, special: boolean?) Executes a command in normal mode.
---@field selection_contents fun(): string Returns the contents of the visually selected region.
---@field buffer_command fun(name: string, command: string|function, opts?: table) Creates a command from provided specifics on current buffer.
---@field call_and_centre fun(fn: fun()) Pushes the current location to the jumplist and calls the fn callback, then centres the cursor.
---@field highlight fun(group: string, opt: HighlightOpt) --Create a highlight group.

local mappings = _t({ --{{{
  { group = "MatchingAA", color = "#FF6188" },
  { group = "MatchingAB", color = "#A9DC76" },
  { group = "MatchingAC", color = "#78DCE8" },
  { group = "MatchingAD", color = "#FFD866" },
  { group = "MatchingAE", color = "#FC9867" },
  { group = "MatchingAF", color = "#AB9DF2" },
  { group = "MatchingAG", color = "darkred" },
  { group = "MatchingAH", color = "#FD6883" },
  { group = "MatchingAI", color = "#1981F0" },
  { group = "MatchingAJ", color = "#6EABEC" },
  { group = "MatchingAK", color = "#9261E2" },
  { group = "MatchingAL", color = "#E261AB" },
  { group = "MatchingAM", color = "#B7FC4F" },
  { group = "MatchingAN", color = "#4FD9FC" },
  { group = "MatchingAO", color = "#F9D9B7" },
  { group = "MatchingAP", color = "#F9B7F9" },
  { group = "MatchingAQ", color = "#006400" },
  { group = "MatchingAR", color = "#008000" },
  { group = "MatchingAS", color = "#008080" },
  { group = "MatchingAT", color = "#008B8B" },
  { group = "MatchingAU", color = "#00BFFF" },
  { group = "MatchingAV", color = "#00CED1" },
  { group = "MatchingAW", color = "#00FA9A" },
  { group = "MatchingAX", color = "#00FF00" },
  { group = "MatchingAY", color = "#00FF7F" },
  { group = "MatchingAZ", color = "#00FFFF" },
  { group = "MatchingBA", color = "#1E90FF" },
  { group = "MatchingBB", color = "#20B2AA" },
  { group = "MatchingBC", color = "#228B22" },
  { group = "MatchingBD", color = "#2E8B57" },
  { group = "MatchingBE", color = "#2F4F4F" },
  { group = "MatchingBF", color = "#32CD32" },
  { group = "MatchingBG", color = "#3CB371" },
  { group = "MatchingBH", color = "#40E0D0" },
  { group = "MatchingBI", color = "#4169E1" },
  { group = "MatchingBJ", color = "#4682B4" },
  { group = "MatchingBK", color = "#483D8B" },
  { group = "MatchingBL", color = "#48D1CC" },
  { group = "MatchingBM", color = "#4B0082" },
  { group = "MatchingBN", color = "#556B2F" },
  { group = "MatchingBO", color = "#5F9EA0" },
  { group = "MatchingBP", color = "#6495ED" },
  { group = "MatchingBQ", color = "#66CDAA" },
  { group = "MatchingBR", color = "#696969" },
  { group = "MatchingBS", color = "#6A5ACD" },
  { group = "MatchingBT", color = "#6B8E23" },
  { group = "MatchingBU", color = "#708090" },
  { group = "MatchingBV", color = "#778899" },
  { group = "MatchingBW", color = "#7B68EE" },
  { group = "MatchingBX", color = "#87CEFA" },
  { group = "MatchingBY", color = "#87CEEB" },
  { group = "MatchingBZ", color = "#00BFFF" },
  { group = "MatchingCA", color = "#2F4F4F" },
  { group = "MatchingCB", color = "#48D1CC" },
  { group = "MatchingCC", color = "#20B2AA" },
  { group = "MatchingCD", color = "#5F9EA0" },
  { group = "MatchingCE", color = "#008B8B" },
  { group = "MatchingCF", color = "#008080" },
  { group = "MatchingCG", color = "#7FFFD4" },
  { group = "MatchingCH", color = "#90EE90" },
  { group = "MatchingCI", color = "#98FB98" },
  { group = "MatchingCJ", color = "#8FBC8F" },
  { group = "MatchingCK", color = "#7CFC00" },
  { group = "MatchingCL", color = "#7FFF00" },
  { group = "MatchingCM", color = "#ADFF2F" },
  { group = "MatchingCN", color = "#00FF7F" },
  { group = "MatchingCO", color = "#00FA9A" },
  { group = "MatchingCP", color = "#32CD32" },
  { group = "MatchingCQ", color = "#9ACD32" },
  { group = "MatchingCR", color = "#808000" },
  { group = "MatchingCS", color = "#556B2F" },
  { group = "MatchingCT", color = "#7FFF00" },
  { group = "MatchingCU", color = "#ADFF2F" },
  { group = "MatchingCV", color = "#00FF7F" },
  { group = "MatchingCW", color = "#00FA9A" },
  { group = "MatchingCX", color = "#32CD32" },
  { group = "MatchingCY", color = "#9ACD32" },
  { group = "MatchingCZ", color = "#808000" },
  { group = "MatchingDA", color = "#556B2F" },
  { group = "MatchingDB", color = "#7FFF00" },
  { group = "MatchingDC", color = "#ADFF2F" },
  { group = "MatchingDD", color = "#00FF7F" },
  { group = "MatchingDE", color = "#00FA9A" },
  { group = "MatchingDF", color = "#32CD32" },
  { group = "MatchingDG", color = "#9ACD32" },
  { group = "MatchingDH", color = "#808000" },
  { group = "MatchingDI", color = "#556B2F" },
  { group = "MatchingDJ", color = "#7FFF00" },
}):shuffle() --}}}

---@type Quick
local quick = require("arshlib.quick")

for _, mapping in pairs(mappings) do --{{{
  vim.api.nvim_set_hl(0, mapping["group"], {
    fg = "#232627",
    bg = mapping["color"],
    bold = true,
  })
end --}}}

local last_group = 0
local function next_group() --{{{
  last_group = last_group + 1
  if last_group > #mappings then
    last_group = 1
  end
  return mappings[last_group]["group"]
end --}}}

local function matchadd_all_windows(group, term) --{{{
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_call(win, function()
        vim.fn.matchadd(group, term)
      end)
    end
  end
end --}}}

local function matching_groups() --{{{
  local groups = _t()
  mappings:map(function(v)
    groups[v.group] = v.color
  end)
  return groups
end --}}}

local function matchdelete_current_window(groups) --{{{
  _t(vim.fn.getmatches())
    :filter(function(v)
      return v and groups[v.group]
    end)
    :map(function(v)
      vim.fn.matchdelete(v.id)
    end)
end --}}}

local function matchdelete_all_windows(groups) --{{{
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_call(win, function()
        matchdelete_current_window(groups)
      end)
    end
  end
end --}}}

-- selene: allow(global_usage)
function _G.add_match_partial() --{{{
  local term = vim.fn.expand("<cword>")
  vim.fn.matchadd(next_group(), term)
end --}}}

-- selene: allow(global_usage)
function _G.add_match_partial_all_windows() --{{{
  local term = vim.fn.expand("<cword>")
  matchadd_all_windows(next_group(), term)
end --}}}

-- selene: allow(global_usage)
function _G.add_match_exact() --{{{
  local term = vim.fn.expand("<cword>")
  term = "\\<" .. term .. "\\>"
  vim.fn.matchadd(next_group(), term)
end --}}}

-- selene: allow(global_usage)
function _G.add_match_exact_all_windows() --{{{
  local term = vim.fn.expand("<cword>")
  term = "\\<" .. term .. "\\>"
  matchadd_all_windows(next_group(), term)
end --}}}

local function add_match_visual() --{{{
  local term = quick.selection_contents()
  term = term:gsub("\n", "\\_.")
  vim.fn.matchadd(next_group(), term)
end --}}}

local function add_match_visual_all_windows() --{{{
  local term = quick.selection_contents()
  term = term:gsub("\n", "\\_.")
  matchadd_all_windows(next_group(), term)
end --}}}

-- selene: allow(global_usage)
function _G.add_match_line() --{{{
  local term = "\\%" .. vim.fn.line(".") .. "l"
  vim.fn.matchadd(next_group(), term)
end --}}}

-- stylua: ignore start
local defaults = { --{{{
  add                 = "<leader>ma",
  add_all_windows     = "<leader>mA",
  exact               = "<leader>me",
  exact_all_windows   = "<leader>mE",
  pattern             = "<leader>mp",
  pattern_all_windows = "<leader>mP",
  line                = "<leader>ml",
  clear               = "<leader>mc",
  clear_all_windows   = "<leader>mC",
  delete              = "<leader>md",
  delete_all_windows  = "<leader>mD",
} --}}}

local function setup(opts)
  opts = vim.tbl_extend("force", defaults, opts or {})
  local strings = { "string", "nil", "boolean" }
  vim.validate({ --{{{
    opts                = { opts,                     "table" },
    add                 = { opts.add,                 strings },
    add_all_windows     = { opts.add_all_windows,     strings },
    exact               = { opts.exact,               strings },
    exact_all_windows   = { opts.exact_all_windows,   strings },
    pattern             = { opts.pattern,             strings },
    pattern_all_windows = { opts.pattern_all_windows, strings },
    line                = { opts.line,                strings },
    clear               = { opts.clear,               strings },
    clear_all_windows   = { opts.clear_all_windows,   strings },
    delete              = { opts.delete,              strings },
    delete_all_windows  = { opts.delete_all_windows,  strings },
  }) --}}}

  if opts.add then --{{{
    local desc = "Add any matches containing a word under the cursor"
    vim.keymap.set("n", opts.add, function()
      vim.opt.opfunc = "v:lua.add_match_partial"
      return "g@<cr>"
    end, { expr = true, desc = desc })
  end --}}}

  if opts.add_all_windows then --{{{
    local desc = "Add any matches containing a word under the cursor in every opened window"
    vim.keymap.set("n", opts.add_all_windows, function()
      vim.opt.opfunc = "v:lua.add_match_partial_all_windows"
      return "g@<cr>"
    end, { expr = true, desc = desc })
  end --}}}

  if opts.exact then --{{{
    local desc = "Add any exact matches containing a word under the cursor"
    vim.keymap.set("n", opts.exact, function()
      vim.opt.opfunc = "v:lua.add_match_exact"
      return "g@<cr>"
    end, { expr = true, desc = desc })
    vim.keymap.set("x", opts.exact, add_match_visual, {  desc = desc })
  end --}}}

  if opts.exact_all_windows then --{{{
    local desc = "Add exact matches in every opened window"
    vim.keymap.set("n", opts.exact_all_windows, function()
      vim.opt.opfunc = "v:lua.add_match_exact_all_windows"
      return "g@<cr>"
    end, { expr = true, desc = desc })
    vim.keymap.set("x", opts.exact_all_windows, add_match_visual_all_windows, { desc = desc })
  end --}}}

  if opts.pattern then --{{{
    vim.keymap.set("n", opts.pattern, function()
      vim.ui.input({
        prompt = "Pattern: ",
      }, function(term)
          if term then
            vim.fn.matchadd(next_group(), term)
          end
         end
      )
    end, { desc = "Add any matches containing the input from user" })
  end --}}}

  if opts.pattern_all_windows then --{{{
    vim.keymap.set("n", opts.pattern_all_windows, function()
      vim.ui.input({
        prompt = "Pattern: ",
      }, function(term)
          if term then
            matchadd_all_windows(next_group(), term)
          end
         end
      )
    end, { desc = "Add any matches containing the input from user in every opened window" })
  end --}}}

  if opts.line then --{{{
    local desc = "Add current line"
    vim.keymap.set("n", opts.line, function()
      vim.opt.opfunc = "v:lua.add_match_line"
      return "g@<cr>"
    end, { expr = true, desc = desc })
  end --}}}

  if opts.clear then --{{{
    vim.keymap.set("n", opts.clear, function()
      matchdelete_current_window(matching_groups())
    end, { desc = "Clear all matches of the current window" })
  end --}}}

  if opts.clear_all_windows then --{{{
    vim.keymap.set("n", opts.clear_all_windows, function()
      matchdelete_all_windows(matching_groups())
    end, { desc = "Clear all matches in every opened window" })
  end --}}}

  if opts.delete then --{{{
    vim.keymap.set("n", opts.delete, function()
      local source = _t()
      local groups = matching_groups()

      _t(vim.fn.getmatches())
        :filter(function(v)
          return v and groups[v.group]
        end)
        :sort(function(a, b)
          return a.id > b.id
        end)
        :map(function(v)
          local str = string.format("%2d\t%50s\t%20s", v.id, v.pattern, groups[v.group])
          table.insert(source, str)
        end)

      if #source == 0 then
        return
      end

      local wrap = vim.fn["fzf#wrap"]({
        source = source,
        options = table.concat({
          "--multi",
          "--bind",
          "ctrl-a:select-all+accept ",
          "--layout reverse-list",
          '--delimiter="\t"',
          "--with-nth=2..",
        }, " "),
      })
      wrap["sink*"] = function(list)
        for _, name in pairs(list) do
          local id = string.match(name, "^%s*(%d+)")
          if id ~= nil then
            vim.fn.matchdelete(id)
          end
        end
      end
      vim.fn["fzf#run"](wrap)
    end, { desc = "List all matches and remove by user's selection" })
  end --}}}

  if opts.delete_all_windows then --{{{
    vim.keymap.set("n", opts.delete_all_windows, function()
      local source = _t()
      local groups = matching_groups()

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_is_valid(win) then
          local tab = vim.api.nvim_win_get_tabpage(win)
          local tabnr = vim.api.nvim_tabpage_get_number(tab)
          local winnr = vim.api.nvim_win_get_number(win)
          vim.api.nvim_win_call(win, function()
            _t(vim.fn.getmatches())
              :filter(function(v)
                return v and groups[v.group]
              end)
              :sort(function(a, b)
                return a.id > b.id
              end)
              :map(function(v)
                local str = string.format(
                  "%d\t%2d\ttab %d win %d\t%50s\t%20s",
                  win,
                  v.id,
                  tabnr,
                  winnr,
                  v.pattern,
                  groups[v.group]
                )
                table.insert(source, str)
              end)
          end)
        end
      end

      if #source == 0 then
        return
      end

      local wrap = vim.fn["fzf#wrap"]({
        source = source,
        options = table.concat({
          "--multi",
          "--bind",
          "ctrl-a:select-all+accept ",
          "--layout reverse-list",
          '--delimiter="\t"',
          "--with-nth=3..",
        }, " "),
      })
      wrap["sink*"] = function(list)
        for _, name in pairs(list) do
          local win, id = string.match(name, "^%s*(%d+)\t%s*(%d+)")
          win = tonumber(win)
          id = tonumber(id)
          if win ~= nil and id ~= nil and vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_call(win, function()
              pcall(vim.fn.matchdelete, id)
            end)
          end
        end
      end
      vim.fn["fzf#run"](wrap)
    end, { desc = "List matches from every opened window and remove by user's selection" })
  end --}}}
end

return {
  setup = setup,
  config = setup,
}
-- stylua: ignore end

-- vim: fdm=marker fdl=0
