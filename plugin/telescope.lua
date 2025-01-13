-- Import the built-in functions from Telescope
local builtin = require('telescope.builtin')

-- Keybinding to find files in the current working directory
vim.keymap.set('n', '<leader>pf', builtin.find_files, {
    desc = 'Find files in the current working directory'
})

-- Keybinding to find files tracked by Git
vim.keymap.set('n', '<C-p>', builtin.git_files, {
    desc = 'Find files tracked by Git'
})

-- Keybinding to search for the word under the cursor (current word)
vim.keymap.set('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>") -- Get the word under the cursor
    builtin.grep_string({ search = word })
end, {
    desc = 'Search for the word under the cursor'
})

-- Keybinding to search for the WORD under the cursor (current WORD)
-- (WORD includes non-alphanumeric characters)
vim.keymap.set('n', '<leader>pWs', function()
    local word = vim.fn.expand("<cWORD>") -- Get the WORD under the cursor
    builtin.grep_string({ search = word })
end, {
    desc = 'Search for the WORD under the cursor'
})

-- Keybinding to search for a string input by the user
vim.keymap.set('n', '<leader>ps', function()
    local input = vim.fn.input("Grep > ") -- Prompt the user for a search term
    if input ~= "" then -- Only proceed if the input is not empty
        builtin.grep_string({ search = input })
    else
        print("Search term cannot be empty") -- Display a message if no input is provided
    end
end, {
    desc = 'Search for a user-provided string'
})

-- Keybinding to open the help tags (documentation)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {
    desc = 'Search for help tags'
})

