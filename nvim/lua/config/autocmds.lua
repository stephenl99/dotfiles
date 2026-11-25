-- Automatic actions triggered by events

-- C/C++: let `gf` open system headers like <iostream> and <cstdio>.
-- Asks the compiler for its include folders (once per nvim session) and adds them to 'path'.
local cxx_include_dirs

local function get_cxx_include_dirs()
    if cxx_include_dirs then
        return cxx_include_dirs
    end
    cxx_include_dirs = {}
    local ok, result = pcall(function()
        return vim.system({ "c++", "-E", "-x", "c++", "-", "-v" }, { stdin = "" }):wait()
    end)
    if not ok or not result.stderr then
        return cxx_include_dirs
    end
    local in_list = false
    for line in result.stderr:gmatch("[^\n]+") do
        if line:match("^#include <%.%.%.> search starts here") then
            in_list = true
        elseif line:match("^End of search list") then
            break
        elseif in_list and not line:match("%(framework directory%)") then
            table.insert(cxx_include_dirs, vim.trim(line))
        end
    end
    return cxx_include_dirs
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        for _, dir in ipairs(get_cxx_include_dirs()) do
            vim.opt_local.path:append(dir)
        end
    end,
})
