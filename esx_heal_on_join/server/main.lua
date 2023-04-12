ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    TriggerClientEvent('esx_heal_on_join:healPlayer', playerId)

    TriggerClientEvent('esx:showNotification', playerId, 'Welcome! You have been healed!')
end)

RegisterNetEvent('esx_heal_on_join:healPlayer')
AddEventHandler('esx_heal_on_join:healPlayer', function()
    local playerId = source
    local ped = GetPlayerPed(playerId)

    SetEntityHealth(ped, 200)
end)
