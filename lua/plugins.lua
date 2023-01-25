vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use {
    "tomasiser/vim-code-dark",
    config = function()
      vim.cmd "colorscheme codedark"
    end,
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    event = "BufRead",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter").setup()
    end,
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
  }

  -- indent-blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.indentblankline").setup()
    end,
    requires = {
      { "nvim-treesitter/nvim-treesitter" },
    },
  }

  -- lualine
  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("config.lualine").setup()
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- bufferline
  use {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    config = function()
      require("config.bufferline").setup()
    end,
  }

  -- WhichKey
  use {
    "folke/which-key.nvim",
    config = function()
      require("config.whichkey").setup()
    end,
  }

  -- neogit
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("config.neogit").setup()
    end,
  }

  -- tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("config.nvimtree").setup()
    end,
  }

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
