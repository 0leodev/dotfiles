return {
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
}
