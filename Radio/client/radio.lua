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

-- Define the custom radio station
local station = {
  name = "My Radio Station",
  url = "https://cdn.cybercdn.live/Pervoia/Audio/icecast.audio"
}

-- Load the radio station configuration from the radio-settings.yml file
Citizen.CreateThread(function()
  local cfg = LoadResourceFile(GetCurrentResourceName(), "radio-settings.yml")
  if cfg then
    station = yaml.decode(cfg)
  end
end)

-- Register a custom menu type for the radio station menu
ESX.UI.Menu.RegisterType("radio_station", function(data)
  local elements = {}

  -- Add a label to the menu
  table.insert(elements, {
    label = "Press ~INPUT_PICKUP~ to change the radio station"
  })

  return {
    type = "menu",
    name = "radio_station",
    title = "Radio Station",
    elements = elements
  }
end)

-- Set the audio flag to allow custom URLs to be played as radio stations
SetAudioFlag("AllowCustomUrl", true)

-- Add the custom radio station to the game
Citizen.CreateThread(function()
  AddRadioStation(station.name, station.url)
end)

-- Main loop
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    -- Check if the player is in a vehicle
    if IsPedInAnyVehicle(PlayerPedId(), false) then
      -- Check if the player pressed the input to open the radio station menu
      if IsControlJustPressed(0, 38) then
        -- Open the radio station menu
        ESX.UI.Menu.Open("radio_station", {}, function(data, menu)
          -- Check if the player pressed the input to change the radio station
          if IsControlJustPressed(0, 38) then
            -- Change the radio station
            SetRadioToStationName(station.name)

            -- Notify the player that the radio station was changed
            ESX.ShowNotification("Changed radio station
