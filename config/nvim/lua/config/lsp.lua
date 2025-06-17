-- Python LSP
require('lspconfig').pyright.setup{}
-- Nix LSP
require('lspconfig').nil_ls.setup({
    root_dir = require('lspconfig.util').root_pattern("flake.nix", ".git"),
    on_attach = function(client, bufnr)
    -- Disable formatting from nil_ls
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
    settings = {
        ['nil'] = {
           nix = {
                flake = {
                    autoArchive = true,
                }
            }
        }
    }
})

