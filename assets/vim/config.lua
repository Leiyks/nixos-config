-- LVIM options ---

lvim.log.level = "warn"
lvim.colorscheme = "onedark"
lvim.format_on_save.enabled = true
lvim.builtin.lualine.style = "default"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "" }
lvim.builtin.treesitter.highlight.enable = true

-- VIM options ---

-- UI
vim.opt.guifont = "Hack Nerd Font:h17"
vim.opt.signcolumn = "auto"
vim.opt.updatetime = 100
vim.opt.title = false

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.visualbell = true
vim.opt.belloff = "all"

vim.opt.colorcolumn = "+1"
-- Not needed as lsp will handle it
-- vim.opt.list = true
-- vim.opt.listchars = "trail:¬"
vim.opt.textwidth = 79

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 2
vim.opt.softtabstop = -1

-- Generated files
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.swapfile = true

vim.opt.backupdir = "/home/leiyks/.config/lvim/tmp/backup"
vim.opt.undodir = "/home/leiyks/.config/lvim/tmp/backup"
vim.opt.directory = "/home/leiyks/.config/lvim/tmp/swap"

-- Misc
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autowrite = true

--- Plugins ---

lvim.plugins = {
    { "navarasu/onedark.nvim" }
}

-- Color scheme plugin
require('onedark').setup {
    style = 'deep'
}
require('onedark').load()

--- Key Mappings ---

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
