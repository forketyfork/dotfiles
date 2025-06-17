require("conform").setup({
    formatters_by_ft = {
        nix = { "alejandra" },
    },
    formatters = {
        alejandra = {
            command = "alejandra",
            args = { "-" },
            stdin = true,
        },
    },
})

