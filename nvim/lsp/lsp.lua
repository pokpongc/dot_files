require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.vimls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                underline = true,
                signs = false,
        }
)

require("nvim-gps").setup({
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' '      -- Methods (functions inside class-like objects)
	},
	languages = {                    -- You can disable any language individually here
		["c"] = true,
		["cpp"] = true,
		["go"] = true,
		["java"] = true,
		["javascript"] = true,
		["lua"] = true,
		["python"] = true,
		["julia"] = true,
		["rust"] = true,
	},
	separator = '  ',
})

require("trouble").setup{
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "<esc>", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        toggle_fold = {"o", "<cr>"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = ""
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
local saga = require 'lspsaga'

use_saga_diagnostic_sign = true
saga.init_lsp_saga {
 error_sign = '',
 warn_sign = '',
 hint_sign = '',
 infor_sign = '',
 dianostic_header_icon = '   ',
 code_action_icon = ' ',
 code_action_prompt = {
   enable = true,
   sign = true,
   sign_priority = 20,
   virtual_text = true,
 },
 finder_definition_icon = '  ',
 finder_reference_icon = '  ',
 max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
 definition_preview_icon = '  ',
 border_style = "",
 rename_prompt_prefix = '➤',
}

require('lspkind').init({
    with_text = false,
    preset = symbol_map,
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})


