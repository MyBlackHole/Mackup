--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
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

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["s"]["o"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" }
lvim.builtin.which_key.mappings["f"] = {
  name = "Flutter",
  r = { "<cmd>FlutterRun<CR>", "FlutterRun" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
}

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
lvim.builtin.notify.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
-- 格式化
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- set additional linters
-- 语法校验
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  -- {
  --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "shellcheck",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--severity", "warning" },
  -- },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- Additional Plugins
lvim.plugins = {
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    config = function()
      require("flutter-tools").setup {}
    end,
  },
  -- { "norcalli/nvim-colorizer.lua" },
  { "p00f/nvim-ts-rainbow" },
  { "folke/tokyonight.nvim" },
  { "voldikss/vim-translator" },
  { "lunarvim/colorschemes" },
  { "folke/trouble.nvim" },
}


-- require("colorizer").setup()
require("flutter-tools").setup()
require('symbols-outline').setup()
-- require("nvim-treesitter").setup {}
require("nvim-treesitter.configs").setup {
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = {
    enable = true
  }
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
    pattern = { "*.py", "*.c", "*.h" },
    -- enable wrap mode for json files only
    command = "%s/[\\u0d]//ge",
  }
)

vim.cmd('source ~/.config/lvim/lua/user/lualine.lua')
