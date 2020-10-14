-- https://github.com/tjdevries/config_manager/blob/f2bcbb3/xdg_config/nvim/lua/tj/lsp_extensions.lua

local inlay_hints = require('lsp_extensions.inlay_hints')
local extentions = {}

extentions.show_line_hints = function()
  vim.lsp.buf_request(0, 'rust_analyzer/inlayHints', inlay_hints.get_params(), inlay_hints.get_callback {
    only_current_line = true
  })
end

extentions.show_line_hints_on_cursor_events = function()
  vim.cmd [[augroup ShowLineHints]]
  vim.cmd [[  au!]]
  vim.cmd [[  autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua require('eden.lsp_extensions').show_line_hints()]]
  vim.cmd [[augroup END]]
end

return extentions
