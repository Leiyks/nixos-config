require("config.lazy")
require("lspconfig.ui.windows").default_options.border = "rounded"

-- Autocmd that needs to not be lazy loaded.
local tokyonight_colors = require("tokyonight.colors").setup()

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = tokyonight_colors.border, bg = "none" })
vim.api.nvim_set_hl(0, "PMenu", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "FloatBorder" })

vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleCmdline", { fg = tokyonight_colors.red, bg = "none" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleCalculator", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleFilter", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleHelp", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleInput", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleLua", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleSearch", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = tokyonight_colors.green, bg = "none" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if #lines > 0 and lines[#lines] ~= "" then
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
    end
  end,
})
