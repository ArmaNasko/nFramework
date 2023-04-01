fx_version 'adamant'

game 'gta5'

author 'Nasko'

description 'nFramework'

version '1.0'

shared_scripts {
    "Config.lua",
    "modules/**/shared/*.lua",
}

server_scripts {
    "modules/**/server/*.lua",
}

client_scripts {
    "modules/**/client/*.lua",

    "lib/RMenu.lua",
    "lib/menu/RageUI.lua",
    "lib/menu/Menu.lua",
    "lib/menu/MenuController.lua",
    "lib/components/*.lua",
    "lib/menu/elements/*.lua",
    "lib/menu/items/*.lua",
    "lib/menu/panels/*.lua",
    "lib/menu/windows/*.lua",
}