---@type LazySpec
return {
  {
    "NeogitOrg/neogit",

    config = function()
      require("plugins.git.neogit")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("plugins.git.signs")
    end,
  },
}
