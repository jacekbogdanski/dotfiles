local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Ensure packer installation
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute "packadd packer.nvim"
end

-- Auto compile when there are changes in plugins.lua
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function()
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- LSP, code completion
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-compe"
	use "hrsh7th/vim-vsnip"
	use "rafamadriz/friendly-snippets"
	use "RRethy/vim-illuminate"

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "windwp/nvim-ts-autotag"

	-- Telescope
	use {"nvim-telescope/telescope.nvim",
	requires = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		{"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
	}}

	-- Git
	use "tpope/vim-fugitive"
	use "tpope/vim-rhubarb" -- :Gbrowse
	use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

	-- Tmux
	use "christoomey/vim-tmux-navigator"

	-- Explorer
	use "kyazdani42/nvim-tree.lua"

	-- Tpope sugar
	use "tpope/vim-abolish"
	use "tpope/vim-commentary"
	use "tpope/vim-eunuch"
	use "tpope/vim-surround"
	use "tpope/vim-unimpaired"
	use "tpope/vim-repeat"

	-- Looks
	use "mhinz/vim-startify"
	use "glepnir/galaxyline.nvim"
	use "romgrk/barbar.nvim"
	use "kyazdani42/nvim-web-devicons"
	use "jacekbogdanski/oceanic-next"
	use "norcalli/nvim-colorizer.lua"
	use "lukas-reineke/indent-blankline.nvim"

	-- Editing
	use "windwp/nvim-autopairs"	
end)
