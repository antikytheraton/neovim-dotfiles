local M = {}

M.config = {
    contrast = {
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        line_numbers = false, -- Enable contrast background for line numbers
        sign_column = false, -- Enable contrast background for the sign column
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        popup_menu = false, -- Enable lighter background for the popup menu
    },
    italics = {
        comments = true, -- Enable italic comments
        keywords = true, -- Enable italic keywords
        functions = true, -- Enable italic functions
        strings = true, -- Enable italic strings
        variables = true -- Enable italic variables
    },
    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
        --		"terminal", -- Darker terminal background
        "packer", -- Darker packer background
        --		"qf" -- Darker qf list background
    },
    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true -- Enable higher contrast text for darker style
    },
    disable = {
        borders = false, -- Disable borders between vertically split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },
    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    custom_highlights = {}, -- Overwrite highlights with your own
    lualine_style = 'default'
}

M.setup = function()
    local status_ok, material = pcall(require, "material")
    if not status_ok then
        return
    end

    material.setup(M.config)
    vim.g.material_style = "deep ocean"
    vim.cmd("colorscheme material")
end

return M
