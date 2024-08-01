local tokyonight_colors = require("tokyonight.colors").setup()

-- Make Floating popup nice and transparent.
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = tokyonight_colors.border, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "FloatBorder" })

-- Set Noice popup style
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleCmdline", { fg = tokyonight_colors.red, bg = "none" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleCalculator", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleFilter", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleHelp", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleInput", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleLua", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleSearch", { link = "NoiceCmdlinePopupTitleCmdline" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = tokyonight_colors.green, bg = "none" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
