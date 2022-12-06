Keys = {
  ['M'] = 244,
  -- Add other keys here
}

-- Add a function to handle when a player tries to enter a vehicle
function onVehicleEntered(player, vehicle)
  local doorLockStatus = GetVehicleDoorLockStatus(vehicle)
  local plateText = GetVehicleNumberPlateText(vehicle)

  if doorLockStatus == nil or plateText == nil then
    -- Handle the case where the vehicle is not valid
  else
    -- Check if the vehicle is locked to the player
    local locked = doorLockStatus == 1 and plateText == player.identifier

    -- If the vehicle is locked to the player, allow them to enter it
    if locked then
      CancelEvent()
    else
      -- If the vehicle is not locked to the player, show an error message
      ESX.ShowNotification('This vehicle is locked to another player')
    end
  end
end

-- Add a function to handle when a player presses the M key
function onKeyPressed(player, key)
  -- Check if the player is in a vehicle and the M key is pressed
  if key == Keys['M'] and IsPedInAnyVehicle(player) then
    local vehicle = GetVehiclePedIsIn(player)

    local doorLockStatus = GetVehicleDoorLockStatus(vehicle)
    local plateText = GetVehicleNumberPlateText(vehicle)

    if doorLockStatus == nil or plateText == nil then
      -- Handle the case where the vehicle is not valid
    else
      -- Check if the vehicle is already locked to the player
      local locked = doorLockStatus == 1 and plateText == player.identifier

      -- If the vehicle is not locked to the player, lock it to them
      if not locked then
        SetVehicleDoorsLockedForPlayer(vehicle, player)
        ESX.ShowNotification('The vehicle is locked')
      else
        -- If the vehicle is already locked to the player, unlock it
        SetVehicleDoorsLockedForPlayer(vehicle, player, false)
        ESX.ShowNotification('The vehicle is unlocked')
      end
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
