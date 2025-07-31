-- ~/.config/nvim/lua/plugins/blink.lua
return {
  "blink.cmp",
  opts = {
    -- Disable blink.nvim's default mapping for <CR> (Enter)
    map_cr = false,
    -- Enable blink.nvim's mapping for <Tab> to confirm completion
    map_tab = true,
  },
}
