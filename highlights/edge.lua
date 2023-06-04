local configuration = vim.fn['edge#get_configuration']()
local palette = vim.fn['edge#get_palette'](configuration.style, configuration.dim_foreground, configuration.colors_override)

if configuration.transparent_background == 2 then
  palette.bg1 = palette.none
end

local fg = palette.fg[1]
local bg = palette.bg1[1]
local bg_alt = palette.bg3[1]
local green = palette.green[1]
local red = palette.red[1]
local grey = palette.bg_grey[1]

return { -- this table overrides highlights in edge theme
  TelescopeBorder = { fg = bg_alt, bg = bg },
  TelescopeNormal = { bg = bg },
  TelescopePreviewBorder = { fg = bg, bg = bg },
  TelescopePreviewNormal = { bg = bg },
  TelescopePreviewTitle = { fg = bg, bg = green },
  TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
  TelescopePromptNormal = { fg = fg, bg = bg_alt },
  TelescopePromptPrefix = { fg = red, bg = bg_alt },
  TelescopePromptTitle = { fg = bg, bg = red },
  TelescopePromptCounter = { fg = fg, bg = bg_alt },
  TelescopeResultsBorder = { fg = bg, bg = bg },
  TelescopeResultsNormal = { bg = bg },
  TelescopeResultsTitle = { fg = bg, bg = bg },
  NeoTreeTabActive = { fg = fg, bg = bg_alt },
  NeoTreeTabInactive = { fg = bg, bg = grey },
  NeoTreeTabSeparatorActive = { fg = bg_alt, bg = bg_alt },
  NeoTreeTabSeparatorInactive = { fg = grey, bg = grey },
}
