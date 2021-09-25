local lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require('lspconfig')

USER = vim.fn.expand('$USER')
DATA = vim.fn.stdpath('data')


local capability = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {"clangd", "tsserver"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capability,
    }
end

lsp_installer.on_server_ready(function(server)
    local opts = {
		capabilities = capability,
	}

    if server.name == "gopls" then
		opts.root_dir = function(filename)
            return nvim_lsp.util.root_pattern("go.mod", ".git", "main.go")(filename) or nvim_lsp.util.path.dirname(filename)
		end
    elseif server.name == "pyright" then
		opts.root_dir = function(filename)
            return nvim_lsp.util.root_pattern(".git")(filename) or nvim_lsp.util.path.dirname(filename)
		end
    end

    server:setup(opts)
	if server.name == "jdtls" then
		vim.api.nvim_exec([[
		if has('nvim-0.5')
		  augroup lsp
			au!
			autocmd FileType java lua require'modules.lsp.java-config'.setup()
		  augroup end
		endif
		]], false)
	end
    vim.cmd [[ do User LspAttachBuffers ]]
end)
