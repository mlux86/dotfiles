-- vim: fdm=marker

-- {{{ gui
if vim.g.neovide then
    vim.o.guifont = "Monaco:h16"
    vim.g.neovide_theme = 'light'
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0
end
-- }}}

-- {{{ general
vim.g.mapleader = ","
vim.g.maplocalleader = ",,"
vim.opt.clipboard = "unnamedplus"

vim.opt.startofline = false
vim.opt.modeline = true
vim.opt.shortmess:append("I")
vim.opt.autoindent = true
vim.opt.showcmd = false
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.wildmode = { "list", "longest" }
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.number = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.tags = { "~/.tags" }
vim.opt.sessionoptions:remove({ "options", "folds" })
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
-- }}}

-- {{{ tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- }}}

-- {{{ searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.keymap.set("n", "<leader><space>", ":noh<CR>", { silent = true })
-- Center screen after search when pressing
vim.keymap.set("c", "<CR>", function()
  local cmd_type = vim.fn.getcmdtype()
  if cmd_type == "/" or cmd_type == "?" then
    return "<CR>zz"
  else
    return "<CR>"
  end
end, { expr = true, silent = true })
-- }}}

-- {{{ long lines
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 120
vim.opt.formatoptions = "qn1Mj"
vim.opt.listchars = {
  tab = "▸ ",
  eol = "¬",
}
vim.keymap.set("n", "<leader>l", ":set list!<CR>", { silent = true })
-- }}}

-- {{{ moving
-- Normal mode
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", ":bp<CR>", { silent = true })  -- previous buffer
vim.keymap.set("n", "<Right>", ":bn<CR>", { silent = true }) -- next buffer
-- Insert mode
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")
-- Jump by paragraph (normal + visual)
vim.keymap.set("n", "<C-j>", "}")
vim.keymap.set("n", "<C-k>", "{")
vim.keymap.set("v", "<C-j>", "}")
vim.keymap.set("v", "<C-k>", "{")
-- Remap j/k to move by screen lines when wrapping
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")
-- }}}

-- {{{ editing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<CR>", "o<Esc>")
-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
-- reformat paragraph
vim.keymap.set("n", "R", "mr{gq}'r")
-- search and replace in for selected text
vim.keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//g<left><left><left>")
-- }}}

-- {{{ folding
vim.keymap.set("n", "<Space>", "za")
-- }}}

-- {{{ convenience
vim.keymap.set("n", "<leader>v", ":e $HOME/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<localleader>v", ":source $HOME/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>t", ":e $HOME/notes/todo.md<CR>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>")
vim.keymap.set("n", "<leader>d", ":bd<CR>")
vim.keymap.set("n", "<F10>", ":wq<CR>")

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

vim.api.nvim_create_user_command("W", function()
  vim.cmd("w !sudo tee % > /dev/null")
end, {})

vim.keymap.set("", "Q", "@q")

vim.keymap.set("n", "<leader>m", ":w<CR>:make<CR>")

vim.keymap.set("n", "<leader>1", ":on<CR>")
-- }}}

-- {{{ plugins
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup("plugins")
-- }}}

-- {{{ telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>r', builtin.oldfiles)
vim.keymap.set('n', '<leader>n', function()
  builtin.find_files({ cwd = "~/Desktop/notes" })
end)
-- }}}
