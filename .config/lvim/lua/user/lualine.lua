-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local mode_map = {
  ['n']        = { '#569CD6', 'NORMAL' },
  ['i']        = { '#D16969', 'INSERT' },
  ['R']        = { '#D16969', 'REPLACE ' },
  ['c']        = { '#608B4E', 'COMMAND ' },
  ['v']        = { '#C586C0', 'VISUAL' },
  ['V']        = { '#C586C0', 'VIS-LN' },
  ['']        = { '#C586C0', 'VIS-BLK' },
  ['s']        = { '#FF8800', ' SELECT ' },
  ['S']        = { '#FF8800', ' SEL-LN ' },
  ['']        = { '#DCDCAA', 'SEL-BLK ' },
  ['t']        = { '#569CD6', 'TERMINAL' },
  ['Rv']       = { '#D16D69', 'VIR-REP ' },
  ['rm']       = { '#FF0000', '- More -' },
  ['r']        = { '#FF0000', "- Hit-Enter -" },
  ['r?']       = { '#FF0000', "- Confirm -" },
  ['cv']       = { '#569CD6', "Vim Ex Mode" },
  ['ce']       = { '#569CD6', "Normal Ex Mode" },
  ['!']        = { '#569CD6', "Shell Running" },
  ['ic']       = { '#DCDCAA', 'Insert mode completion |compl-generic|' },
  ['no']       = { '#DCDCAA', 'Operator-pending' },
  ['nov']      = { '#DCDCAA', 'Operator-pending (forced charwise |o_v|)' },
  ['noV']      = { '#DCDCAA', 'Operator-pending (forced linewise |o_V|)' },
  ['noCTRL-V'] = { '#DCDCAA', 'Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character' },
  ['niI']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Insert-mode|' },
  ['niR']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Replace-mode|' },
  ['niV']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|' },
  ['ix']       = { '#DCDCAA', 'Insert mode |i_CTRL-X| completion' },
  ['Rc']       = { '#DCDCAA', 'Replace mode completion |compl-generic|' },
  ['Rx']       = { '#DCDCAA', 'Replace mode |i_CTRL-X| completion' },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
lvim.builtin.lualine.sections = {
  lualine_a = {}, lualine_b = {}, lualine_c = {},
  lualine_x = {}, lualine_y = {}, lualine_z = {}
}
lvim.builtin.lualine.inactive_sections = {
  lualine_a = {}, lualine_b = {}, lualine_c = {},
  lualine_x = {}, lualine_y = {}, lualine_z = {}
}


-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(lvim.builtin.lualine.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(lvim.builtin.lualine.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}


ins_left {
  function()
    return mode_map[vim.fn.mode()][2]
  end,
  -- mode component
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_map[vim.fn.mode()][1] }
  end,
  icon = '',
  padding = { right = 0 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  path = 1;
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}
