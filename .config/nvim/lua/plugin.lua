local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  local repo_url = "https://github.com/wbthomason/packer.nvim"
  local dest = string.format(
      "%s/site/pack/packer/opt/",
      vim.g.cache_root
  )

  vim.fn.mkdir(dest, "p")
  print("Downloading packer")
  local out = vim.fn.system(string.format("git clone %s %s", repo_url, dest .. "packer.nvim"))
  print(out)
  print("packer.nvim installed")
end

return require('packer').startup({
  function()
    -- Packer manage packer as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    use 'junegunn/fzf.vim'

    -- Lsp
    -- use 'neovim/nvim-lspconfig'
    -- use 'nvim-lua/plenary.nvim'
    -- use 'nvim-lua/completion-nvim'
    -- use 'nvim-lua/diagnostic-nvim'
    -- use 'nvim-lua/popup.nvim'
    -- use 'nvim-lua/lsp-status.nvim'

    -- Languages
    -- use 'vmchale/just-vim'
    -- use {'iamcco/markdown-preview.nvim', ft = ['markdown'], run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    -- use 'rust-lang/rust.vim'

    -- Themes
    use 'arzg/vim-colors-xcode'
    use 'sainnhe/gruvbox-material'
  end,
  config = {
    package_root = string.format("%s/site/pack", vim.g.cache_root),
  }
})
