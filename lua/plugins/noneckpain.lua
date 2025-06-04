return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = { "NoNeckPain" },
    keys = {
        { "<leader>bz", "<cmd>NoNeckPain<cr>", desc = "No Neck Pain" },
    },
    opts = {
        buffers = { 
            wo = { 
                number = true,
                relativenumber = true
            },
         },
    },
};