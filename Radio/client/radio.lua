-- client/radio.lua

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
  key = "INPUT_PICKUP" -- The key that players can use to change the radio station
}

-- Load the configuration file
Citizen.CreateThread(function()
  local cfg = LoadResourceFile(GetCurrentResourceName(), "config/client.yml")
  if cfg then
    config = yaml.decode(cfg)
  end
end)

-- Define the radio stations
local radioStations = {
  {
    name = "My Radio Station",
    url = "https://cdn.cybercdn.live/Pervoia/Audio/icecast.audio"
  }
}

-- Load the radio station configuration from the radio-settings.yml file
Citizen.CreateThread(function()
  local cfg = LoadResourceFile(GetCurrentResourceName(), "radio-settings.yml")
  if cfg then
    radioStations = yaml.decode(cfg)
  end
end)

-- Register a custom menu type for the radio station menu
ESX.UI.Menu.RegisterType("radio_station", function(data)
  local elements = {}

  -- Add a label to the menu
  table.insert(elements, {
    label = "Press " .. config.key .. " to change the radio station"
  })

  -- Add each radio station to the menu
  for i,station in ipairs(radioStations) do
    table.insert(elements, {
      label = station.name,
      value = station.url
    })
  end

  return {
    type = "menu",
    name = "radio_station",
    title = "Radio Station",
    elements = elements
  }
end)

-- Set the audio flag to allow custom URLs to be played as radio stations
SetAudioFlag("AllowCustomUrl", true)

-- Add each radio station to the game
Citizen.CreateThread(function()
  for i,station in ipairs(radioStations) do
    AddRadioStation(station.name, station.url)
  end
end)

-- Main loop
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

-- Check if the player is in a vehicle
local playerPed = PlayerPedId()
if IsPedInAnyVehicle(playerPed, false) then
  -- Check if the player pressed the horn button
  if IsControlJustPressed(0, 86) then
    -- Open the radio menu
    ESX.UI.Menu.Open("radio_station", {}, function(data, menu)
      -- Set the radio station
      SetMobileRadioEnabledDuringGameplay(true)
      SetRadioToStationName(data.current.value)

      -- Notify the player that the radio station was changed
      ESX.ShowNotification("The radio station was changed to " .. data.current.label .. ".")

      -- Close the radio menu
      menu.close()
    end, function(data, menu)
      -- Close the radio menu
      menu.close()
    end)
  end
end
end)
