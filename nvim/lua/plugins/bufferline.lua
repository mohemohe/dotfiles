return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      middle_mouse_command = function(n) vim.cmd("bd! " .. n) end,
      show_buffer_close_icons = true,
      show_close_icon = true,
    }
  }
}