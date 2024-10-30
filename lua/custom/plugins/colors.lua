function ColorMyPencils(color)
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = true,
      }

      vim.cmd 'colorscheme rose-pine'

      ColorMyPencils()
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_colour = '#000000',
        level = 'INFO',
        timeout = 3000,
        max_width = 80,
        max_height = 20,
        stages = 'fade_in_slide_out',
        icons = {
          ERROR = '',
          WARN = '',
          INFO = '',
          DEBUG = '',
          TRACE = '✎',
        },
        time_formats = {},
        on_open = function() end,
        on_close = function() end,
        render = 'default',
        minimum_width = 50,
        fps = 30,
        top_down = true,
      }
    end,
  },
}
