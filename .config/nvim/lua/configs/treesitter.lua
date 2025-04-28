local options = {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "rust",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
