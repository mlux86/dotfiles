-- vim: fdm=marker
return {
    { -- {{{ plenary.vim
        "nvim-lua/plenary.nvim"
    }, -- }}}
    { -- {{{ telescope.nvim
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local Path = require('plenary.path')
            local builtin = require('telescope.builtin')

            local function smart_find_files()
                local cwd = vim.fn.expand('%:p:h')
                local path = Path:new(cwd)

                local function is_root(p)
                    return p:joinpath('.git'):is_dir() or p:joinpath('.ROOT'):is_file()
                end

                local function find_root()
                    while true do
                        if is_root(path) then
                            return path:absolute()
                        end
                        local parent = path:parent()
                        if parent:absolute() == path:absolute() then
                            return cwd
                        end
                        path = parent
                    end
                end

                builtin.find_files({ cwd = find_root() })
            end

            -- Telescope default setup (optional)
            require('telescope').setup({
                defaults = {
                    -- You can customize layout, sorting, previewers, etc. here
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
    } -- }}}
}
