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
      require("config.nvim-treesitter").setup()
    end,
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
  }

  -- indentscope
  use {
    "echasnovski/mini.indentscope",
    config = function()
      require("config.mini-indentscope").setup()
    end
  }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("config.lualine").setup()
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Tabs
  use {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    config = function()
      require("config.nvim-bufferline").setup()
    end,
  }

  -- Shortcuts
  use {
    "folke/which-key.nvim",
    config = function()
      require("config.which-key").setup()
    end,
  }

  -- Git support
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("config.neogit").setup()
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- File tree
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("config.nvim-tree").setup()
    end,
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
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
