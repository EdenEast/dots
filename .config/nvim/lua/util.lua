local util = {}

--- Create an autocmd with group and table provided
---@param definiton A table defining a group and autocmds
---Example:
-- local autocmds = {
--    startup = {
--      { "VimEnter", "*", [[lua require('something')]] }
--    }
-- }
util.create_augroups = function(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

return util
