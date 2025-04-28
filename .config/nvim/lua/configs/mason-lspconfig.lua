local lspconfig = package.loaded["lspconfig"]

-- List of servers to ignore during install.
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

-- Build a list of LSPs to install, excluding the ignored list.
local servers = {}
for _, server in ipairs(lspconfig.servers) do
    if not table_contains(ignore_install, server) then
        table.insert(servers, server)
    end
end

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = false,
})
