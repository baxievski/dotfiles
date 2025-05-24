-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- references:
-- * https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

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