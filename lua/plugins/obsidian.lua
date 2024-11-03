return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        -- Add `note_id_func` to use title as filename
        note_id_func = function(title)
            -- Use the title for the filename (lowercase, with underscores instead of spaces)
            return title and title:gsub(" ", "_"):lower() or tostring(os.time())
        end,
        workspaces = {
            {
                name = "obsidian",
                path = "~/Documents/obsedian",
            },
        },

        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },

        ---@param url string
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            -- vim.fn.jobstart({ "open", url }) -- Mac OS
            -- vim.fn.jobstart({"xdg-open", url})  -- linux
            -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
            vim.ui.open(url) -- need Neovim 0.10.0+
        end,
    },
}
