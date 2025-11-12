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
      local bg_inactive = '#1e1e2e' -- Inactive buffer background
      local bg_selected = '#313244' -- Selected buffer background
      local bg_fill = '#181825' -- Background behind all tabs

      -- Main fill (background behind everything)
      vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = bg_fill })

      -- Tab backgrounds
      vim.api.nvim_set_hl(0, 'BufferLineBackground', { bg = bg_inactive })
      vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { bg = bg_selected, bold = true })
      vim.api.nvim_set_hl(0, 'BufferLineBufferVisible', { bg = bg_inactive })

      -- Separators (slants)
      vim.api.nvim_set_hl(0, 'BufferLineSeparator', {
        fg = bg_inactive,
        bg = bg_fill,
      })
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', {
        fg = bg_selected,
        bg = bg_fill,
      })
      vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', {
        fg = bg_inactive,
        bg = bg_fill,
      })

      -- Tab area (the group indicators on the right)
      vim.api.nvim_set_hl(0, 'BufferLineTab', { bg = bg_fill })
      vim.api.nvim_set_hl(0, 'BufferLineTabSelected', { bg = bg_fill })
      vim.api.nvim_set_hl(0, 'BufferLineTabSeparator', { fg = bg_fill, bg = bg_fill })
      vim.api.nvim_set_hl(0, 'BufferLineTabSeparatorSelected', { fg = bg_fill, bg = bg_fill })
    end

    -- Set colors now
    set_bufferline_colors()

    -- Re-apply after colorscheme changes
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = set_bufferline_colors,
    })
  end,
}
