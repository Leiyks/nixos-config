return {

  -- Add autocompletion on cmdline
  -- {
  --   "hrsh7th/cmp-cmdline",
  --   config = function()
  --     local cmp = require("cmp")
  --
  --     cmp.setup.cmdline("/", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "buffer" },
  --       },
  --     })
  --
  --     cmp.setup.cmdline(":", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = cmp.config.sources({
  --         { name = "path" },
  --       }, {
  --         {
  --           name = "cmdline",
  --           option = {
  --             ignore_cmds = { "Man", "!" },
  --           },
  --         },
  --       }),
  --     })
  --   end,
  -- },

  -- Enable Tab completion
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local cmp = require("cmp")
  --
  --     opts.window = {
  --       completion = {
  --         border = "rounded",
  --         winhighlight = "",
  --       },
  --       documentation = {
  --         border = "rounded",
  --         winhighlight = "",
  --       },
  --     }
  --
  --     opts.completion = {
  --       completeopt = table.concat(vim.opt.completeopt:get(), ","),
  --     }
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_next_item()
  --         elseif vim.snippet.active({ direction = 1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(1)
  --           end)
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif vim.snippet.active({ direction = -1 }) then
  --           vim.schedule(function()
  --             vim.snippet.jump(-1)
  --           end)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },

  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        list = { selection = "auto_insert" },
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
        signature = { window = { border = "rounded" } },
      },
      -- TODO: Enable when blink is having a new release
      -- sources = {
      --   cmdline = { "cmdline", "buffer" },
      -- },
    },
  },

  -- Integration with tmux
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
      })

      vim.keymap.set("n", "<M-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<M-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<M-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<M-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },

  -- Multi line selection tool
  { "mg979/vim-visual-multi" },

  -- Better marks plugin
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})
    end,
  },

  {
    "mistweaverco/kulala.nvim",
    opts = {
      additional_curl_options = { "-L" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["json"] = { "jq" },
      },
    },
  },
}
