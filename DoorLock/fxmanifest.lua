fx_version 'adamant'

game 'gta5'

server_scripts {
  'server/main.lua',
  'server/doorlock.lua',
  '@mysql-async/lib/MySQL.lua',
}

client_scripts {
  'client/main.lua',
  'client/doorlock.lua',
}
