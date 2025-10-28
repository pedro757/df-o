if not pcall(require, "lspconfig") then
  return
end
if not pcall(require, "null-ls") then
  return
end

vim.diagnostic.config({
  signs = false,
  virtual_text = {
    prefix = "●",
    spacing = 8,
  },
  update_in_insert = true,
  float = {
    border = "rounded",
    source = true,
  },
})
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.selene,
    -- null_ls.builtins.diagnostics.eslint_d,
    require("none-ls.diagnostics.eslint_d"),
    null_ls.builtins.diagnostics.revive,
    null_ls.builtins.formatting.stylua,
    require("none-ls.formatting.eslint_d"),
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.yapf,
    -- null_ls.builtins.formatting.rustfmt,
    require("none-ls.code_actions.eslint_d"),
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.gitsigns,

    null_ls.builtins.formatting.sql_formatter,
  },
})

local null_ls_stop = function()
  local null_ls_client
  for _, client in ipairs(vim.lsp.get_clients()) do
    if client.name == "null-ls" then
      null_ls_client = client
    end
  end
  if not null_ls_client then
    return
  end

  null_ls_client.stop()
end

vim.api.nvim_create_user_command("NullLsStop", null_ls_stop, {})

vim.lsp.enable("lua_ls")
vim.lsp.enable("tsgo")
vim.lsp.enable("emmet_language_server")
vim.lsp.enable("marksman")
vim.lsp.enable("dockerls")
vim.lsp.enable("prismals")
vim.lsp.enable("sqlls")

vim.lsp.config("tailwindcss", {
  root_dir = function(bufnr, on_dir)
    local root_files = {
      ".git",
    }
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(
      vim.fs.dirname(
        vim.fs.find(root_files, { path = fname, upward = true })[1]
      )
    )
  end,
})

vim.lsp.enable("tailwindcss")
