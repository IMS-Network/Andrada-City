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

-- Load the radio settings from the configuration file
local radioSettings = {}
Citizen.CreateThread(function()
  local cfg = LoadResourceFile(GetCurrentResourceName(), "config/radio-settings.yml")
  if cfg then
    radioSettings = yaml.decode(cfg)
  end
end)

-- Register server events
RegisterServerEvent('radio:change')

-- Define event handlers
AddEventHandler('radio:change', function(station)
  -- Set the radio station for the player's vehicle
  local player = ESX.GetPlayerFromId(source)
  local vehicle = player.getInVehicle()
  if vehicle then
    SetVehicleRadioStation(vehicle, station)
  end
end)

-- Main loop
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    -- Get the player's vehicle
    local player = ESX.GetPlayerFromId(source)
    local vehicle = player.getInVehicle()

    -- Check if the player is in a vehicle
    if vehicle then
      -- Check if the player has pressed the radio change key
      if IsControlJustPressed(0, 172) then
        -- Open the radio change menu
        ESX.UI.Menu.Open("radio", {
          title = "Radio Stations",
          align = "left",
          elements = radioSettings.stations
        }, function(data, menu)
          -- Change the radio station
          menu.close()
          TriggerEvent('radio:change', data.current.name)

          -- Notify the player that the radio station was changed
          ESX.ShowNotification("Radio station changed to " .. data.current.name .. ".")
        end, function(data, menu)
          -- Close the radio change menu
          menu.close()
        end)
      end
    end
  end
end)
