-- Change windows split bindings
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>-")
vim.keymap.set("n", "<leader>v", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>h", "<C-W>s", { desc = "Split Window Below", remap = true })

-- Change buffer bindings
vim.keymap.del("n", "<leader>`")
vim.keymap.set("n", "<A-S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer", remap = true })
vim.keymap.set("n", "<A-S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer", remap = true })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer", remap = true })
vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<cr>", { desc = "Prev Buffer", remap = true })

-- Change windows bindings
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.set("n", "<leader><tab><leader>", "<cmd>tabprevious<cr>", { desc = "Previous Tab", remap = true })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab", remap = true })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab", remap = true })
