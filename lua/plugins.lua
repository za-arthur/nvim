vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- Color scheme
    use {
      "tomasiser/vim-code-dark",
      config = function()
        vim.cmd "colorscheme codedark"
      end,
    }

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

    use {
      "ibhagwan/fzf-lua",
      config = function()
        require("fzf-lua").setup()
      end,
      requires = { "nvim-tree/nvim-web-devicons" },
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
      "NeogitOrg/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPost",
      config = function()
        require('gitsigns').setup({})
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
        require("config.tree").setup()
      end,
    }

    -- Comment
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    }

    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
        'saadparwaiz1/cmp_luasnip',
      },
      config = function()
        require('config.cmp').setup()
      end,
    }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        require("config.lsp").setup()
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

-- Check:
-- echasnovski/mini.cursorword
-- echasnovski/mini.files
-- echasnovski/mini.surround
-- sessions
-- highlight and trim trailing whitespaces
-- telescope
-- tabby.nvim
-- code-action-menu
-- formatter.nvim
-- nvim-lint
-- trouble.nvim

-- TODO:
-- Configure fzf-lua keymaps
-- Configure rg and fd
-- Configure gitsings keymaps
