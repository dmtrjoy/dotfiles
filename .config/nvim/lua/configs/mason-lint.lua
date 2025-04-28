local lint = package.loaded["lint"]

-- List of linters to ignore during install.
local ignore_install = {}

-- Checks if a value is in a table.
local function table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Build a list of linters to install, excluding the ignored list.
local linters = {}
for _, v in pairs(lint.linters_by_ft) do
    for _, linter in ipairs(v) do
        if not table_contains(ignore_install, linter) then
            table.insert(linters, linter)
        end
    end
end

require("mason-nvim-lint").setup({
    ensure_installed = linters,
    automatic_installation = false,
})
