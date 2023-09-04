vim.keymap.set('n', '<leader>rf', function()
    if os.getenv("REDIS_MASTER_HOST") == nil
        then
            vim.cmd(':e! keys | :read ! docker exec -t redis-master-tugbot_24081-movai bash -c "redis-cli KEYS *Callback*"')
        else
            vim.cmd("DB redis://$REDIS_MASTER_HOST:$REDIS_MASTER_PORT KEYS *Callback*" )

        end
    end, {desc = "[R]edis [F]ind Callback"})
vim.keymap.set('n', '<leader>rc', function()
    local callback = vim.fn.input("Get callback: ")
    if os.getenv("REDIS_MASTER_HOST") == nil
        then
            vim.cmd(':e! test.py | :read ! docker exec -t redis-master-tugbot_24081-movai bash -c "redis-cli GET Callback:' .. callback .. ',Code:"')
        else
            vim.cmd("DB redis://$REDIS_MASTER_HOST:$REDIS_MASTER_PORT GET Callback:" .. callback .. ",Code:")
            vim.cmd("wincmd j")
        end
        vim.cmd("set filetype=python")
    end, {desc = "[R]edis [C]allback"})
