local options = {
    formatters_by_ft = {
        lua = { "stylua" },
    },

    format_on_save = {
        -- Options are passed to conform.format().
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
