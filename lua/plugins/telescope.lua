return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {'nvim-lua/plenary.nvim', {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = "make"
    }, "nvim-tree/nvim-web-devicons"},
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = {"truncate "},
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                    }
                },
                -- configure to use ripgrep
                vimgrep_arguments = {"rg", "--follow", -- Follow symbolic links
                "--hidden", -- Search for hidden files
                "--no-heading", -- Don't group matches by each file
                "--with-filename", -- Print the file path with the matched lines
                "--line-number", -- Show line numbers
                "--column", -- Show column numbers
                "--smart-case", -- Smart case search
                -- Exclude some patterns from search
                "--glob=!**/.git/*", "--glob=!**/.idea/*", "--glob=!**/.vscode/*", "--glob=!**/build/*",
                                     "--glob=!**/dist/*", "--glob=!**/yarn.lock", "--glob=!**/package-lock.json"}
            },
            pickers = {
                find_files = {
                    hidden = true,
                    -- needed to exclude some files & dirs from general search
                    -- when not included or specified in .gitignore
                    find_command = {"rg", "--files", "--hidden", "--glob=!**/.git/*", "--glob=!**/.idea/*",
                                    "--glob=!**/.vscode/*", "--glob=!**/build/*", "--glob=!**/dist/*",
                                    "--glob=!**/yarn.lock", "--glob=!**/package-lock.json"}

                }

            }
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files <cr>", {
            desc = "Fuzz find files in cwd"
        })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {
            desc = "Fuzzy find recent files"
        })
        keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", {
            desc = "Find string in cwd"
        })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {
            desc = "Find string under cursor in cwd"
        })
    end

}
