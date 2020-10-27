local packer = nil
local packer_config = {
  package_root = string.format("%s/site/pack", vim.g.cache_root),
  compile_path = string.format("%s/plugin/packer_compiled.vim", vim.g.local_config_root)
}

local packer_repo_url = 'https://github.com/wbthomason/packer.nvim'
local packer_path = vim.fn['eden#path#join']({vim.g.cache_root, 'site', 'pack', 'packer', 'opt', 'packer.nvim'})
local packer_pack_root = vim.fn['eden#path#join']({vim.g.config_root, 'lua', 'pack'})

function install_packer()
  -- Checking if packer exists
  vim.fn.mkdir(vim.fn.fnamemodify(packer_path, ':p:h'), "p")
  vim.fn.system(string.format("git clone %s %s", packer_repo_url, packer_path))
  local out = vim.fn.system(string.format(
    'git clone %s %s',
    packer_repo_url,
    packer_path
  ))
end

if vim.fn['isdirectory'](packer_path) == 0 then
  install_packer()
end

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init(packer_config)
  end

  packer.reset()

 local source_file = function(file)
   local status, result = pcall(dofile, file)
   if not status then
     print(result)
     return nil
   end
   return result
 end

  -- Packer manage packer as an optional plugin
  packer.use {
    'wbthomason/packer.nvim',
    opt = true,
  }

  local files = vim.fn.split(vim.fn.globpath(packer_pack_root, '**/*.lua'), '\n')
  for _, file in pairs(files) do
    source_file(file)
  end
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins

--local util = require('util')
--local packer = nil


--local pack_root = vim.fn.expand('~/.config/nvim/lua/pack')
--local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

--function install_packer()
--  local repo_url = "https://github.com/wbthomason/packer.nvim"
--  local dest = string.format(
--      "%s/site/pack/packer/opt/",
--      vim.g.cache_root
--  )
--  vim.fn.mkdir(dest, "p")
--  vim.fn.system(string.format("git clone %s %s", repo_url, dest .. "packer.nvim"))

--  -- Adding packer path to the runtimepath and calling PackerInstall
--  pcall(vim.cmd, [[packadd packer.nvim]])

--  -- Call PackerInstall once nvim has finished sourcing config
--  local autocmds = {
--    startup = {
--      { 'VimEnter', '*', [[:PackerSync]] }
--    }
--  }
--  util.create_augroups(autocmds)

--end

--if not packer_exists then
--  install_packer()
--end


--local function init()

--  if packer == nil then
--    packer = require('packer')
--    packer.init(packer_config)
--  end

--  local source_file = function(file)
--    local status, result = pcall(dofile, file)
--    if not status then
--      print(result)
--      return nil
--    end
--    return result
--  end

--  local files = vim.fn.split(vim.fn.globpath(pack_root, '**/*.lua'), '\n')

--  -- Packer manage packer as an optional plugin
--  packer.use { 'wbthomason/packer.nvim', opt = true }

--  for _, file in pairs(files) do
--    source_file(file)
--  end
--end

--local plugins = setmetatable({}, {
--  __index = function(_, key)
--    init()
--    return packer[key]
--  end
--})

--return plugins



---- return require('packer').startup({
----   function()
----     local source_file = function(file)
----       local status, result = pcall(dofile, file)
----       if not status then
----         print(result)
----         return nil
----       end
----       return result
----     end

----     local files = vim.fn.split(vim.fn.globpath(pack_root, '**/*.lua'), '\n')

----     -- Packer manage packer as an optional plugin
----     use { 'wbthomason/packer.nvim', opt = true }

----     for _, file in pairs(files) do
----       source_file(file)
----     end

----   end,
----   config = {
----     package_root = string.format("%s/site/pack", vim.g.cache_root),
----     compile_path = string.format("%s/plugin/packer_compiled.vim", vim.g.local_config_root)
----   }
---- })

---- return require('packer').startup({
----   function()
----     -- Packer manage packer as an optional plugin
----     use { 'wbthomason/packer.nvim', opt = true }
----
----     -- Lsp
----     use {
----       'neovim/nvim-lspconfig',        -- Quickstart configurations for the Nvim LSP client
----       'nvim-lua/completion-nvim',     -- Completion functionalitty for LSP
----       'nvim-lua/diagnostic-nvim',     -- Diagnostic information for LSP
----       'nvim-lua/lsp-status.nvim',     -- LSP status information
----       'nvim-lua/lsp_extensions.nvim', -- LSP extensions like inlay hints
----     }
----
----     -- Languages
----     use {
----       {
----         -- Preview markdown files in browser
----         'iamcco/markdown-preview.nvim',
----         run = function() vim.fn['mkdp#util#install']() end,
----         ft = {'markdown', 'vimwiki'},
----         cmd = 'MarkdownPreview',
----       },
----       {
----         -- syntax highlighting mega pack
----         'sheerun/vim-polyglot',
----         setup = function()
----           vim.g.ployglot_disabled = {'markdown', 'lua'}
----         end
----       },
----     }
----
----     -- Search
----     use {
----       'junegunn/fzf.vim',
----       requires = {
----         { 'junegunn/fzf', run = ':fzf#install()' }
----       }
----     }
----
----     -- Util and quality of life
----     use {
----       'airblade/vim-rooter',
----       'markonm/traces.vim',   -- Improved searching
----       'jiangmiao/auto-pairs', -- Insert or delete brackets, parens, quotes in pair.
----       'mhinz/vim-startify',   -- The fancy start screen for Vim
----     }
----
----     -- Motions and text objects
----     use {
----       'tpope/vim-commentary',        -- Language agnostic comment motions
----       'junegunn/vim-easy-align',
----       'machakann/vim-sandwich',      -- Search/select/edit sandwiched textobjects (surrond)
----       'christoomey/vim-sort-motion',
----       'glts/vim-textobj-comment',    -- Text objects for comments
----       'wellle/targets.vim',          -- Add text objects for pair, quote, seperator, argument, and tag
----       'wellle/line-targets.vim',     -- Add - object for line 'da-'
----       'kana/vim-textobj-user',       -- Create own user text objects
----       'AndrewRadev/sideways.vim',    -- Move the item under the cursor left or right, where an "item" is defined by a delimiter.
----     }
---- 
----     -- Themes
----     use {
----       'arzg/vim-colors-xcode',
----       'sainnhe/gruvbox-material',
----     }
----   end,
----   config = {
----     package_root = string.format("%s/site/pack", vim.g.cache_root),
----     compile_path = string.format("%s/plugin/packer_compiled.vim", vim.g.local_config_root)
----   }
---- })
