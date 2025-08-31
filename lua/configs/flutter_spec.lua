return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
},
{
  'wa11breaker/flutter-bloc.nvim',
  dependencies = {
      "nvimtools/none-ls.nvim", -- Required for code actions
  },
  event = "BufRead *.dart",
  opts = {
    bloc_type = 'default', -- Choose from: 'default', 'equatable', 'freezed'
    use_sealed_classes = false,
    enable_code_actions = true,
  }
}
}
