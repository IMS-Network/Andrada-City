-- client/doorlock.lua

-- Define the ESX framework
ESX = nil

-- Wait for the ESX framework to be loaded
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Define the configuration options
local config = {
  key = "E" -- The key that players can use to lock and unlock doors
}

-- Load the configuration file
Citizen.CreateThread(function()
  local cfg = LoadResourceFile(GetCurrentResourceName(), "config/server.yml")
  if cfg then
    config = yaml.decode(cfg)
  end
end)

-- Define the door list
local doorList = {}

-- Register a custom menu type for the door lock menu
ESX.UI.Menu.RegisterType("doorlock", function(data)
  local elements = {}

  -- Add a label to the menu
  table.insert(elements, {
    label = "Press " .. config.key .. " to lock/unlock the door"
  })

  return {
    type = "menu",
    name = "doorlock",
    title = "Door Lock",
    elements = elements
  }
end)

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
        -- Open the door lock menu
        ESX.UI.Menu.Open("doorlock", {}, function(data, menu)
          -- Check if the player pressed the key to lock or unlock the door
          if IsControlJustPressed(0, config.key) then
            -- Check if the door is locked
            if door.isLocked then
              -- Unlock the door
              door.isLocked = false
              ESX.Game.SetDoorState(door.object, false)

              -- Notify the player that the door is unlocked
              ESX.ShowNotification("The door is now ~g~unlocked~w~.")
            else
              -- Lock the door
              door.isLocked = true
              ESX.Game.SetDoorState(door.object, true)

              -- Notify the player that the door is locked
              ESX.ShowNotification("The door is now ~r~locked~w~.")
            end
          end
        end, function(data, menu)
          -- Close the door lock menu
          menu.close()
        end)
      end
    end
  end
end)

-- Update the door list
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    doorList = ESX.Game.GetDoorList()
  end
end)
   
