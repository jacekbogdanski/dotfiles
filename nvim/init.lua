-- ============================================================================
-- Main Neovim Configuration
-- ============================================================================

-- Set leader key first
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Disable unused providers (silence warnings)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- ============================================================================
-- Options
-- ============================================================================

-- Global options
vim.cmd("syntax on")
vim.cmd("set iskeyword+=-")
vim.cmd("set shortmess+=c")
vim.cmd("set inccommand=nosplit")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set diffopt+=vertical")

vim.opt.undofile = true
vim.opt.autowrite = true
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.smarttab = true
vim.opt.hlsearch = false
vim.opt.errorbells = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.hidden = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "99999" -- Fix indent column
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.smartindent = true

-- ============================================================================
-- Core Keybindings (non-plugin specific)
-- ============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Command mode shortcut
keymap('n', ';', ':', { noremap = true })

-- Search and replace
keymap('n', '<leader>s', ':%s//g<Left><Left>', { noremap = true, desc = 'Search and replace' })
keymap('n', '<leader>S', ':%S//g<Left><Left>', { noremap = true, desc = 'Search and replace (preserve case)' })

-- Window management
keymap('n', 'vv', '<C-w>v', opts)
keymap('n', 'vs', '<C-w>s', opts)
keymap('n', 'vo', '<C-w>o', opts)

-- Claude context helpers (,c prefix)
keymap('n', '<leader>cf', ':let @+ = expand("%")<CR>:echo "Copied: " . expand("%")<CR>', { noremap = true, desc = 'Copy file path' })
keymap('n', '<leader>cF', ':let @+ = expand("%:p")<CR>:echo "Copied: " . expand("%:p")<CR>', { noremap = true, desc = 'Copy full path' })
keymap('n', '<leader>cl', ':let @+ = expand("%") . ":" . line(".")<CR>:echo "Copied: " . expand("%") . ":" . line(".")<CR>', { noremap = true, desc = 'Copy location' })
keymap('v', '<leader>cs', '"+y:echo "Selection copied"<CR>', { noremap = true, desc = 'Copy selection' })

-- Copy selection with file context (visual mode)
keymap('v', '<leader>cc', ':<C-u>call CopyWithContext()<CR>', { noremap = true, desc = 'Copy with context' })

-- Define the function globally for vimscript to call
vim.cmd([[
function! CopyWithContext()
  let l:start = line("'<")
  let l:end = line("'>")
  let l:filepath = expand("%")

  " Yank selection to z register
  normal! gv"zy
  let l:selection = @z

  " Create context string
  let l:context = l:filepath . ":" . l:start . "-" . l:end . "\n" . l:selection
  let @+ = l:context
endfunction
]])

-- ============================================================================
-- Bootstrap lazy.nvim
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Load Plugins
-- ============================================================================

require("lazy").setup("plugins", {
  change_detection = {
    notify = false, -- Don't notify on config changes
  },
  rocks = {
    enabled = false, -- Disable luarocks (not needed)
  },
})

-- ============================================================================
-- Colorscheme
-- ============================================================================

vim.cmd.colorscheme("kanagawa")
