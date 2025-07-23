return {
  'nvim-telescope/telescope-media-files.nvim',
  lazy = true,
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require 'media_files'.setup()
    require 'telescope'.load_extension('media_files')
    require 'telescope'.setup {
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg" },
          -- find command (defaults to `fd`)
          find_cmd = "rg"
        }
      },
    }
  end,
}
