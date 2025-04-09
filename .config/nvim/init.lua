-- Lazy.nvim'i ayarla
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Genel eklentiler
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
  { "windwp/nvim-autopairs" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim" },
})

-- Leader tuşunu ayarla (Boşluk olarak belirledik)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Kısayollar
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Kaydet" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Çık" })
vim.keymap.set('n', '<leader>x', ':x<CR>', { desc = "Kaydet ve çık" })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Arama vurgusunu kaldır" })

-- Telescope kısayolları (yükleme tamamlandıktan sonra çalıştır)
vim.defer_fn(function()
  local telescope = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Dosya bul" })
  vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Metin ara" })
  vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = "Açık dosyalar" })
  vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = "Yardım etiketleri" })
end, 0)

-- Treesitter kısayolları
vim.keymap.set('n', '<leader>ts', ':TSToggle highlight<CR>', { desc = "Treesitter vurgusunu aç/kapat" })
vim.keymap.set('n', '<leader>tp', ':TSPlaygroundToggle<CR>', { desc = "Treesitter Playground" })
vim.keymap.set('n', '<leader>tn', function()
  vim.cmd('echo nvim_treesitter#statusline()')
end, { desc = "Geçerli Treesitter düğümünü göster" })
vim.keymap.set('n', '<leader>te', ':TSEnable highlight<CR>', { desc = "Treesitter vurgusunu aç" })
vim.keymap.set('n', '<leader>td', ':TSDisable highlight<CR>', { desc = "Treesitter vurgusunu kapat" })

-- VS Code Tarzı Kenar Çubuğu
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
    signcolumn = "yes",
  },
  renderer = {
    highlight_opened_files = "all",
  },
})

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { desc = "Kenar çubuğunu aç/kapat" })

-- Tema ve arka plan rengi
require("onedark").setup({ style = "dark" , transparent = true})
require("onedark").load()


-- Lualine kurulumu
require('lualine').setup()

-- Satır numaralarını göster
vim.opt.number = true
