fx_version 'cerulean'
game 'gta5'

author 'Prime'
description 'Script de Gunfight avec zones configurables'
version '1.0.0'

shared_script 'config.lua'
client_script 'client/main.lua'
server_script 'server/main.lua'

dependencies {
    'es_extended',
    'ox_inventory',
    'ox_lib'
}