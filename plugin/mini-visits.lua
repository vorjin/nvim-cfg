local visits = require("mini.visits")
local MiniExtra = require("mini.extra")

vim.keymap.set('n', '<Leader>vv', function() visits.add_label('core') end, { desc = 'Pin core' })
vim.keymap.set('n', '<Leader>vV', function() visits.remove_label('core') end, { desc = 'Unpin core' })
vim.keymap.set('n', '<Leader>vl', function() MiniExtra.pickers.visit_paths({ filter = 'core' }) end,
    { desc = 'Pick core' })
vim.keymap.set('n', '<Leader>vL', function() MiniExtra.pickers.visit_labels() end,
    { desc = 'Pick label' })

local core_nth = function(n)
    return function()
        local paths = visits.list_paths(nil, { filter = 'core' })
        table.sort(paths)
        if paths[n] then vim.cmd.edit(vim.fn.fnameescape(paths[n])) end
    end
end

for i = 1, 4 do
    vim.keymap.set('n', '<Leader>' .. i, core_nth(i), { desc = 'Core file ' .. i })
end
