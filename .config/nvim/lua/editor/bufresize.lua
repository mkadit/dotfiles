local opts = {noremap = true, silent = true}
require("bufresize").setup({
    register = {
        keys = {
            {"n", "<C-w><", "<C-w><", opts},
            {"n", "<C-w>>", "<C-w>>", opts},
            {"n", "<C-w>+", "<C-w>+", opts},
            {"n", "<C-w>-", "<C-w>-", opts},
            {"n", "<C-w>_", "<C-w>_", opts},
            {"n", "<C-w>=", "<C-w>=", opts},
            {"n", "<C-w>|", "<C-w>|", opts}
        },
        trigger_events = {"BufWinEnter", "WinEnter"}
    },
    resize = {keys = {}, trigger_events = {"VimResized"}}
})