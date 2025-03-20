fx_version 'cerulean'
game 'gta5'

author 'Prime'
description 'Script de Gunfight avec zones configurables'
version '1.0.0'

lua54 'yes'

shared_script 'config.lua'

client_script {
    'client/main.lua',
    '@ox_lib/init.lua'
}

server_script 'server/main.lua'

dependencies {
    'es_extended',
    'ox_inventory',
    'ox_lib'
}
