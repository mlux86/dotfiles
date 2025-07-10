-- vim: fdm=marker
return {
    { -- {{{ plenary.vim
        "nvim-lua/plenary.nvim"
    }, -- }}}
    { -- {{{ telescope.nvim
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')
            local smart_find_files = require('utils.smart_find_files')
            
            -- Configure telescope
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { "%.git/" }
                }
            })

            -- Key mappings
            vim.keymap.set('n', '<leader>f', smart_find_files, { desc = "Find Files (smart root)" })
            vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set('n', '<leader>r', builtin.oldfiles, { desc = "Recent Files" })
            vim.keymap.set('n', '<leader>b', function()
                builtin.buffers({
                    sort_mru = true,
                    ignore_current_buffer = true
                })
            end, { desc = "Buffer List" })
            
            -- Notes
            vim.keymap.set('n', '<leader>n', function()
                builtin.find_files({ cwd = "~/Desktop/notes" })
            end)
            
            vim.keymap.set('n', '<leader>N', function()
                local input = vim.fn.input("New note name: ")
                if input == "" then return end
                local filepath = vim.fn.expand("~/Desktop/notes/" .. input .. ".txt")
                vim.cmd("edit " .. filepath)
            end, { desc = "Create new note in ~/Desktop/notes" })
        end
    }, -- }}}
    { -- {{{ nvim-surround
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }, -- }}}
    { -- {{{ github/copilot.vim
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('i', '<M-CR>', 'copilot#Accept("")', {
                expr = true,
                replace_keycodes = false
            })
        end
    } -- }}}
}
