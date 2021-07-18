local function set(value, to)
    to = to or true
    vim.opt[value] = to
end
