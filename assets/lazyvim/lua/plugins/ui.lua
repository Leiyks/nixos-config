return {

  -- Add proper colorschemes with transparent background.
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
      transparent = true,
      colors = {
        fg = "#ededed",
        dark_bg = "#16161e",
      },
      highlights = {
        ColorColumn = { bg = "$dark_bg" },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = function()
      return {
        transparent = true,
        lazy = false,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },

  -- Add lualine component for LSP
  -- {
  --   "arkav/lualine-lsp-progress",
  -- },
  -- lua
  {
    "linrongbin16/lsp-progress.nvim",
    config = function()
      require("lsp-progress").setup({
        client_format = function(client_name, spinner, series_messages)
          if #series_messages == 0 then
            return nil
          end
          return {
            name = client_name,
            body = spinner .. " " .. table.concat(series_messages, ", "),
          }
        end,
        format = function(client_messages)
          --- @param name string
          --- @param msg string?
          --- @return string
          local function stringify(name, msg)
            return msg and string.format("%s %s", name, msg) or name
          end

          local sign = "" -- nf-fa-gear \uf013
          local lsp_clients = vim.lsp.get_clients()
          local messages_map = {}
          for _, climsg in ipairs(client_messages) do
            messages_map[climsg.name] = climsg.body
          end

          if #lsp_clients > 0 then
            table.sort(lsp_clients, function(a, b)
              return a.name < b.name
            end)
            local builder = {}
            for _, cli in ipairs(lsp_clients) do
              if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
                if messages_map[cli.name] then
                  table.insert(builder, stringify(cli.name, messages_map[cli.name]))
                else
                  table.insert(builder, stringify(cli.name))
                end
              end
            end
            if #builder > 0 then
              return sign .. " " .. table.concat(builder, ", ")
            end
          end
          return ""
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      require("tokyonight").setup()
      local icons = LazyVim.config.icons
      return {
        options = {
          theme = "tokyonight",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_b = {
            { "branch" },
            LazyVim.lualine.root_dir(),
          },
          lualine_c = {
            -- {
            --   "lsp_progress",
            --   display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
            --   separators = {
            --     component = ", ",
            --     progress = " | ",
            --     message = { pre = "(", post = ")" },
            --     percentage = { pre = "", post = "%% " },
            --     title = { pre = "", post = ": " },
            --     lsp_client_name = { pre = "", post = "" },
            --   },
            --   timer = {
            --     progress_enddelay = 500,
            --     spinner = 1000,
            --     lsp_client_name_enddelay = 1000000000,
            --   },
            --   spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            -- },
            function()
              return require("lsp-progress").progress()
            end,
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return LazyVim.ui.fg("Statement") end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return LazyVim.ui.fg("Constant") end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return LazyVim.ui.fg("Debug") end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return LazyVim.ui.fg("Special") end,
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "location" },
            { "progress" },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
      }
    end,
  },

  -- Configure Mason UI
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        height = 0.8,
      },
    },
  },

  -- Configure Noice UI
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      views = {
        popup = {
          border = {
            style = "rounded",
          },
        },
        hover = {
          border = {
            style = "rounded",
          },
        },
      },
    },
  },

  -- Configure Trouble UI
  {
    "folke/trouble.nvim",
    enabled = true,
    opts = {
      modes = {
        diagnostics = {
          border = "rounded",
          win = { border = "rounded" },
        },
      },
    },
  },

  -- Configure Which-key UI
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "rounded",
      },
    },
  },

  -- Enable smart color column
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "NvimTree",
        "Trouble",
        "checkhealth",
        "dashboard",
        "fish",
        "help",
        "lazy",
        "lspinfo",
        "markdown",
        "mason",
        "noice",
        "text",
        "zsh",
      },
    },
  },
}
