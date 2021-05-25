require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb'}
  -- Set any other options as needed
})

-- easing1: f(x) = x^2
local easing1 = [[function(x) return math.pow(x, 2) end]]
-- easing2: f(x) = x^4
local easing2 = [[function(x) return math.pow(x, 4) end]]

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use easing1 function from 7 ms to 15 ms time-step
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '7', '15', easing1}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '7', '15', easing1}}
-- Use easing2 function from 5 ms to 20 ms time-step
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '5', '20', easing2}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '5', '20', easing2}}
-- Use the default easing function defined in easing_function from 20 ms to 30 ms time-step
t['<C-y>'] = {'scroll', {'-0.10', 'false', '20', '30'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '20', '30'}}
-- Use a constant time-step of 7 ms
t['zt']    = {'zt', {'7'}}
t['zz']    = {'zz', {'7'}}
t['zb']    = {'zb', {'7'}}

require('neoscroll.config').set_mappings(t)
