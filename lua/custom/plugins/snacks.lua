return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>gg',
      function()
        require('snacks').lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        require('snacks').lazygit.log()
      end,
      desc = 'Lazygit Log',
    },
    {
      '<leader>gf',
      function()
        require('snacks').lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
  },
}
