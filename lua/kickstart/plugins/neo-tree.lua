-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons', -- Better all-the-icons support
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '\\', '<cmd>Neotree toggle<cr>', desc = 'Toggle NeoTree', silent = true },
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Explorer Toggle', silent = true },
    { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus NeoTree', silent = true },
    { '<leader>f', '<cmd>Neotree reveal<cr>', desc = 'Reveal current file in NeoTree', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
        -- position = 'right',
        position = 'left',
      },
      use_libuv_file_watcher = true,
    },
    -- Icons are automatically provided by nvim-web-devicons
    -- File icons are shown based on file extension/type (e.g., .py, .js, .lua, .c, .cpp, etc.)
    -- Folder icons are also provided by nvim-web-devicons
    default_component_configs = {
      git_status = {
        symbols = {
          added = '✚',
          deleted = '✖',
          modified = '✹',
          renamed = '➜',
          untracked = '★',
          ignored = '◌',
          unstaged = '✗',
          staged = '✓',
          conflict = '⚠',
        },
      },
    },
  },
}
