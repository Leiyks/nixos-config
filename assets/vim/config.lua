--- LVIM options ---

lvim.log.level = "warn"
lvim.colorscheme = "onedark"
lvim.format_on_save.enabled = true
lvim.lsp.automatic_servers_installation = true
lvim.transparent_window = true

-- Status bar configuration
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.options.theme = "tokyonight"
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

-- UI
vim.opt.guifont = "Hack Nerd Font Mono:h17"
vim.opt.signcolumn = "auto"
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.visualbell = true
vim.opt.belloff = "all"

vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.listchars = "trail:¬,tab:⍿·"
vim.opt.textwidth = 79

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

vim.opt.backupdir = "/home/leiyks/.config/lvim/tmp/backup"
vim.opt.undodir = "/home/leiyks/.config/lvim/tmp/undo"
vim.opt.directory = "/home/leiyks/.config/lvim/tmp/swap"

-- Misc
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autowrite = true
vim.opt.spelllang = { "en", "fr" }

vim.g.loaded_perl_provider = 0

--- Plugins ---

-- Builtins
lvim.builtin.alpha.dashboard.section.buttons.entries[6] = {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit /home/leiyks/git/nixos-config/assets/vim/config.lua <CR>"
}

-- Dashboard configuration

lvim.builtin.alpha.dashboard.section.buttons.entries[7] = {
    "x",
    "  Nixos Configuration",
    "<CMD>edit /home/leiyks/git/nixos-config/flake.nix <CR>"
}

lvim.builtin.terminal.active = true
lvim.builtin.terminal.insert_mappings = false
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction = "horizontal"

lvim.builtin.cmp.cmdline.enable = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "^.git$")
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "cache$")
table.insert(lvim.builtin.nvimtree.setup.filters.custom, "__pycache__$")

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.matchup.enable = true

-- Extra plugins
lvim.plugins = {
    -- Theming
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

    -- Navigation
    { "ggandor/lightspeed.nvim", event = "BufRead", },

    -- Editing
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

    -- Lsp
    {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                }
            end, 100)
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
        config = function() require("copilot_cmp").setup() end
    },
    {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },

    -- UI
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function() require("todo-comments").setup() end,
    },
    { "MunifTanjim/nui.nvim" },
    {
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    progress = { enabled = false },
                    signature = { enabled = false }
                },
                presets = {
                    bottom_search = true,
                    long_message_to_split = true,
                    command_palette = true,
                    inc_rename = true,
                    lsp_doc_border = true,
                },
            })
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                fps = 60,
                stages = 'slide',
                background_colour = 'FloatShadow',
                timeout = 3000,
                render = "compact"
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup {
                window = { blend = 0, },
            }
        end
    },

    -- Misc
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,
                stop_eof = true,
                use_local_scrolloff = false,
                respect_scrolloff = false,
                cursor_scrolls_alone = true,
                easing_function = nil,
                pre_hook = nil,
                post_hook = nil,
            })
        end
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit", },
                lastplace_open_folds = true,
            })
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
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function() require("lsp-rooter").setup() end,
    },
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end,
    },
    {
        "LhKipp/nvim-nu",
        config = function() require("nu").setup {} end,
    },
    { "folke/trouble.nvim",  cmd = "TroubleToggle" },
    { "tpope/vim-repeat" },
    { "felipec/vim-sanegx",  event = "BufRead" },
}

-- Telescope settings
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "projects")
    pcall(telescope.load_extension, "notify")
end

--- Key Mappings ---

-- General
lvim.leader = "space"
lvim.keys.normal_mode["<Space>v"] = ":vsplit<cr>"
lvim.keys.normal_mode["<Space>s"] = ":split<cr>"

-- Spectre plugin
lvim.keys.normal_mode["<Space>Sp"] = "<cmd>lua require('spectre').open_visual({select_word=true})<cr>"

-- Vim-notify plugin
lvim.keys.normal_mode["<Space>n"] = "<cmd>lua require('notify').dismiss()<cr>"

-- Trouble plugin
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- Persistance plugin
lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["sn"] = {
    "<cmd>lua require'telescope'.extensions.notify.notify{}<CR>", "Notifications"
}

lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

--- Specific Linting/Formatting parameters ---
-- Formatter options
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", args = { "--line-length=120" }, },
    { command = "jq" },
}

-- Linter options
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "mypy", args = { "--check-untyped-defs" }, },
}

-- LSP options
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lvim.lsp.manager").setup("clangd", { capabilities = capabilities })

require("lvim.lsp.manager").setup("rnix", { cmd = { "rnix-lsp" } })
