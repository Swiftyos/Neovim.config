return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'slant',
        -- LSP indicators
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,

        -- Close icons
        show_close_icon = true,
        show_buffer_close_icons = true,

        -- Tabpages
        -- show_tab_indicators = true,

        -- Hover events
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        highlights = {
          -- Customize slant colors
          separator = {
            fg = '#313244', -- Change this to your desired color
            bg = '#1e1e2e',
          },
          separator_selected = {
            fg = '#1e1e2e',
            bg = '#1e1e2e',
          },
          separator_visible = {
            fg = '#1e1e2e',
            bg = '#1e1e2e',
          },
          -- Background fill color
          fill = {
            bg = '#181825', -- The background behind all tabs
          },
        },
        -- Other useful options
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
        },
      },
    }
  end,
}
