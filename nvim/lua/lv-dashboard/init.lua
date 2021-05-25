vim.g.dashboard_custom_header = {

   ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
   ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
   ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
   ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
   ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
   ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',

}
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
    a = {
        description = {'  Projects           '},
        command = 'Telescope project'
    },
    b = {
        description = {'  File Browser       '},
        command = 'RnvimrToggle'
    },
    c = {
        description = {'  Find File          '},
        command = 'Telescope find_files'
    },
    d = {
        description = {'  Recently Used Files'},
        command = 'Telescope oldfiles'
    },
    e = {
        description = {'  Find Word          '},
        command = 'Telescope live_grep'
    },
    f = {
        description = {'  Keywmaps           '},
        command = ':e ~/.config/nvim/lua/keymappings.lua'
    },
    g = {
        description = {'  Settings           '},
        command = ':e ~/.config/nvim/lua/settings.lua'
    },
}

vim.g.dashboard_custom_footer = {}
