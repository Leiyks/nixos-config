-------------------------------------------------------------------------------
-----------------------------   General options   -----------------------------
-------------------------------------------------------------------------------

lvim.log.level = "warn"
lvim.format_on_save.enabled = true

vim.opt.autoread = true
vim.opt.autowriteall = true

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
vim.opt.undodir = "/home/leiyks/.config/lvim/tmp/undo"
vim.opt.directory = "/home/leiyks/.config/lvim/tmp/swap"

-- Misc
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autowrite = true
vim.opt.spelllang = { "en", "fr" }

vim.g.loaded_perl_provider = 0

-------------------------------------------------------------------------------
------------------------------------   UI   -----------------------------------
-------------------------------------------------------------------------------

lvim.colorscheme = "onedark"
lvim.transparent_window = true

vim.opt.guifont = "Hack Nerd Font Mono:h17"

vim.opt.updatetime = 100

vim.opt.signcolumn = "auto"
vim.opt.termguicolors = true

vim.opt.showcmd = true
vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.visualbell = true
vim.opt.belloff = "all"

vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.listchars = "trail:¬,tab:⍿·"

-------------------------------------------------------------------------------
----------------------------   Builtin Plugins  -------------------------------
-------------------------------------------------------------------------------

-- Disable annoying mapping
lvim.builtin.terminal.insert_mappings = false

-- Enable cmp in cmdline
lvim.builtin.cmp.cmdline.enable = true

-------------------------- Status bar configuration ---------------------------

local components = require "lvim.core.lualine.components"
-- TODO: reanable tokynight when the plugin is updated
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.component_separators = ""
lvim.builtin.lualine.sections = {
    lualine_a = { 'mode' },
    lualine_b = { components.branch, components.diff },
    lualine_c = { components.diagnostics, components.lsp },
    lualine_x = { "searchcount", components.spaces },
    lualine_y = { "filename", "filesize", components.filetype, "fileformat" },
    lualine_z = { components.location, components.progress }
}


-------------------------- Dashboard configuration ----------------------------

lvim.builtin.alpha.dashboard.section.buttons.entries[6] = {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit /home/leiyks/git/nixos-config/assets/vim/config.lua<CR>"
}

lvim.builtin.alpha.dashboard.section.buttons.entries[7] = {
    "x",
    "  Nixos Configuration",
    "<CMD>edit /home/leiyks/git/nixos-config/flake.nix<CR>"
}

--------------------------- Nvimtree configuration ----------------------------

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "^.git$")
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "cache$")
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "__pycache__$")

------------------------- Treesitter configuration ----------------------------

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "lua" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.matchup.enable = true

---------------------------- Telescope settings -------------------------------

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "projects")
end
lvim.builtin.telescope.theme = "center"

-------------------------------------------------------------------------------
-----------------------------   Extra Plugins  --------------------------------
-------------------------------------------------------------------------------

lvim.plugins = {

    --------------------------------- Theming ---------------------------------

    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup {
                style = 'deep',
                colors = {
                    fg = '#ededed',
                    dark_bg = '#16161e',
                },
                highlights = {
                    ColorColumn = { bg = '$dark_bg' },
                }
            }
            require('onedark').load()
        end,
    },

    ------------------------------- Navigation --------------------------------

    { "ggandor/lightspeed.nvim", event = "BufRead", },
    {
        "chentoast/marks.nvim",
        config = function() require("marks").setup {} end,
    },

    --------------------------------- Editing ---------------------------------

    { "mg979/vim-visual-multi" },
    {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function() require("spectre").setup() end,
    },
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end,
    },
    { "tpope/vim-repeat" },

    ----------------------------------- Lsp -----------------------------------

    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup({
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                })
                require("copilot_cmp").setup()
            end, 100)

            lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
            table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
        end,
    },
    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },

    ----------------------------------- UI ------------------------------------

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true,
                RRGGBB = true,
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function() require("todo-comments").setup() end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup {
                window = { blend = 0, },
            }
        end
    },

    --------------------------------- Misc ------------------------------------

    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function() require('neoscroll').setup() end
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        lazy = true,
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require "lsp_signature".on_attach({
                bind = true,
                handler_opts = { border = "rounded" }
            })
        end,
    },
    {
        "LhKipp/nvim-nu",
        config = function() require("nu").setup {} end,
    },
    { "farmergreg/vim-lastplace" },
    { "folke/trouble.nvim",      cmd = "TroubleToggle" },
    { "felipec/vim-sanegx",      event = "BufRead" },
}

-------------------------------------------------------------------------------
--------------------------------   Mappings  ----------------------------------
-------------------------------------------------------------------------------

---------------------------------- General ------------------------------------

lvim.leader = "space"

lvim.keys.normal_mode["<M-Up>"] = "<C-w>k"
lvim.keys.normal_mode["<M-Down>"] = "<C-w>j"
lvim.keys.normal_mode["<M-Right>"] = "<C-w>l"
lvim.keys.normal_mode["<M-Left>"] = "<C-w>h"

lvim.builtin.which_key.mappings["v"] = { ":vsplit<cr>", "Vertical split" }
lvim.builtin.which_key.mappings["j"] = { ":split<cr>", "Horizontal split" }
lvim.builtin.which_key.mappings["sm"] = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" }

------------------------------ Spectre plugin ---------------------------------

lvim.builtin.which_key.mappings["r"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Spectre" }

------------------------------ Trouble plugin ---------------------------------

lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "Toggle trouble window" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}

---------------------------- Persistance plugin -------------------------------

lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-------------------------------------------------------------------------------
---------------------------------   LSP   -------------------------------------
-------------------------------------------------------------------------------

--------------------------- Formatter options ---------------------------------

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", args = { "--line-length=120" }, },
    { command = "jq" },
}

---------------------------- Linter options -----------------------------------

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "mypy", args = { "--check-untyped-defs" }, },
}

----------------------------- LSP options -------------------------------------

lvim.lsp.installer.setup.automatic_installation = { exclude = {} }

-- Disable nil_ls
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "nil_ls" })

-- Use rnix instead
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "rnix"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- lua LSP needs manual setup
require("lvim.lsp.manager").setup("lua_ls", {})
