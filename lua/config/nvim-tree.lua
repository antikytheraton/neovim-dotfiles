local M = {}

M.config = {
    filters = {
        dotfiles = false,
        exclude = { "custom" },
    },
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = { "alpha" },
    open_on_tab = false,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    view = {
        side = "left",
        width = 25,
        hide_root_folder = true,
    },
    git = {
        enable = true,
        ignore = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    renderer = {
        highlight_git = false,
        highlight_opened_files = "none",

        indent_markers = {
            enable = false,
        },
        icons = {
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
}

M.setup = function()
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
        return
    end
    nvim_tree.setup(M.config)
end

return M
