return {
  -- Copilot plugin setup
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<Tab>',
            accept_word = '<C-Right>',
            accept_line = '<C-Down>',
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        panel = { enabled = false },
      }
    end,
  },

  -- Alpha dashboard setup
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },

  -- Undotree plugin setup
  {
    'mbbill/undotree',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
    end,
  },

  -- Git integration
  {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Gstatus', 'Gblame', 'Gdiffsplit' }, -- lazy load only when you use Git commands
  },

  -- Harpoon plugin setup
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>a', function()
        mark.add_file()
      end, { desc = 'Add file to Harpoon' })

      vim.keymap.set('n', '<leader>h', function()
        ui.toggle_quick_menu()
      end, { desc = 'Toggle Harpoon menu' })

      vim.keymap.set('n', '<C-h>', function()
        ui.nav_file(1)
      end, { desc = 'Go to Harpoon file 1' })
      vim.keymap.set('n', '<C-j>', function()
        ui.nav_file(2)
      end, { desc = 'Go to Harpoon file 2' })
      vim.keymap.set('n', '<C-k>', function()
        ui.nav_file(3)
      end, { desc = 'Go to Harpoon file 3' })
      vim.keymap.set('n', '<C-l>', function()
        ui.nav_file(4)
      end, { desc = 'Go to Harpoon file 4' })
    end,
  },

  -- Trouble plugin setup
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup {
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        signs = {
          error = 'E',
          warning = 'W',
          hint = 'H',
          information = 'I',
          other = '?',
        },
      }
    end,
  },

  -- Flutter tools
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional UI improvements
      'mfussenegger/nvim-dap', -- for debugging if needed
    },
    config = function()
      require('flutter-tools').setup {
        flutter_path = '/opt/homebrew/bin/flutter', -- full path to flutter
        widget_guides = { enabled = true },
        closing_tags = { highlight = 'Comment' },
        lsp = {
          color = { enabled = true },
          on_attach = function(_, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', '<leader>fr', '<cmd>FlutterRun<cr>', bufopts)
            vim.keymap.set('n', '<leader>fh', '<cmd>FlutterHotReload<cr>', bufopts)
            vim.keymap.set('n', '<leader>fq', '<cmd>FlutterQuit<cr>', bufopts)
            vim.keymap.set('n', '<leader>fl', '<cmd>FlutterLog<cr>', bufopts) -- optional log key
          end,
        },
      }
    end,
    ft = { 'dart' },
  },

  -- Toggleterm for running commands (optional)
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    cmd = { 'ToggleTerm', 'TermExec' },
  },

  -- Visual Multi plugin setup
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    keys = { '<C-n>', '\\A' }, -- load only when these keys are used
    init = function()
      vim.g.VM_default_mappings = 1
    end,
  },

  -- Opencode plugin setup
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }
      -- Required for `opts.events.reload`.
      vim.o.autoread = true
      -- Recommended/example keymaps.
      vim.keymap.set({ 'n', 'x' }, '<C-a>', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode' })
      vim.keymap.set({ 'n', 'x' }, '<C-x>', function() require('opencode').select() end,                          { desc = 'Execute opencode action…' })
      vim.keymap.set({ 'n', 'x' },    'ga', function() require('opencode').prompt('@this') end,                   { desc = 'Add to opencode' })
      vim.keymap.set({ 'n', 't' }, '<C-.>', function() require('opencode').toggle() end,                          { desc = 'Toggle opencode' })
      vim.keymap.set('n',        '<S-C-u>', function() require('opencode').command('session.half.page.up') end,   { desc = 'opencode half page up' })
      vim.keymap.set('n',        '<S-C-d>', function() require('opencode').command('session.half.page.down') end, { desc = 'opencode half page down' })
      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
      vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
    end,
  },
}
