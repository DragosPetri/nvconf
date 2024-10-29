return {
  {
    "javiorfo/nvim-soil",

    -- Optional for puml syntax highlighting:
    dependencies = { "javiorfo/nvim-nyctophilia" },

    lazy = true,
    ft = "plantuml",
    opts = {
      image = {
        darkmode = false, -- Enable or disable darkmode
        format = "svg", -- Choose between png or svg

        execute_to_open = function(img)
          return "nsxiv -b " .. img
        end,
      },
    },
  },
}
