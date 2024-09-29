return {
    {
        'tpope/vim-fugitive',
        config = function()
            -- Keybindings for some common Git commands using Fugitive
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)  -- Git status
        end
    }
}

