fx_version 'adamant'

game 'gta5'

description 'Door lock script for FiveM using the ESX framework'

version '1.0.0'

server_scripts {
  'server/main.lua',
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua'
}

client_scripts {
  'client/doorlock.lua',
  '@es_extended/locale.lua'
}

dependencies {
  'es_extended',
  'mysql-async'
}
