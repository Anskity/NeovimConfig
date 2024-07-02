-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local started_terminal = false

local press_keys = function(keys, mode)
  local fixed_keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(fixed_keys, mode, false)
end

vim.keymap.set("n", "<C-z>", function()
  vim.cmd("ToggleTerm")

  if started_terminal then
    press_keys("a<ESC><BS>", "n")
  end
  started_terminal = true
end)

vim.keymap.set("t", "<C-z>", function()
  vim.cmd("stopinsert")
  vim.cmd("ToggleTerm")
end)

vim.keymap.set("n", "<C-n>", "$F{a\n<ESC>O")
vim.keymap.set("t", "<C-Right>", function()
  vim.cmd("stopinsert")
  press_keys("<C-Right>", "n")
end)
vim.keymap.set("t", "<C-Left>", function()
  vim.cmd("stopinsert")
  press_keys("<C-Left>", "n")
end)

vim.keymap.set("n", "<C-j>", "a<Enter><ESC>k$")
vim.keymap.set("n", "<C-k>", "O<ESC>j$")
vim.keymap.set("i", "<C-c>", function()
  vim.cmd("stopinsert")
end)
