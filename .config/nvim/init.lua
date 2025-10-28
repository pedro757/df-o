-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.options")
require("config.variables")
require("config.lazy")
require("config.keymaps")
vim.cmd("source $HOME/.config/nvim/vim/abbrev.vim")
vim.cmd("source $HOME/.config/nvim/vim/functions.vim")
require("config.autocmds")
