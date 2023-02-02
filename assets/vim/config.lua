--- LVIM options ---

lvim.log.level = "warn"
lvim.colorscheme = "onedark"
lvim.format_on_save.enabled = true
lvim.lsp.automatic_servers_installation = true

-- Status bar configuration
local components = require "lvim.core.lualine.components"
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.component_separators = ""
lvim.builtin.lualine.sections = {
    lualine_a = { 'mode' },
    lualine_b = { components.branch, },
    lualine_c = { components.diff, "searchcount" },
    lualine_x = { components.diagnostics, components.lsp, components.spaces, },
    lualine_y = { "fileformat", "filesize", components.filetype, },
    lualine_z = { components.location, components.progress }
}

-- UI
vim.opt.guifont = "Hack Nerd Font Mono:h17"
vim.opt.signcolumn = "auto"
vim.opt.updatetime = 100
vim.opt.title = false
vim.opt.cursorline = false

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.visualbell = true
vim.opt.belloff = "all"

vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.listchars = "trail:¬,tab:⍿·"
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
vim.opt.spelllang = { "en", "fr" }

-- Specific languages
lvim.autocommands = {
    {
        "BufEnter",
        {
            pattern = { "*.py", "*.go" },
            command = "setlocal cc=120 textwidth=119",
        }
    },
}

--- Plugins ---

-- Builtins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true

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
    { "navarasu/onedark.nvim" },

    -- Navigation
    { "ggandor/lightspeed.nvim", event = "BufRead", },
    {
        "s1n7ax/nvim-window-picker",
        tag = "1.*",
        config = function()
            require("window-picker").setup({
                autoselect_one = true,
                include_current = false,
                filter_rules = {
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = {},

                        -- if the buffer type is one of following, the window will be ignored
                        buftype = {},
                    },
                },
                other_win_hl_color = "#e35e4f",
            })
        end,
    },

    -- Editing
    { "mg979/vim-visual-multi" },
    { "gcmt/wildfire.vim" },
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
        config = function()
            require("spectre").setup()
        end,
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
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },
    {
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup {
                keymaps = {
                    close = { "<C-c>", "<Esc>" },
                    yank_last = "<C-y>",
                    scroll_up = "<C-k>",
                    scroll_down = "<C-j>",
                    toggle_settings = "<C-o>",
                    new_session = "<C-n>",
                    cycle_windows = "<C-l>",
                },
            }
        end
    },

    -- UI
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
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
                    signature = { enabled = false }
                },
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    inc_rename = true, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })
        end,
    },

    -- Misc
    {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = { border = "rounded" }
            })
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
            })
        end
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function()
            require("lsp-rooter").setup()
        end,
    },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },
    { "tpope/vim-repeat" },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup {
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "ys",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "S",
                    visual_line = "gS",
                    delete = "ds",
                    change = "cs",
                },
            }
        end,
    },
    { "felipec/vim-sanegx", event = "BufRead" },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    {
        "monaqa/dial.nvim",
        config = function()
            local status_ok, dial_config = pcall(require, "dial.config")
            if not status_ok then
                return
            end

            local augend = require "dial.augend"
            dial_config.augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%d/%m/%Y"],
                },
                visual = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%d/%m/%Y"],
                    augend.constant.alias.alpha,
                    augend.constant.alias.Alpha,
                },
                mygroup = {
                    augend.constant.new {
                        elements = { "and", "or" },
                        word = true,
                        cyclic = true,
                    },
                    augend.constant.new {
                        elements = { "True", "False" },
                        word = true,
                        cyclic = true,
                    },
                    augend.constant.new {
                        elements = { "public", "private" },
                        word = true,
                        cyclic = true,
                    },
                    augend.constant.new {
                        elements = { "sad", "sad" },
                        word = true,
                        cyclic = true,
                    },
                    augend.constant.new {
                        elements = { "&&", "||" },
                        word = false,
                        cyclic = true,
                    },
                    augend.constant.alias.bool,
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.semver.alias.semver
                },
            }

            local map = require "dial.map"

            -- change augends in VISUAL mode
            vim.api.nvim_set_keymap("n", "<C-a>", map.inc_normal "mygroup", { noremap = true })
            vim.api.nvim_set_keymap("n", "<C-x>", map.dec_normal "mygroup", { noremap = true })
            vim.api.nvim_set_keymap("v", "<C-a>", map.inc_visual "visual", { noremap = true })
            vim.api.nvim_set_keymap("v", "<C-x>", map.dec_visual "visual", { noremap = true })
            vim.api.nvim_set_keymap("v", "g<C-a>", map.inc_gvisual "visual", { noremap = true })
            vim.api.nvim_set_keymap("v", "g<C-x>", map.dec_gvisual "visual", { noremap = true })
        end,
    },
    { "hrsh7th/cmp-emoji" },
    {
        "LhKipp/nvim-nu",
        config = function()
            require("nu").setup {}
        end,
    }
}

-- Onedark theming
require('onedark').setup { style = 'deep' }
require('onedark').load()

-- Telescope settings
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "projects")
    -- any other extensions loading
end

--- Key Mappings ---

lvim.leader = "space"
lvim.keys.normal_mode["<Space>v"] = ":vsplit<cr>"
lvim.keys.normal_mode["<Space>s"] = ":split<cr>"
lvim.keys.normal_mode["<C-w>"] = "<C-w>w"

-- spectre plugin
lvim.keys.normal_mode["<Space>S"] = "<cmd>lua require('spectre').open()<cr>"
lvim.keys.normal_mode["<Space>Sf"] = "viw:lua require('spectre').open_file_search()<cr>"
lvim.keys.normal_mode["<Space>Sw"] = "<cmd>lua require('spectre').open_visual({select_word=true})<cr>"
lvim.keys.normal_mode["<Space>Swf"] = "<cmd>lua require('spectre').open({path = vim.fn.fnameescape(vim.fn.expand('%:p:.')), search_text = vim.fn.expand('<cword>')})<cr>"

-- toggleterm plugin
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.direction = "horizontal"

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

lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

lvim.builtin.cmp.formatting.source_names["emoji"] = "(Emoji)"
table.insert(lvim.builtin.cmp.sources, { name = "emoji" })

-- Window picker
local picker = require('window-picker')

vim.keymap.set("n", ",w", function()
    local picked_window_id = picker.pick_window({
        include_current_win = true
    }) or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

-- Swap two windows using the awesome window picker
vim.keymap.set("n", ",W", function()
    local window = picker.pick_window({
        include_current_win = false
    })
    local target_buffer = vim.fn.winbufnr(window)
    -- Set the target window to contain current buffer
    vim.api.nvim_win_set_buf(window, 0)
    -- Set current window to contain target buffer
    vim.api.nvim_win_set_buf(0, target_buffer)
end, { desc = 'Swap windows' })

--- Specific Linting/Formatting parameters ---
-- Formatter options
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", args = { "--line-length=120" }, },
}

-- Linter options
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "mypy", args = { "--check-untyped-defs" }, },
}
