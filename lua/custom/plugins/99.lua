return {
  dir = '/Users/swifty/dev/learning/99',
  config = function()
    local _99 = require '99'
    _99.setup {
      -- your config here
      model = 'openrouter/z-ai/glm-4.7',
      logger = {
        level = _99.DEBUG,
        path = '/tmp/.99.debug',
        print_on_error = true,
      },
    }

    vim.keymap.set('n', '<leader>9f', function()
      _99.fill_in_function()
    end)
    vim.keymap.set('v', '<leader>9v', function()
      _99.visual()
    end)
    vim.keymap.set('v', '<leader>9s', function()
      _99.stop_all_requests()
    end)
  end,
}
