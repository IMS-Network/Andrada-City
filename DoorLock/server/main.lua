-- server/main.lua

-- Define the ESX framework
ESX = nil

-- Wait for the ESX framework to be loaded
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Register server events
RegisterServerEvent('doorlock:updateState')

-- Define event handlers
AddEventHandler('doorlock:updateState', function(doorId, state)
  -- Update the door state in the database
  MySQL.Async.execute('UPDATE doors SET state = @state WHERE id = @doorId', {
    ['@state'] = state,
    ['@doorId'] = doorId
  })
end)
