-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- references:
-- * https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

local options = {
  termguicolors = true,       -- enable 24-bit RGB color
  clipboard = "unnamedplus",  -- makes neovim use the system clipboard
  timeoutlen = 300,           -- time for user to finish a key combination
  updatetime = 200,           -- faster completion
  virtualedit = "block",      -- enable highlighting empty spaces
  splitbelow = true,          -- when splitting horizontally, new window goes below
  splitright = true,          -- when splitting vertically, new window goes to the right
  showmode = false,           -- mode will be shown by statusline instead
  cmdheight = 0,              -- hide the command line when not typing command
  path = ".,,**",             -- find-like operations works recursively
  expandtab = true,           -- convert tabs into spaces
  shiftwidth = 4,             -- the number of spaces for each indentation
  tabstop = 4,                -- the number of spaces for each tab
  relativenumber = false,     -- don't display relative line numbers
  number = true,              -- display the current line number
  numberwidth = 3,            -- the column width to display line numbers
  foldlevelstart = 99,        -- open files with all folds open
  foldtext = "",              -- keep the first line of folded section visible
  foldmethod = "expr",        -- assign fold based on expressions
  foldexpr = "nvim_treesitter#foldexpr()",
  wrap = false,               -- do not wrap lines because it looks ugly and inconsistent
  smartindent = true,         -- automatic indentations
  scrolloff = 99,             -- keep cursorline in the middle
  sidescrolloff = 6,          -- minimul number of columns to the left and right of cursor
  fillchars = {
    eob = " ",                -- removes annoying tilde at the bottom of short files
    fold = "-",               -- replace dots with horizontal line to indicate folded sections
  },
  pumheight = 8,              -- specify the max height of pop-up menu
  pumwidth = 20,              -- specify the min width of pop-up menu
  pumblend = 15,              -- semi transparent pop-up menu
  ignorecase = true,          -- make search case-insensitive
  smartcase = true,           -- but if our search contains uppercase(s), it becomes case-sensitive
  fileencoding = "utf-8",     -- the encoding written to a file
}

for parameter, value in pairs(options) do
  vim.opt[parameter] = value
end


if vim.g.vscode then
    -- VSCode extension
    vim.keymap.set('n', '<Space>', function()
        vim.fn.VSCodeNotify('whichkey.show')
    end, { silent = true, noremap = true })
    vim.keymap.set('x', '<Space>', function()
        vim.fn.VSCodeNotify('whichkey.show')
    end, { silent = true, noremap = true })
else
    -- ordinary Neovim
end