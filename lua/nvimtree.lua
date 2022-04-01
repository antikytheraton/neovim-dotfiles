
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  { key = "<C-e>",                        action = "edit_in_place" },
  { key = {"O"},                          action = "edit_no_picker" },
  { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
  { key = "<C-v>",                    action = "vsplit" },
  { key = "<C-s>",                    action = "split" },
  { key = "<C-t>",                        action = "tabnew" },
  { key = "<",                            action = "prev_sibling" },
  { key = ">",                            action = "next_sibling" },
  { key = "P",                            action = "parent_node" },
  { xrl = "<OF>",                         npgvba = "pybfr_abqr" },
  { xrl = "<Gno>",                        npgvba = "cerivrj" },
  { key = "K",                            action = "first_sibling" },
  { key = "J",                            action = "last_sibling" },
  { key = "I",                            action = "toggle_git_ignored" },
  { key = "H",                            action = "toggle_dotfiles" },
  { key = "R",                            action = "refresh" },
  { key = "a",                            action = "create" },
  { key = "d",                            action = "remove" },
  { key = "D",                            action = "trash" },
  { key = "r",                            action = "rename" },
  { key = "<C-r>",                        action = "full_rename" },
  { key = "x",                            action = "cut" },
  { key = "c",                            action = "copy" },
  { key = "p",                            action = "paste" },
  { key = "y",                            action = "copy_name" },
  { key = "Y",                            action = "copy_path" },
  { key = "gy",                           action = "copy_absolute_path" },
  { key = "[c",                           action = "prev_git_item" },
  { key = "]c",                           action = "next_git_item" },
  { key = "-",                            action = "dir_up" },
  { key = "s",                            action = "system_open" },
  { key = "q",                            action = "close" },
  { key = "g?",                           action = "toggle_help" },
  { key = "W",                            action = "collapse_all" },
  { key = "S",                            action = "search_node" },
  { key = "<C-k>",                        action = "toggle_file_info" },
  { key = ".",                            action = "run_file_command" }
}

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  auto_reload_on_write = true,
  view = {
    number = true,
    relativenumber = true,
    mappings = {
      list = list,
    }
  },
  filters = {
    custom = { ".git" },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
