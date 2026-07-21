vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (:PackAdd user/repo1 user/repo2)" })

vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
    -- check if any agrument is passed
    if opts.args:match("%S") then
        -- upd specific plugins
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
        -- upd only specified plugins
        vim.pack.update(plugins)
    else
        -- upd all
        vim.pack.update()
    end
end, { nargs = "*", desc = "Update all plugins or specified ones" })

vim.api.nvim_create_user_command("PackCheck", function()
    local non_active = vim.iter(vim.pack.get())
    :filter(function(x) return not x.active end)
    :map(function(x) return x.spec.name end)
    :totable()

    if #non_active == 0 then
        vim.notify("OK No non-active plugins found!", vim.log.levels.INFO)
    end
end, { nargs = "*", desc = "Check non-active plugins" })
