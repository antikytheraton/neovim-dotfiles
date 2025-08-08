local plugins = {
  ts         = 'https://github.com/nvim-treesitter/nvim-treesitter',
  ts_context = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
  -- ADD ADDITIONAL PLUGINS THAT ARE _NECESSARY_ TO REPRODUCE THE ISSUE
}

for name, url in pairs(plugins) do
  local install_path = '/tmp/nvim/site/'..name
  if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system { 'git', 'clone', '--depth=1', url, install_path }
  end
  vim.o.runtimepath = install_path..','..vim.o.runtimepath
end

-- ADD INIT.LUA SETTINGS THAT IS _NECESSARY_ FOR REPRODUCING THE ISSUE
