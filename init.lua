-- {{{VIM.OPT   
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
-- }}}
-- {{{   
-- Space as leader key {{{
vim.g.mapleader = ' '
-- }}}
-- Commands {{{
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', 'cc', 'zc')
-- }}}
-- }}}
-- {{{ 󰒲  

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  -- lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
	  vim.g.plugins_ready = true
	end

	lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
	lazy.opts = {}
	
	lazy.setup({
	  {'folke/tokyonight.nvim'},
	  {'kyazdani42/nvim-web-devicons'},
	  {'nvim-lualine/lualine.nvim'},
	})
	
	---
	vim.opt.termguicolors = true
	vim.cmd.colorscheme('tokyonight')
	
	vim.opt.showmode = false
	require('lualine').setup({
	  options = {
	    icons_enabled = false,
	    theme = 'tokyonight',
	    component_separators = '|',
	    section_separators = '',
	  },
	})
-- }}}
-- vim:foldmethod=marker:foldlevel=0
