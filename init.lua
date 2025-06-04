require("config.lazy")
require("config.options")
require("config.keymaps")
require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
require('lualine').setup()
require("telescope").load_extension "file_browser"