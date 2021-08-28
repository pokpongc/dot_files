local nightfox = require('nightfox')
nightfox.setup({
  fox = "nordfox", -- change the colorscheme to use nordfox
  styles = {
    comments = "italic", -- change style of comments to be italic
    functions = "bold" -- styles can be a comma separated list
  },
  colors = {
  },
  hlgroup = {
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
