return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    {
      '<C-e>',
      function()
        local ok, toggleterm = pcall(require, 'toggleterm')
        if not ok then
          vim.notify('toggleterm.nvim is not loaded!', vim.log.levels.ERROR)
          return
        end

        local Terminal = require('toggleterm.terminal').Terminal

        if not _G._YAZI_TERMINAL then
          _G._YAZI_TERMINAL = Terminal:new {
            cmd = 'yazi',
            hidden = true,
            direction = 'float',
            float_opts = { border = 'rounded' },
          }
        end

        local yazi = _G._YAZI_TERMINAL

        if vim.fn.executable 'yazi' == 0 then
          vim.notify('Yazi is not installed!', vim.log.levels.ERROR)
          return
        end

        yazi:toggle()
      end,
      desc = 'Toggle Yazi',
    },

    {
      '<C-\\>',
      function()
        local ok, toggleterm = pcall(require, 'toggleterm')
        if not ok then
          vim.notify('toggleterm.nvim is not loaded!', vim.log.levels.ERROR)
          return
        end

        local Terminal = require('toggleterm.terminal').Terminal

        if not _G._SHELL_TERMINAL then
          _G._SHELL_TERMINAL = Terminal:new {
            cmd = vim.o.shell,
            hidden = true,
            direction = 'float',
            float_opts = { border = 'rounded' },
          }
        end

        _G._SHELL_TERMINAL:toggle()
      end,
      desc = 'Toggle Floating Terminal',
      mode = { 'n', 'i', 'v', 't' },
    },
  },
  config = function()
    require('toggleterm').setup {
      direction = 'float',
      float_opts = { border = 'rounded' },
      close_on_exit = true,
      persist_size = true,
    }

    vim.keymap.set('i', '<C-\\>', function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
      if _G._SHELL_TERMINAL then
        _G._SHELL_TERMINAL:toggle()
      end
    end, { desc = 'Toggle Floating Terminal', noremap = true })

    vim.keymap.set('t', '<C-\\>', function()
      if _G._SHELL_TERMINAL then
        _G._SHELL_TERMINAL:toggle()
      end
    end, { desc = 'Toggle Floating Terminal', noremap = true })
  end,
}
