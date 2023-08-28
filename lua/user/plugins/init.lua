return {
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'}
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {'nvim-tree/nvim-web-devicons'},
  },
  { 
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c_sharp", "python" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "OmniSharp/omnisharp-vim"
  },
  {
    "dense-analysis/ale"
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "hrsh7th/cmp-buffer"
  },
  {
    "hrsh7th/cmp-path"
  },
  {
    "hrsh7th/cmp-cmdline"
  },
  {
    "hrsh7th/nvim-cmp"
  }
}
