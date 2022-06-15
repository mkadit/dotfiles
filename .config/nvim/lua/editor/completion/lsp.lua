local lsp_installer = require "nvim-lsp-installer"
local lspconfig = require "lspconfig"

USER = vim.fn.expand "$USER"
DATA = vim.fn.stdpath "data"

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capability = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.setup {
    ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "sumneko_lua",
        "svelte",
        "tailwindcss",
        "tsserver",
        "taplo",
        "yamlls",
    },
}

local installed_lsp = lsp_installer.get_installed_servers()

for _, server in pairs(installed_lsp) do
    local opts = {
        capabilities = capability,
        on_attach = function(client)
            local aerial = require "aerial"
            aerial.on_attach(client)
        end,
    }
    -- TODO: Find fix for unable to use in standalone
    if server.name == "rust_analyzer" then
        local extension_path = os.getenv "HOME" .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
        require("rust-tools").setup {
            dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
        }
    end
    lspconfig[server.name].setup {
        -- capabilities = opts.capabilities,
        -- on_attach = opts.on_attach,
    }
end

-- TODO: Import all of this root_dir to the function above
-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--     capabilities = capability,
--     on_attach = function(client)
--       local aerial = require "aerial"
--       aerial.on_attach(client)
--     end,
--   }

--   if server.name == "gopls" then
--     opts.root_dir = function(filename)
--       return lspconfig.util.root_pattern("go.mod", ".git", "main.go")(filename)
--           or lspconfig.util.path.dirname(filename)
--     end
--   elseif server.name == "bashls" then
--     opts.root_dir = function(filename)
--       return lspconfig.util.root_pattern ".git" (filename) or lspconfig.util.path.dirname(filename)
--     end
--   elseif server.name == "pyright" then
--     opts.root_dir = function(filename)
--       return lspconfig.util.root_pattern("pyproject.toml", ".git")(filename)
--           or lspconfig.util.path.dirname(filename)
--     end
--   elseif server.name == "jdtls" then
--     opts.root_dir = function(filename)
--       return require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" }
--           or lspconfig.util.path.dirname(filename)
--     end
--   elseif server.name == "tsserver" then
--     opts.root_dir = function(filename)
--       return lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(filename)
--           or lspconfig.util.path.dirname(filename)
--     end
--     opts.on_attach = function(client, bufnr)
--       local util = require "nvim-lsp-ts-utils"
--       util.setup {

--         debug = false,
--         disable_commands = false,
--         enable_import_on_completion = true,
--         import_all_timeout = 5000, -- ms

--         -- update imports on file move
--         update_imports_on_move = true,
--         require_confirmation_on_move = true,
--         -- watch_dir = nil,

--         -- filter diagnostics
--         -- filter_out_diagnostics_by_severity = { "hint" },
--         -- filter_out_diagnostics_by_code = {},
--       }
--       util.setup_client(client)
--     end
--   end

--   if server.name == "jdtls" then
--     vim.api.nvim_exec(
--       [[
-- 		if has('nvim-0.5')
-- 		  augroup lsp
-- 			au!
-- 			autocmd FileType java lua require'modules.java-config'.setup()
-- 		  augroup end
-- 		endif
-- 		]]   ,
--       false
--     )
--   end
--   vim.cmd [[ do User LspAttachBuffers ]]
-- end)