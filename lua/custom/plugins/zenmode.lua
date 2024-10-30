return {
  'folke/zen-mode.nvim',
  config = function()
    -- Track Zen mode state manually
    local zen_mode_active = false

    -- <leader>zz to toggle Zen mode with custom settings (90 width, line numbers on)
    vim.keymap.set('n', '<leader>zz', function()
      require('zen-mode').setup {
        window = {
          width = 90,
          options = {},
        },
      }
      -- Toggle Zen mode
      require('zen-mode').toggle()

      -- Toggle Zen mode state manually
      zen_mode_active = not zen_mode_active

      -- Set window options when Zen mode is toggled
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
    end)

    -- <leader>zZ to toggle Zen mode with alternative settings (80 width, line numbers off)
    vim.keymap.set('n', '<leader>zZ', function()
      require('zen-mode').setup {
        window = {
          width = 80,
          options = {},
        },
      }
      -- Toggle Zen mode
      require('zen-mode').toggle()

      -- Set window options when Zen mode is toggled
      vim.wo.wrap = false
      vim.wo.number = false
      vim.wo.rnu = false
      vim.opt.colorcolumn = '0'

      -- Reset to default color scheme
      ColorMyPencils() -- This will use the default 'catppuccin' as per your function
    end)
  end,
}
