-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Tmux navigation (existing)
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- ===== ELITE SPEED OPTIMIZATIONS =====

-- 1. Quick Escape (ThePrimeagen's signature move)
map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode with kj" })

-- 2. Quick Save (Universal elite pattern)
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file (Ctrl+S)" })
map("i", "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save file from insert mode" })

-- 3. Centered Navigation (ThePrimeagen's secret sauce)
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- 4. Power User Quick Access
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Quick find files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Quick search in project" })

-- 5. Better Line Movement (with visual mode support)
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- 6. Smart Line Navigation
map("n", "j", "gj", { desc = "Move down by visual line" })
map("n", "k", "gk", { desc = "Move up by visual line" })

-- 7. Quick Window Management
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontally" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

-- 8. Better Indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
