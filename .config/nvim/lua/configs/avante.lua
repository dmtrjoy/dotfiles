local options = {
    auto_suggestions_provider = "gemini",
    provider = "ollama",
    ollama = {
        model = "deepseek-r1:latest",
    },
}

require("avante").setup(options)
