-- cht.sh integration for nvim 

print(vim.bo.filetype=="go")
local Job = require('plenary.job')
local popup = require('plenary.popup')

local function get_cheatsh(query)
  local result = {}
  local args = {vim.bo.filetype, query}
  local job = Job:new {
    command = "cht.sh",
    args = args,
    -- env = { ["TERM"] = "xterm-mono" },
    on_stdout = function(_, line)
      vim.inspect.inspect(line)
      table.insert(result, line)
    end
  }

  job:sync()
  -- print(vim.inspect.inspect(job:result()))

  return result
end

local x = get_cheatsh("append slice")
popup.create(x, {
  line= 8,
  col=55,
  padding = { 0, 3, 0, 3 },
  borderchars = "="
})
for i, v in ipairs(x) do
  print(x)
end
