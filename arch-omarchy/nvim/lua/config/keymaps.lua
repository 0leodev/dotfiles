-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "a", "ggVG", { desc = "Select all text" })

vim.keymap.set("n", "w", ":w<CR>", { desc = "Save file" })

--- FOR COPYING: PATH FILE + CODE LINE NUMBER + CODE SNIPPET ---

vim.keymap.set("v", "gy", function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local filepath = vim.fn.expand("%:.")
  local lines = vim.fn.getline(start_line, end_line)
  local code = table.concat(lines, "\n")

  local location = string.format("@%s:%d", filepath, start_line)
  if start_line ~= end_line then
    location = string.format("@%s:%d-%d", filepath, start_line, end_line)
  end

  local result = location .. "\n```\n" .. code .. "\n```"

  vim.fn.setreg("+", result)
  vim.notify("Copied location + line number + snippet")
end, { desc = "Copy location + line number + snippet" })

--- FOR COPYING: PATH FILE + CODE LINE NUMBER ---

-- vim.keymap.set("v", "gy", function()
--   local start_line = vim.fn.line("v")
--   local end_line = vim.fn.line(".")
--   if start_line > end_line then
--     start_line, end_line = end_line, start_line
--   end
--
--   local filepath = vim.fn.expand("%:.")
--   local location = string.format("@%s:%d", filepath, start_line)
--   if start_line ~= end_line then
--     location = string.format("@%s:%d-%d", filepath, start_line, end_line)
--   end
--
--   vim.fn.setreg("+", location)
--   vim.notify("Copied location + line number")
-- end, { desc = "Copy location + line number" })
