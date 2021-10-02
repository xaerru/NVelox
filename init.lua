HOME = os.getenv("HOME")

vim.opt.rtp:remove(vim.fn.stdpath "config")

local ok, config = pcall(require, "nvlx")

if not ok then
    print(config)
end

require("nvelox.init")
