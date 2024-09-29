return {
    {
        'mbbill/undotree',
        config = function()
            -- Set up any specific settings for undotree here if needed

            -- Keybindings for opening undotree
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    }
}

