return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    smear_insert_mode = true,
    stiffness = 0.8,
    trailing_stiffness = 0.6,
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    damping = 0.95,
    damping_insert_mode = 0.95,
    time_interval = 16,
  },
  config = function(_, opts)
    require("smear_cursor").setup(opts)
  end,
}