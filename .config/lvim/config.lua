--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- 主题
lvim.colorscheme = "lunar"
-- lvim.colorscheme = "onedarker"
-- 关闭保存时格式化
lvim.format_on_save.enabled = false
-- 写入文件的编码
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,gbk"
vim.opt.fileformats = "unix"
vim.auto_complete = true
-- -- 搜索到文件两端时不重新搜索
-- vim.opt.nowrapscan = true
-- 允许neovim 访问系统剪贴板
vim.opt.clipboard = "unnamedplus"
-- 突出显示搜索模式的所有匹配项
vim.opt.hlsearch = true
-- 创建备份文件
vim.opt.backup = false
-- 总是显示标签
vim.opt.showtabline = 2
-- 设置编号行
vim.opt.number = true
-- 高亮当前行
vim.opt.cursorline = true
-- 将行显示为一长行
vim.opt.wrap = false
-- 移动光标时保留上下左右指定行列
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- 将制表符转换为空格
vim.opt.expandtab = true
-- 如果一个文件正在被另一个程序编辑（或在另一个程序编辑时被写入文件），则不允许编辑它
vim.opt.writebackup = false
-- 启用持久撤销
vim.opt.undofile = true
-- 创建交换文件
vim.opt.swapfile = false
-- 再次让缩进更智能
vim.opt.smartindent = true
-- 智能案例
vim.opt.smartcase = true
-- 换行缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- 自动缩进:产考上一行
vim.opt.autoindent = true
-- 使用C/C++语言自动缩进
vim.opt.cindent = true
-- 关闭鼠标
vim.opt.mouse = ""
-- 开启光标所在行相对行号
vim.opt.relativenumber = true
-- 命令行高度
vim.opt.cmdheight = 1
-- 启用语法高亮
vim.opt.syntax = "enable"
-- 按语法高亮折叠
-- vim.opt.foldmethod = "indent"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- 显示所有符号
vim.opt.list = true
-- 光标在行首的时候，使用左右方向键可以跳转到上一行或下一行
vim.opt.whichwrap = "<,>,[,]"
-- 当文件被外部程序修改的时候 自动加载修改后的内容
vim.g.autoread = true
vim.bo.autoread = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["H"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>"
lvim.keys.normal_mode["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>"
-- lvim.transparent_window = true

-- Use which-key to add extra bindings with the leader-key prefix
-- 打开项目
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- 打开函数树
lvim.builtin.which_key.mappings["S"] = {
  name = "symbols-outline",
  o = { "<cmd>SymbolsOutlineOpen<CR>", "SymbolsOutlineOpen" },
  c = { "<cmd>SymbolsOutlineClose<CR>", "SymbolsOutlineClose" },
}

-- flutter-tools
lvim.builtin.which_key.mappings["f"] = {
  name = "Flutter",
  r = { "<cmd>FlutterRun<CR>", "FlutterRun" },
}

-- 诊断 key map
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
}

-- 翻译
lvim.builtin.which_key.vmappings["t"] = {
  name = "+Translate",
  t = { "<cmd>Translate<cr>", "Translate" },
  r = { "<cmd>TranslateR<cr>", "TranslateR" },
  l = { "<cmd>TranslateL<cr>", "TranslateL" },
  h = { "<cmd>TranslateH<cr>", "TranslateH" },
  w = { "<cmd>TranslateW<cr>", "TranslateW" },
  x = { "<cmd>TranslateX<cr>", "TranslateX" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.cmp.completion.keyword_length = 2
-- lvim.builtin.telescope.defaults.layout_config.width = 0.95
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  -- "json",
  "lua",
  "python",
  -- "typescript",
  -- "css",
  "rust",
  -- "java",
  "yaml",
  "go",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- :LvimCacheReset (必须执行才生效)

-- 添加到自动配置服务跳过列表
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- 移除 跳过列表中 pylsp 项
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "pylsp"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- set a formatter, this will override the language server formatting capabilities (if it exists)
-- 格式化
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black",        filetypes = { "python" } },
  { command = "isort",        filetypes = { "python" } },
  { command = "markdownlint", filetypes = { "Markdown" } },
}

-- set additional linters
-- 语法校验
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8",        filetypes = { "python" } },
  { command = "golangci-lint", filetypes = { "go" } },
  { command = "markdownlint",  filetypes = { "Markdown" } },
}

-- Additional Plugins
lvim.plugins = {
  -- 代码函数树
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  -- flutter-tools
  {
    'akinsho/flutter-tools.nvim',
    config = function()
      require("flutter-tools").setup()
    end,
  },
  -- { "norcalli/nvim-colorizer.lua" },
  -- -- 彩虹括号
  -- { "mrjones2014/nvim-ts-rainbow" },
  -- 翻译
  { "voldikss/vim-translator" },
  -- { "lunarvim/colorschemes" },
  -- 诊断
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
  },
  -- { "hrsh7th/vim-vsnip" },
  -- { "hrsh7th/vim-vsnip-integ" },
  -- { "hrsh7th/cmp-cmdline" },
  -- { "ryanoasis/vim-devicons" },
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- 自动操作
-- lvim.autocommands.custom_groups = {
--   -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
--   { "BufWinEnter", "*.py,*.c,*.h", "" },
--   -- { "BufNewFile", "*.py", "set fileformats=unix" },
-- }

vim.api.nvim_create_autocmd(
  "BufWinEnter",
  {
    pattern = { "*.py", "*.c", "*.h", "*.cpp", "Makefile", "*.s", "*.ld" },
    -- enable wrap mode for json files only
    command = "%s/[\\u0d]//ge",
  }
)

vim.cmd('source ~/.config/lvim/lua/user/lualine.lua')
