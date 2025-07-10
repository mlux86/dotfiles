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

    builtin.find_files({ cwd = find_root(), hidden = true })
end

return smart_find_files
