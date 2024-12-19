-------------------------------------------------------------------------------
-----------------------------   General options   -----------------------------
-------------------------------------------------------------------------------

vim.opt.autoread = true
vim.opt.autowriteall = true

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 2
vim.opt.softtabstop = -1

-- Generated files
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.swapfile = true

vim.opt.backupdir = "/home/alexandre/.config/lvim/tmp/backup"
vim.opt.undodir = "/home/alexandre/.config/lvim/tmp/undo"
vim.opt.directory = "/home/alexandre/.config/lvim/tmp/swap"

-- Misc
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autowrite = true
vim.opt.spelllang = { "en", "fr" }

-------------------------------------------------------------------------------
------------------------------------   UI   -----------------------------------
-------------------------------------------------------------------------------

vim.opt.guifont = "Hack Nerd Font Mono:h17"

vim.opt.updatetime = 100

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.visualbell = true
vim.opt.belloff = "all"

vim.opt.list = true
vim.opt.listchars = "trail:¬,tab:⍿·"

vim.opt.pumblend = 0
vim.opt.winblend = 0

vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.opt.relativenumber = false
