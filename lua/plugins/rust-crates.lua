return {
    {
        "saecki/crates.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        event = { "BufRead Cargo.toml" },
    },
}
