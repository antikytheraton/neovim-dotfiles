local M = {}

M.config = {
    highlight_group = "STS_highlight",
    disable_no_instance_found_report = false,
    default_desired_types = {
        "function",
        "function_declaration",
        "method_declaration",
        "call_expression",
        -- "type_declaration",
        "struct_type",
        "interface_type",
        "if_statement",
        "else_clause",
        "else_statement",
        "elseif_statement",
        "for_statement",
        "while_statement",
        "switch_statement",
    },
    left_hand_side = "fdsawervcxqtzb",
    right_hand_side = "jkl;oiu.,mpy/n",
    icon_dictionary = {
        ["if_statement"] = "",
        ["else_clause"] = "",
        ["else_statement"] = "",
        ["elseif_statement"] = "",
        ["for_statement"] = "ﭜ",
        ["while_statement"] = "ﯩ",
        ["switch_statement"] = "ﳟ",
        ["function"] = "",
        ["function_definition"] = "",
        ["variable_declaration"] = "",
    },
}

M.setup = function()
    local status_ok, sts = pcall(require, "syntax-tree-surfer")
    if not status_ok then
        return
    end

    -- Syntax Tree Surfer V2 Mappings
    -- Targeted Jump with virtual_text
    local opts = { noremap = true, silent = true }
    -- filtered_jump --
    vim.keymap.set("n", "]s", function() -- jump to all that you specify
        sts.filtered_jump("default", true) --> true means jump forward
    end, opts)
    vim.keymap.set("n", "[s", function() -- jump to all that you specify
        sts.filtered_jump("default", false) --> false means jump backwards
    end, opts)

    sts.setup(M.config)
end

return M
