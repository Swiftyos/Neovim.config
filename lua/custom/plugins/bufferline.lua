return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- Buffer navigation
    vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
    vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close buffer' })
    vim.keymap.set('n', '<leader>bs', ':BufferLinePick<CR>', { desc = 'Pick buffer' })

    require('bufferline').setup {
      options = {
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        show_close_icon = true,
        show_buffer_close_icons = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
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

    -- Apply highlights after colorscheme loads
    local function set_bufferline_colors()
      local bg_inactive = '#1e1e2e' -- Background for inactive buffers
      local bg_selected = '#313244' -- Background for selected buffer
      local bg_fill = '#181825' -- Background behind all tabs

      -- The key: separator fg should match the bg of the buffer it's attached to
      vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = bg_fill })

      -- Inactive buffer separators
      vim.api.nvim_set_hl(0, 'BufferLineSeparator', {
        fg = bg_inactive, -- Match inactive buffer bg
        bg = bg_fill,
      })

      -- Selected buffer separators
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', {
        fg = bg_selected, -- Match selected buffer bg
        bg = bg_fill,
      })

      -- Visible buffer separators (when you have splits)
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', {
        fg = bg_inactive,
        bg = bg_fill,
      })
    end

    -- Set colors now
    set_bufferline_colors()

    -- Re-apply after colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = set_bufferline_colors,
    })
  end,
}
