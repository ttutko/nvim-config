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
  }
}
