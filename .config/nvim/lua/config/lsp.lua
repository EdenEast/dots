local nvim_lsp = require('nvim_lsp')
local diagnostic = require('diagnostic')


local servers = {
  rust_analyzer = {},
  vimls = {},
}

local function on_attach(client, bufnr)
end

local default_config = {
  on_attach = on_attach
}
