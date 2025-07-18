return {
  -- Auto dark mode
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    config = function()
      require("auto-dark-mode").setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.o.background = "dark"
          vim.cmd.colorscheme("catppuccin-mocha")
        end,
        set_light_mode = function()
          vim.o.background = "light"
          vim.cmd.colorscheme("catppuccin-latte")
        end,
      })
      require("auto-dark-mode").init()
    end,
  },
  -- Ensure catppuccin is installed with proper variants
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      -- Optional: customize catppuccin settings here
    },
  },
  -- Override LazyVim's default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}