-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "prettier/vim-prettier",
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate"},
  "tpope/vim-surround",
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-file-browser.nvim'}
    },
"nvim-lualine/lualine.nvim",
	"kyazdani42/nvim-web-devicons",
	{ "Alexis12119/nightly.nvim" },
	{"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"onsails/lspkind-nvim",
		"glepnir/lspsaga.nvim",
	"L3MON4D3/LuaSnip"},
	"windwp/nvim-ts-autotag",
	"windwp/nvim-autopairs",
	"jose-elias-alvarez/null-ls.nvim",
	"OmniSharp/omnisharp-vim",
})
 -- cammand
vim.cmd "colorscheme nightly"

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
