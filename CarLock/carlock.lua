-- Set up the ESX framework
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Add a function to handle when a player tries to enter a vehicle
function onVehicleEntered(player, vehicle)
  -- Check if the vehicle is locked to the player
  local locked = GetVehicleDoorLockStatus(vehicle) == 1 and GetVehicleNumberPlateText(vehicle) == player.identifier

  -- If the vehicle is locked to the player, allow them to enter it
  if locked then
    CancelEvent()
  end
end

-- Add a function to handle when a player presses the M key
function onKeyPressed(player, key)
  -- Check if the player is in a vehicle and the M key is pressed
  if key == Keys['M'] and IsPedInAnyVehicle(player) then
    local vehicle = GetVehiclePedIsIn(player)

    -- Check if the vehicle is already locked to the player
    local locked = GetVehicleDoorLockStatus(vehicle) == 1 and GetVehicleNumberPlateText(vehicle) == player.identifier

    -- If the vehicle is not locked to the player, lock it to them
    if not locked then
      SetVehicleDoorLocked(vehicle, 1)
      SetVehicleNumberPlateText(vehicle, player.identifier)
      ESX.ShowNotification('The vehicle is locked')
    else
      -- If the vehicle is already locked to the player, unlock it
      SetVehicleDoorLocked(vehicle, 0)
      ESX.ShowNotification('The vehicle is unlocked')
    end
  end
end

-- Register the onVehicleEntered and onKeyPressed events
AddEventHandler('esx:onPlayerVehicleEnter', onVehicleEntered)
AddEventHandler('esx:playerLoaded', function(player)
  Citizen.CreateThread(function()
    while true do
      Wait(0)
      if IsControlPressed(0, Keys['M']) then
        onKeyPressed(player, Keys['M'])
      end
    end
  end)
end)
