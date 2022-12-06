-- Door lock script for FiveM using the ESX framework

-- This script allows players to lock and unlock doors using the "E" key

-- Define the ESX framework
ESX = nil

-- Wait for the ESX framework to be loaded
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Define the door list
local doorList = {
  -- doorId: {object, lockStatus}
  [1] = {object = GetClosestObjectOfType(x, y, z, radius, model, isMission, p7, p8, p9), lockStatus = true},
  [2] = {object = GetClosestObjectOfType(x, y, z, radius, model, isMission, p7, p8, p9), lockStatus = true},
  ...
}

-- Main loop
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    -- Get the player's position
    local playerCoords = GetEntityCoords(PlayerPedId())

    -- Check if the player is near a door
    for i,door in pairs(doorList) do
      local doorCoords = GetEntityCoords(door.object)
      local distance = GetDistanceBetweenCoords(playerCoords, doorCoords, true)

      if distance <= 1.0 then
        -- Draw a text prompt on the player's screen
        SetTextComponentFormat("STRING")
        AddTextComponentString("Press E to lock/unlock the door")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        -- Check if the player pressed the "E" key
        if IsControlJustPressed(0, 38) then
          -- Check if the door is locked
          if door.lockStatus then
            -- Unlock the door
            door.lockStatus = false
            SetStateOfClosestDoorOfType(model, x, y, z, locked, p5, p6)

            -- Notify the player that the door is unlocked
            ESX.ShowNotification("The door is now ~g~unlocked~w~.")
          else
            -- Lock the door
            door.lockStatus = true
            SetStateOfClosestDoorOfType(model, x, y, z, locked, p5, p6)

            -- Notify the player that the door is locked
            ESX.ShowNotification("The door is now ~r~locked~w~.")
          end
        end
      end
    end
  end
end)
