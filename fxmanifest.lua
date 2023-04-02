fx_version 'adamant'

game 'gta5'

author 'Nasko'

description 'nFramework'

version '1.0'

shared_scripts {
    "Config.lua",
    "tables/*.lua",
    "modules/**/shared/*.lua",
    "api/define.lua",
    "utils/shared/*.lua",
}

server_scripts {
    "modules/**/server/*.lua",
    "api/server/*.lua",
    "utils/server/*.lua",
}

client_scripts {
    "modules/**/client/*.lua",
    "api/client/*.lua",
    "utils/client/*.lua",

    "vendors/lib/RMenu.lua",
    "vendors/lib/menu/RageUI.lua",
    "vendors/lib/menu/Menu.lua",
    "vendors/lib/menu/MenuController.lua",
    "vendors/lib/components/*.lua",
    "vendors/lib/menu/elements/*.lua",
    "vendors/lib/menu/items/*.lua",
    "vendors/lib/menu/panels/*.lua",
    "vendors/lib/menu/windows/*.lua",
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/main.js',
    'html/style.css',
}