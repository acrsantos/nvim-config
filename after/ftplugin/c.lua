-- Define a function to get the filename of the current buffer
local function get_current_filename()
    return vim.fn.expand("%:t") -- Get the filename without the path
end

-- Define a key mapping for a command using the current filename
vim.api.nvim_set_keymap('n', '<Leader>a', ':!c ' .. get_current_filename() .. '<CR>', {noremap = true, silent = true})

