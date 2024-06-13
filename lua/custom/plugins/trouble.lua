return {
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {}

      vim.keymap.set('n', '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[T]oggle [T]rouble' })
      vim.keymap.set('n', '<leader>td', '<cmd>Trouble todo toggle<cr>', { desc = 'Toggle [T]rouble To[D]o' })

      vim.keymap.set('n', '[t', function()
        require('trouble').next { skip_groups = true, jump = true }
      end)

      vim.keymap.set('n', ']t', function()
        require('trouble').previous { skip_groups = true, jump = true }
      end)
    end,
  },
}
