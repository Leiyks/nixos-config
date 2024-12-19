-- Install Lazy if not alreay present.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Check https://lazy.folke.io/configuration for configuration options.
require("lazy").setup({

  -- add LazyVim and import its plugins
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.editor.leap" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
    { import = "lazyvim.plugins.extras.coding.mini-comment" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.dap.core" },
    -- { import = "lazyvim.plugins.extras.coding.copilot-chat" },
    -- { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.php" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.editor.inc-rename" },
    { import = "lazyvim.plugins.extras.util.rest" },
    { import = "plugins" },
  },

  defaults = {
    lazy = false, -- Don't lazy load by default to avoid unexpected behaviour.
    version = false, -- Always use the latest git commit.
  },

  install = { colorscheme = { "tokyonight" } },

  -- check for plugin updates periodically
  checker = {
    enabled = true,
    notify = false,
  },

  ui = { border = "rounded", backdrop = 100 },
})
