local null_ls = require "null-ls"

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath "config" .. "/.prettierrc"
local sources = {
  null_ls.builtins.diagnostics.vale.with{
    filetypes={
      "markdown",
      "text",
      "norg",
      "make"
    }
  },
  null_ls.builtins.formatting.stylua.with {
    args = {
      "--config-path",
      vim.fn.stdpath "config" .. "/stylua.toml",
      "-",
    },
  },
  -- python
  -- null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.autopep8,
  -- javascript
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.code_actions.eslint_d,
  null_ls.builtins.formatting.eslint_d,
  -- shell
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.diagnostics.shellcheck,

  -- others
  null_ls.builtins.formatting.prettierd.with {
    filetypes = {
      "css",
      "html",
      "javascript",
      "javascript.jsx",
      "javascriptreact",
      "json",
      "jsonc",
      "markdown",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
      "yaml",
    },
  },
  -- null_ls.builtins.diagnostics.write_good,
  -- null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup {
  debounce = 150,
  sources = sources,
}

vim.api.nvim_create_user_command("NullLsToggle", function()
    -- you can also create commands to disable or enable sources
    require("null-ls").toggle({})
end, {})

vim.keymap.set("n", "<leader>lf", "<CMD>NullLsToggle<CR>", { noremap = true, silent = true })
