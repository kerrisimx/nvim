return {'akinsho/toggleterm.nvim', version = "*", config = true, 
  keys = {
         {"<leader>tf", ":ToggleTerm direction=float dir=%:p:h<CR>", desc = "Open floating terminal window" }, -- open terminal in the directory of the file
         {"<leader>tv", ":ToggleTerm direction=vertical dir=%:p:h<CR>", desc = "Open vertical terminal window" },
  }
}

