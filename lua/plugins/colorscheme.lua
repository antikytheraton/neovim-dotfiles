-- Theme/Colorscheme (uncomment section for whichever theme you prefer or use your own)

local light_neofusion = {
  -- background ramp (inverted: dark→light)
  dark0 = "#EDF4F7",
  dark1 = "#DFF0F5",
  dark2 = "#C8E4EE",
  dark3 = "#A8D0E0",
  dark4 = "#7AAEC8",
  -- foreground/accent ramp (inverted: light→dark)
  light0 = "#06364B",
  light1 = "#06364B",
  light2 = "#08435E",
  light3 = "#0A5070",
  light4 = "#22536f",
  -- lava red family — darkened for light bg contrast
  bright_red = "#C82800",
  bright_yellow = "#C82800",
  bright_orange = "#C82800",
  neutral_red = "#C82800",
  neutral_yellow = "#C82800",
  neutral_orange = "#1A7ACC",
  faded_red = "#C82800",
  faded_yellow = "#D04A20",
  faded_orange = "#D04A20",
  dark_red = "#8C1A18",
  light_red = "#E05030",
  -- ice blue family — darkened for light bg contrast
  bright_green = "#1A7ACC",
  neutral_green = "#1A7ACC",
  neutral_aqua = "#0A6080",
  faded_green = "#3A5A18",
  faded_aqua = "#3A5A18",
  dark_green = "#3A5A18",
  light_green = "#5A7A10",
  dark_aqua = "#A8D0E0",
  light_aqua = "#C8E8B0",
  -- magenta — darkened
  bright_purple = "#A01880",
  neutral_purple = "#A01880",
  faded_purple = "#A01880",
  -- blue (neutral surfaces)
  bright_blue = "#0A1E30",
  bright_aqua = "#0A1E30",
  neutral_blue = "#1A5070",
  faded_blue = "#C8E4EE",
  -- gray
  gray = "#4A7A90",
}

local teenKOii_light = {
  -- background ramp: cool industrial gray (chassis surface steps)
  dark0 = "#DCDCDA",
  dark1 = "#D0D0CE",
  dark2 = "#C4C4C2",
  dark3 = "#B8B8B6",
  dark4 = "#ACACAA",
  -- foreground ramp: pushed darker for contrast
  light0 = "#0A0A0A",
  light1 = "#0A0A0A",
  light2 = "#141412",
  light3 = "#1E1E1C",
  light4 = "#2A2A28",
  -- lava orange family (unchanged)
  bright_red = "#E8541A",
  bright_yellow = "#E8541A",
  bright_orange = "#E8541A",
  neutral_red = "#C84000",
  neutral_yellow = "#C84000",
  neutral_orange = "#C84000",
  faded_red = "#A83800",
  faded_yellow = "#A83800",
  faded_orange = "#A83800",
  dark_red = "#7A2800",
  light_red = "#FF7A3D",
  -- no green/aqua — mapped to dark grays (much darker now)
  bright_green = "#1E1E1C",
  neutral_green = "#141412",
  faded_green = "#2A2A28",
  dark_green = "#383836",
  light_green = "#444442",
  bright_aqua = "#585856",
  neutral_aqua = "#4A4A48",
  faded_aqua = "#3E3E3C",
  dark_aqua = "#686866",
  light_aqua = "#747472",
  -- blue → near-black (maximum contrast for UI chrome)
  bright_blue = "#0A0A0A",
  neutral_blue = "#141412",
  faded_blue = "#1E1E1C",
  -- purple → orange (unchanged)
  bright_purple = "#FF7A3D",
  neutral_purple = "#E8541A",
  faded_purple = "#C84000",
  -- gray → true mid, readable on both ends
  gray = "#505050",
}

-- Neofusion Theme
return {
  "diegoulloao/neofusion.nvim",
  lazy = false,    -- We want the colorscheme to load immediately when starting Neovim
  priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
  config = function(_, opts)
    require("neofusion").setup({
      -- palette_overrides = light_neofusion
      -- palette_overrides = teenKOii_light
    })
    vim.cmd("colorscheme neofusion") -- Replace this with your favorite colorscheme
  end
}
