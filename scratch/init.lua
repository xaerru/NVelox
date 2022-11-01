function _G.join_paths(...)
  local result = table.concat({ ... }, "/")
  return result
end

vim.opt.rtp:remove(join_paths(vim.call("stdpath", "data"), "site"))
vim.opt.rtp:remove(join_paths(vim.call("stdpath", "data"), "site", "after"))
vim.opt.rtp:remove(vim.call("stdpath", "config"))
vim.opt.rtp:remove(join_paths(vim.call("stdpath", "config"), "after"))
