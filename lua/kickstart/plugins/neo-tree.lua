-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
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
        position = 'right',
      },
    },
  },
}
