fx_version 'cerulean'
game 'gta5'

author 'enack'
description 'qb-casinojob by enack'
version '1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/garage.lua',
	'client/menus.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}
