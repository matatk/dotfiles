-- Thanks to https://githugtb.com/ThePrimeagen/init.lua for getting this going

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO: Split/package as https://github.com/folke/lazy.nvim#-structuring-your-plugins
require'lazy'.setup('plugins')

require 'colours'  -- TODO: redo lazily
require 'map'
require 'set'
require 'netrw'
